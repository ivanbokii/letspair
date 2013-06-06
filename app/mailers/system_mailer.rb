class SystemMailer < ActionMailer::Base
  default from: "bmo@letspair.net"

  def pair_message(to_email, from_email, message, session)
    @email = from_email
    @message = message
    @session = session

    mail to: to_email, subject: 'New pair message!'
  end
end
