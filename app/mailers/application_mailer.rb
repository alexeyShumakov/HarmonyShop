class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'

  def welcome_email(email)
    @email = email
    mail(to: email, subject: 'hello')
  end
end
