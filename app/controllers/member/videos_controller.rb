class Member::VideosController < ApplicationController
  def index
    @genres = Genre.all
    @videos = Video.order(id: "DESC").page(params[:page])#順番・ページネーション
    if params[:genre_id] != nil
      @videos = Video.where(genre_id: params[:genre_id]).order(id: "DESC").page(params[:page])#順番・ページネーション
    end
  end

  def new
    @video = Video.new
    @genres = Genre.all
  end

  def create
    @video = Video.new(video_params)
    @video.member_id = current_member.id
    if @video.save
      redirect_to user_path(current_member.id)
    else
      @genres = Genre.all
      render :new
    end
  end

  def show
    @genres = Genre.all
    @video = Video.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to new_video_path
  end

  private

  def video_params
    params.require(:video).permit(:title, :explanation, :video, :image, :genre_id)
  end

end
