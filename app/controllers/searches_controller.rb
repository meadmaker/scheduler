class SearchesController < ApplicationController
  respond_to :xml, :html
  
  def index
    @searches = ["All"]
    respond_with @searches
  end
end
