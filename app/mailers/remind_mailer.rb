class RemindMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.remind_mailer.remind.subject
  #
  def remind(user)
    @user = User.find_by(id: user)
    @tasks = @user.tasks
#    @todays_tasks = @tasks.select{|tdl| tdl.todays_todo? && tdl.status = false }
@todays_tasks = @tasks.select{|tdl| tdl.deadline ==  Date.today + 1 && tdl.status == false }
#    mail (to: @user.email, subject: "[#{Date.today}]のリマインド")
     mail to: @user.email, 
         subject: "[#{Date.today}]のリマインド"
  end
end
