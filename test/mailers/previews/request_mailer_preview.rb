# Preview all emails at http://localhost:3000/rails/mailers/request_mailer
class RequestMailerPreview < ActionMailer::Preview
  def user_approval
    RequestMailer.user_approval(Request.last)
  end

  def user_decline
    RequestMailer.user_decline(Request.last)
  end

  def notify_user
    RequestMailer.notify_user(Request.last)
  end
end
