Rails.application.routes.draw do
  # =========================
  # ROOT REDIRECT (redirect to default locale)
  # =========================

  # =========================
  # LOCALE SUPPORTED ROUTES
  # =========================
  scope "(:locale)", locale: /en|de|nl/ do
  root "pages#home"

  get "about", to: "pages#about"
  get "contact", to: "pages#contact"
    # Add more pages here later
    # get "about", to: "pages#about"
    # get "contact", to: "pages#contact"
    post "contact", to: "pages#create_contact"
  end

  # =========================
  # HEALTH CHECK (DO NOT LOCALIZE)
  # =========================
  get "up" => "rails/health#show", as: :rails_health_check

  # =========================
  # OPTIONAL PWA (kept disabled)
  # =========================
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
