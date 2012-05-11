
class StoreController < ApplicationController
  skip_before_filter :authorize
  def index
    if params[:set_locale]
      redirect_to store_path(locale: params[:set_locale])
    else
      @products = Product.order(:title)
      @cart = current_cart
    end

    latest = Product.latest
    fresh_when etag: latest, last_modified: latest.created_at.utc
    expires_in 10.minutes, public: true
  end
end
