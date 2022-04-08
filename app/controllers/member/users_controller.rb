class Member::UsersController < ApplicationController
  def show
  end

  def edit
  end

  def update
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
end
