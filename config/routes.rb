Rails.application.routes.draw do
  # =========================
  # LOCALE SUPPORTED ROUTES
  # =========================
  scope "(:locale)", locale: /en|de|nl/ do
    # Root page (localized)
    root "pages#index"

    # Pages
    get "pages/index"

    # Add more pages here later
    # get "about", to: "pages#about"
    # get "contact", to: "pages#contact"
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
