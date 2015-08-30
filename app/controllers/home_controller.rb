class HomeController < ApplicationController
  def index
    @exposures = Exposure.recent
  end
end
