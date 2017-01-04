require 'sqlite3'
require 'singleton'

class QuoraDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('quora.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class User
  attr_accessor :fname, :lname

  def self.all
    data = QuoraDBConnection.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_id(id)
    user = QuoraDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first)
  end

  def self.find_by_name(fname, lname)
    user = QuoraDBConnection.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ?, lname = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions(author_id)
    question = Question.find_by_author_id(author_id)
    raise "#{author_id} not found in DB" unless question

    questions = QuoraDBConnection.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL

      questions.map{ |question| Question.new(question) }
  end

  def authored_replies(user_id)
    reply = Reply.find_by_user_id(user_id)
    raise "#{user_id} not found in DB" unless reply

    replies = QuoraDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL

      replies.map{ |reply| Reply.new(reply) }
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end
end



class Question
  attr_accessor :title, :body, :author_id

  def self.all
    data = QuoraDBConnection.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

  def self.find_by_id(id)
    question = QuoraDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    return nil unless question.length > 0

    Question.new(question.first)
  end

  def author
    User.find_by_id(@author_id)
  end

  def replies
    reply = Reply.find_by_question_id(@id)
    raise "#{id} not found in DB" unless reply

    replies = QuoraDBConnection.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL

      replies.map{ |reply| Reply.new(reply) }
  end

  def self.find_by_author_id(author_id)
    question = QuoraDBConnection.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
    return nil unless question.length > 0

    Question.new(question.first)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

  def most_follwed(n)
    QuestionFollow.most_followed_questions(n)
  end
end



class Reply
  attr_accessor :question_id, :parent_reply_id, :body, :user_id
  def self.all
    data = QuoraDBConnection.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_id(id)
    reply = QuoraDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil unless reply.length > 0

    Reply.new(reply.first)
  end

  def author
    User.find_by_id(@user_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    Reply.find_by_id(@parent_reply_id)
  end

  def child_replies
    replies = QuoraDBConnection.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply_id = ?
    SQL

    return nil unless replies.length > 0

    replies.map{ |reply| Reply.new(reply) }
  end

  def self.find_by_user_id(user_id)
    reply = QuoraDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    return nil unless reply.length > 0

    Reply.new(reply.first)
  end

  def self.find_by_question_id(question_id)
    reply = QuoraDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    return nil unless reply.length > 0

    Reply.new(reply.first)
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_reply_id = options['parent_reply_id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end
end


class QuestionFollow

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.all
    data = QuoraDBConnection.instance.execute("SELECT * FROM question_follows")
    data.map { |datum| QuestionFollow.new(datum) }
  end


  def self.followers_for_question_id(question_id)
    users = QuoraDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        users
      JOIN question_follows
        ON question_follows.user_id = users.id
      WHERE
        question_id = ?
    SQL

    return nil unless users.length > 0

    users.map{ |user| User.new(user) }
  end

  def self.followed_questions_for_user_id(user_id)

    questions = QuoraDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      JOIN question_follows
        ON question_follows.question_id = questions.id
      WHERE
        user_id = ?
    SQL

    return nil unless questions.length > 0

    questions.map{ |question| Question.new(question) }
  end

  def self.most_followed_questions(n)
    questions = QuoraDBConnection.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        questions
      JOIN question_follows
        ON question_follows.question_id = questions.id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(question_follows.user_id)
    SQL

    questions.take(n).map{ |question| Question.new(question) }
  end
end

class QuestionLike
  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.likers_for_question_id(question_id)
    users = QuoraDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        users
      JOIN question_likes
        ON question_likes.user_id = users.id
      WHERE
        question_likes.question_id = ?
    SQL

    return nil unless users.length > 0

    users.map{ |user| User.new(user) }
  end

  def self.num_likes_for_question(question_id)
    users = QuoraDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(*)
      FROM
        users
      JOIN question_likes
        ON question_likes.user_id = users.id
      WHERE
        question_likes.question_id = ?
    SQL

  end


  def self.num_likes_for_question(question_id)
  end
end

#
# QuestionFollow::followers_for_question_id(question_id)
# This will return an array of User objects!
# QuestionFollow::followed_questions_for_user_id(user_id)
# Returns an array of Question objects.
# User#followed_questions
# One-liner calling QuestionFollow method.
# Question#followers
# One-liner calling QuestionFollow method.
