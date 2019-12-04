# README

# StudyBuddy444-G1
This is a web app that can be used to find study group on campus. 

The application is implimented using Ruby on Rails

# Work breakdown
Profiles - Jamie
Notes - Charlie
Groups - Ahmed
Buddies - Alireza
Payments - Kevin
Dashboard - All
Home - All
UI - All

# Testing strategy
Manually tested each function the moment it is completed by observing if it is acting in the correct way (correct inputs, outputs, behaviour)
Continuous Testing - each time new features where implemented, multiple members would test in our own environments
Automated tests such would have been nice

# Development Strategy
Behaviour-Driven Development
Created user stories of what we want to achieve, then figure out how to implement it technically

# Easy, interesting and difficult features
What we found easy or interesting
1. Gems provide lots of additional functionalities
2. Seeding data was a quick way to breathe life into application
3. MVC structure was a very neat way of organizing code and dividing responsibility

What we found difficult
1. Integrating custom front end within the rails framework
2. Dealing with attachments and other external files - especially in seeding

# Steps to follow after cloning

1. brew services start postgresql
2. yarn install
3. (if first clone) rails db:create
3. rails db:migrate
4. rails s

  After your session you can run brew services stop Postgresql.
  
# How to Test payment
When the Paypal login page showed up, sign in with the following account: \
account: student_dev@studybuddy.ca \
password: 12345678 \
this account don't use real money, so go wild 


# Seeding
1. rails db:drop
2. rails db:create
3. rails db:migrate
4. rails db:seed

note that all users have the same password: "password"
to see list of all users:
open up terminal
 1. $ rails c
 2. $ User.all
 
 
# Forgot Password

Unfortunately, because the sendgrid password and username where commited to the github repo, the sendgrid account has been suspended. Prior to this, the emails containing the password reset token were being sent and the user was able to reset their password if they forgot it. An image has been uploaded to the repo to demonstrate the working functionality.
https://github.com/KevinUTAT/StudyBuddy444-G1/blob/master/FORGOT%20PASSWORD%20WORKS.png
