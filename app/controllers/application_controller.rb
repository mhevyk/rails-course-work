class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def render_404
    render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false
  end
end