class Member::NicesController < ApplicationController

  def create
    @video = Video.find(params[:video_id])
    nice = current_member.nices.new(video_id: @video.id)
    nice.save
    #redirect_to video_path(video.id)
  end

  def destroy
    @video = Video.find(params[:video_id])
    nice = current_member.nices.find_by(video_id: @video.id)
    nice.destroy
    #redirect_to video_path(video.id)
  end

end
