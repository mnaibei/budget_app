class GroupActionsController < ApplicationController
  def show
    @group = Group.find(params[:group_id])
    @actions = @group.actions
  end
end
