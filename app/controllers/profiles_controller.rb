class ProfilesController < ApplicationController
  def show
      @posts = User.find(params[:id])
  end
end
