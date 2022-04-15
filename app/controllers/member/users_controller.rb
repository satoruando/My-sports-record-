class Member::UsersController < ApplicationController

  def show
    @genres = Genre.all
    @member = Member.find(params[:id])
    @videos = Video.where(member_id: params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to user_path(@member.id)
  end

  def unsubscribe
  end

  def withdraw
    @member = current_member
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @member.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  #いいね一覧
  def nices
    @member = Member.find(params[:id])
    nices= Nice.where(member_id: @member.id).pluck(:video_id)
    @nice_videos = Video.find(nices)
  end

  private

  def member_params
    params.require(:member).permit(:last_name, :first_name, :image)
  end

end
