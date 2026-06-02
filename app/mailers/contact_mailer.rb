class ContactMailer < ApplicationMailer
  def contact_email
    @name = params[:name]
    @message = params[:message]
    @sender_email = params[:email]

    mail(
      to: "kevin.stal@gmx.ch",
      subject: "New contact form message",
      reply_to: @sender_email
    )
  end
end
