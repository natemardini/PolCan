class ForumsController < ApplicationController
  
  def show
    @discussions = Forum.find(params[:id]).discussions
  end
  
end