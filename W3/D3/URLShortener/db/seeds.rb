# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.transaction do

  User.destroy_all
  user1 = User.create(:name => "CJ", :email => "cj@gmail.com")
  user2 = User.create(:name => "Flarnie", :email => "flarnie@gmail.com")


  ShortenedUrl.destroy_all
  url1 = ShortenedUrl.create(:long_url => "longurl1", :short_url => "short_url1", :user_id => user1.id)
  url2 = ShortenedUrl.create(:long_url => "longurl2", :short_url => "short_url2", :user_id => user2.id)


  Visit.destroy_all
  visit1 = Visit.create(:user_id => 1, :shortened_url_id => 1, :created_at => Time.now)
  visit2 = Visit.create(:user_id => 2, :shortened_url_id => 1, :created_at => Time.now)
end
