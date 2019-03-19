class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    another_micropost = Micropost.find(params[:micropost_id])
    current_user.like(another_micropost)  
    flash[:success] = 'お気に入りにしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    another_micropost = Micropost.find(params[:micropost_id])
    current_user.dislike(another_micropost)  
    flash[:success] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end

end
