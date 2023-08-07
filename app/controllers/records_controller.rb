class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group

  def index
    @group = Group.includes(:records).find(params[:group_id])
    @records = @group.records.order(created_at: :desc)
  end

  def new
    @group = Group.find(params[:group_id])
    @record = @group.records.build
  end

  def create
    @group = Group.find(params[:group_id])
    @record = @group.records.build(record_params)
    @record.author = current_user

    Rails.logger.info @record.inspect

    if @record.save
      redirect_to group_records_path(@group), notice: 'Record was successfully created!'
    else
      @errors = @record.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_group
    @group = current_user.groups.find(params[:group_id])
  end

  def record_params
    params.require(:record).permit(:name, :amount, :group_ids)
  end
end
