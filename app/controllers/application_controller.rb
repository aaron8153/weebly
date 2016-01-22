class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  layout :layout_by_resource

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'new'
      "devise"
    else
      "application"
    end
  end

  def data_cache(key, time=10.minutes)
    return yield if ActionController::Base.perform_caching.blank?
    output = Rails.cache.fetch(key, {expires_in: time}) do
      yield
    end
    return output
  rescue
    #Fail
    return yield
  end
end
