class Member::SearchesController < ApplicationController
  before_action :authenticate_member!


  def search
    @range = params[:range]

    if @range == "Member"
      @members = Member.looks(params[:search], params[:word])
    else
      @videos = Video.looks(params[:search], params[:word]).order(id: "DESC").page(params[:page])#順番・ページネーション
    end
  end

end