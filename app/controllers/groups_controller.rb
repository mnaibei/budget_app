class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show; end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created!'
    else
      puts @group.errors.full_messages # Output the errors to the console for debugging
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
