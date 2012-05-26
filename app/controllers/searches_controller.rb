class SearchesController < ApplicationController
  def create
    @search = Search.create!(params[:search])    
    redirect_to @search
  end
  def show
    @search = Search.find(params[:id])
  end
end
