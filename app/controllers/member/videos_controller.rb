class Member::VideosController < ApplicationController
  def index
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.member_id = current_member.id
    @video.save
    redirect_to user_path(current_member.id)
  end

  def show
    @video = Video.find(params[:id])
  end

  def destroy
  end

  private

  def video_params
    params.require(:video).permit(:title, :explanation, :video, :genre_id)
  end

end
