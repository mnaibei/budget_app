class ActionsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @actions = @group.actions.order(created_at: :desc)
  end

  def new
    @group = Group.find(params[:group_id])
    @actions = @group.records.build
  end

  def create
    @group = Group.find(params[:group_id])
    @actions = @actions.records.build(action_params)
    @actions.author = current_user

    if @actions.save
      redirect_to category_records_path(@category), notice: 'Transaction was successfully added :)'
    else
      @errors = @record.errors.full_messages
      render :new, alert: @errors
    end
  end

  private

  def action_params
    params.require(:record).permit(:name, :amount, :category_ids)
  end
end
