class NewsController < ApplicationController
  def index
    @exposures = Exposure.recent
    @all_count = Exposure.ruby_true.count
  end
end
