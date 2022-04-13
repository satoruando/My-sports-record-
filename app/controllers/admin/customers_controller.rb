class Admin::CustomersController < ApplicationController

  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(customer_params)
      redirect_to admin_customer_path
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def customer_params
    params.require(:member).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :is_deleted )
  end

end
