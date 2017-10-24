class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  def sendmail_blog
    @greeting = "TEST"

    mail to: "aj07333@yahoo.co.jp",
         subject: 'テストメールを送信しました。'
  end
end