class NotificationMailer < ApplicationMailer
    def alert_symp(to)
      mail(bcc: to, subject: '¡ Alert covid with a shared place !').deliver_now
    end

    def alert_test(to)
      mail(bcc: to, subject: '¡ Alert covid with a shared place !').deliver_now
    end
end