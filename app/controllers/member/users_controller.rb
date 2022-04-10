class Member::UsersController < ApplicationController
  def show
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
    @member = Member.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @member.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def member_params
    params.require(:member).permit(:last_name, :first_name, :image)
  end

end
