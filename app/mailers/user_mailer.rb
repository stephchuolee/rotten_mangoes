class UserMailer < ApplicationMailer 
  default from: "deleted@example.com"


  # will automatically look for layout in user_mailer with 
  # .html.erb file that is the same name as the method: 

  # def post_user_delete_email(user)
  #   @user = user 
  #   mail(to: @user.email,
  #     subject: 'Your account has been deleted')
  # end 

  # for a custom template: 
  
  def post_user_delete_email(user)
    @user = user 
    mail(to: @user.email,
      subject: 'Your account has been deleted',
      template_name: 'blah')
  end

end 