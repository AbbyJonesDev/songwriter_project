class ContactMailer < ActionMailer::Base
  default to: ENV['EMAIL_TO']

  def send_message(contact)
    mail(
      from: contact.email,
      subject: "Contact from website",
      body: contact.message,
      content_type: 'text/plain'      
      ).deliver!
  end

end
