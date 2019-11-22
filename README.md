# README

# StudyBuddy444-G1
This is a web app that can be used to find study group on campus. 

The application is implimented using Ruby on Rails

# Change log
v 0.0.0 Welcome page and controller (pair programming - group)

v 0.0.1 Added user sign up and authentication with devise gem (Jamie)

v 1.0.0 Added MVC for users to create new posts (pair programming - Charlie/Alireza)

v 1.0.1 Updated design for posts: allows users to see all posts and the user that posted (pair programming - group)

v 1.0.2 Add an about page (Ahmed)

# To Do

1. Add functionality for users to add resources to posts

2. Add functionality to allow multiple users to join and update posts

3. Add functionality for note sessions and repository

4. Create dashboard for users to view own sessions and notes

5. Add system for payment of services between users 

6. Add Registration Page

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


