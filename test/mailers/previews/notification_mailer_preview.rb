class NotificationMailerPreview < ActionMailer::Preview

    def alert_symp
      NotificationMailer.with(user: User.last).alert_symp.deliver_now
    end

end