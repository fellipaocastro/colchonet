class Signup < ActionMailer::Base
  default from: 'no-reply@colcho.net'

  def confirm_email(user)
    @user = user
    @confirmation_link = root_url

    mail({
      to: user.email,
      bcc: ['sign ups <contact@fellipecastro.com>'],
      subject: I18n.t('signup_mailer.confirm_email.subject')
    })
  end
end
