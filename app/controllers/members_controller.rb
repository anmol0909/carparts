class MembersController < ApplicationController
  def index
    members = Member.all
    render json: members.as_json(only: [:name, :email, :phone_number])
  end
end

