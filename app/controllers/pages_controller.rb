class PagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end

  def create_contact
    logger.warn "GMX password is: #{Rails.application.config.action_mailer.smtp_settings[:password].inspect}"
    ContactMailer.with(
      name: params[:name],
      email: params[:email],
      message: params[:message]
    ).contact_email.deliver_now

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "contact_form_container",
          partial: "pages/contact_thank_you"
        )
      end
      format.html { redirect_to contact_path, notice: "Message sent." }
    end
  rescue StandardError => e
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "contact_form_container",
          partial: "pages/contact_error",
          locals: { error: e.message }
        )
      end
      format.html { redirect_to contact_path, alert: "Unable to send message: #{e.message}" }
    end
  end
end
