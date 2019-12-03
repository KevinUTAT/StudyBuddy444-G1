class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups_created = Group.all.select { |a| a.user_id == current_user.id }
    @memberships = Member.all.select { |a| a.user_id == current_user.id}.pluck(:group_id)
    @groups_joined = Group.all.select { |a| @memberships.include? a.id }
    @jobs = PostApplication.where({user_id: current_user.id , is_accepted: true})
    @pending = PostApplication.where({user_id: current_user.id , is_accepted: false})

    @notes = Note.all
  end


  def checkout
    @groups = Group.all
  end
end
