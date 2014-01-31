class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def notify_added(user)
    @user = user
    mail to: @user.email, subject: 'You have been added!'
  end
end
