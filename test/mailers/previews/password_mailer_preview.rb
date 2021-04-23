class PasswordMailerPreview < ActionMailer::Preview

    def reset
      PasswordMailer.with(user: User.last).reset.deliver_now
    end

end