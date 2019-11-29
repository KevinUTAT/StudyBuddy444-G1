class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = Group.all
    @notes = Note.all
   end


  def checkout
    @groups = Group.all
  end
end
