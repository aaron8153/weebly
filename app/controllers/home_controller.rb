class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @pages = Page.all

  end
end
