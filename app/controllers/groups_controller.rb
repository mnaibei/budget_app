class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = current_user.groups.includes(:records).order(created_at: :desc)
  end

  def show; end

  def new
    @group = current_user.groups.build
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created!'
    else
      @errors = @group.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path, notice: "Deleted group: #{@group.name}"
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
