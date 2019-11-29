# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

100.times do 
    User.create!(
        email: Faker::Internet.free_email,
        password: "password",
        password_confirmation: "password"    
    )
end

User.all.each do |user|
    body = "Quick summary about my experiences here"

    Page.create!(
        name: Faker:: Name.unique.name,
        about_me: body,
        user_id: user.id,
        #avatar: Faker::Avatar.image
    )
end

100.times do
    Group.create!(
        category: ["ECE444", "CSC411", "ECO250", "SPA100", "PHY294"].sample,
        description: ["Studying for midterm","Working on assignment 1","Finishing project","Writing lab report","Studying for the final","Problem set 4"].sample,
        date: ["2019-12-19","2019-12-29","2019-11-29","2019-12-08"].sample,
        time: ["21:30:00","12:30:00","15:30:00","18:30:00"].sample,
        duration: [1,2,3,4].sample,
        location: ["Bahen","Sanford Fleming","Galbraith","Victoria College"].sample,
        capacity: [1,2,3,4,0].sample,
        user_id: [*1..100].sample
    )
end