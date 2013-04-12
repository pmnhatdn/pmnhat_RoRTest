class StaticPagesController < ApplicationController

  def home
   @entry = current_user.entries.build if signed_in?
   @feed_items = current_user.feed.paginate(page: params[:page],:per_page => 6) if signed_in?
  end

  def profile
	user=self.current_user
	if user
		redirect_to root_url
	else
		ridirect_to signin
	end
  end
  
end
