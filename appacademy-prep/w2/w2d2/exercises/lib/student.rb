class Student

  attr_reader :courses, :first_name, :last_name, :name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    @name = "#{@first_name} " + "#{@last_name}"
  end

  def enroll(course)
    @courses.each do |el|
      if el.conflicts_with?(course)
        raise "error"
      end
    end
    if !@courses.include?(course)
      @courses << course
      course.students << self
    end
  end

  def course_load
    course_hash = Hash.new(0)
    self.courses.each do |course|
      course_hash[course.department] += course.credits
    end
    course_hash
  end


end
