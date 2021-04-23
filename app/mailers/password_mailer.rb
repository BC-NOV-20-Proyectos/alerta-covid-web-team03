class PasswordMailer < ApplicationMailer

    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.password_mailer.reset.subject
    #
    def reset
      @token = params[:user].signed_id(purpose: "password_reset", expires_in: 15.minutes)
  
      mail to: params[:user].email
    end

    def alert(places_tk, user_email)
      @places_tk = places_tk
      @user_email = user_email

      mail(to: @user_email, subject: 'Covid Alert!')
    end
  end