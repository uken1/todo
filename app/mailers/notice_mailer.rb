class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  def sendmail_blog(user)
    @user = user

    mail to: "#{@user.email}", subject: "Hello, #{@user.name}"
  end
end
