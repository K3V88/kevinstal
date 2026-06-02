class PagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end

  def create_contact
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
    Rails.logger.error("Contact form delivery failed: #{e.class}: #{e.message}")

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
