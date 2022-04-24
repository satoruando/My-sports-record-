class HomesController < ApplicationController
  def top
    redirect_to user_path(current_member.id) if member_signed_in?
    redirect_to admin_genres_path if admin_signed_in?
  end

  def about
  end
end
