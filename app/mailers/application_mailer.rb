class ApplicationMailer < ActionMailer::Base
  default from: 'covid@example.com'
  layout 'mailer'

  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end
end
