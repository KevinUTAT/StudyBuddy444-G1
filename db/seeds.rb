# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
require 'uri'

users = JSON.parse(File.read('db/user_data.json'))

for userData in users do

    url = userData["photo"]
    filename = File.basename(URI.parse(url).path)
    file = URI.open(url)
  
    user = User.create!(
        email: userData["email"],
        password: "password",
        password_confirmation: "password",
        balance: 0
    )

    page = Page.create!(
        name: userData["name"],
        about_me: userData["position"],
        user_id: user.id,
    )

    page.avatar.attach(io: file, filename: filename)

    resume = ["craig_novak.pdf","gary_garrison.pdf","gregory_hoffman.pdf","jonathan_philips.pdf", "Lee_silvaro.pdf", "micheal_sierra.pdf", "robert_noberg.pdf", "robert_turner.pdf", "sam_williamson.pdf"].sample
    page.resume.attach(
        io: File.open("db/fakeResumes/#{resume}"), 
        filename: resume)

    transcript = ["David_hudgings.pdf","Mohammad_mannan.pdf","scott_lang.pdf"].sample
    page.transcript.attach(
        io: File.open("db/fakeTranscripts/#{transcript}"), 
        filename: transcript)

end

50.times do
    Group.create!(
        category: ["ECE444", "CSC411", "ECO250", "SPA100", "PHY294"].sample,
        description: ["Studying for midterm","Working on assignment 1","Finishing project","Writing lab report","Studying for the final","Problem set 4"].sample,
        date: ["2019-12-19","2019-12-29","2019-11-29","2019-12-08"].sample,
        time: ["21:30:00","12:30:00","15:30:00","18:30:00"].sample,
        duration: [1,2,3,4].sample,
        location: ["Bahen","Sanford Fleming","Galbraith","Victoria College"].sample,
        capacity: [1,2,3,4,0].sample,
        user_id: [*1..50].sample
    )
end