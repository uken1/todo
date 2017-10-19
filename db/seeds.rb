# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dhh = User.create do |user|
     user.name = "dhh"
     user.email = "dhh@rails.com"
     user.birthday = "1979-10-15"
     user.password = "password"
end

(1..20).each do |i|
    Task.create do |task|
        task.name = "task #{i}"
        task.deadline = i.days.since
        task.status = false
        task.user_id = (i <= 10 ? dhh.id : matz.id)
    end
end