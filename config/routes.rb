Rails.application.routes.draw do
  get "/stream", to: "stream_text#index"

  root "dashboard#index"
end
