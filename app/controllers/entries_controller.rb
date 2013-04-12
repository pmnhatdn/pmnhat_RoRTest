class EntriesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def create
	@entry = current_user.entries.build(params[:entry])
    if @entry.save
      flash[:success] = "Posted succcessfully!"
      redirect_to root_url
    else
      flash[:error] = "Unsuccessfully"
      redirect_to root_url
    end
  end

  def destroy
  end
end
