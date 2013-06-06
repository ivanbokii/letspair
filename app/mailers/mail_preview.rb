class MailPreview < MailView
  def pair_message
    email = 'test@gmail.com'
    message = 'hello, this is the test message'
    session = Pairsession.last

    mail = SystemMailer.pair_message('another_test@gmail.com', 
      email, message, session)
  end
end