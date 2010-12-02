class SearchesController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @searches = ["All"]
    respond_with @searches
  end
end
