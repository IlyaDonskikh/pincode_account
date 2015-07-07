class UserMailer < ApplicationMailer
  def create(user)
    @user = user

    mail to: user.email, subject: t('.title')
  end
end
