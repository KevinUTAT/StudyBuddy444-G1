ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address        =>  'smtp.sendgrid.net',
    :port           =>  '587',
    :authentication =>  :plain,
    :user_name      =>  Rails.application.credentials.sendgrid[:username],
    :password       =>  Rails.application.credentials.sendgrid[:password],
    :domain         =>  'https://stormy-depths-05731.herokuapp.com',
    :enable_starttls_auto => true
}