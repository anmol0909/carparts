class MembersController < ApplicationController
  before_action :set_member, only: [:edit, :update, :destroy]

  def index
    @members = Member.all.order(created_at: :desc)
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to members_path, notice: "Member created successfully."
    else
      render :new
    end
  end

  def update
    if @member.update(member_params)
      redirect_to members_path, notice: "Member updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @member.destroy
    redirect_to members_path, notice: "Member deleted successfully."
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:name, :email, :phone_number)
  end
end
