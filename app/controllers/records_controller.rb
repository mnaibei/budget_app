class RecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
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
      redirect_to group_records_path(@group), notice: 'Transaction was successfully added :)'
    else
      @errors = @record.errors.full_messages
      puts @errors
      render :new, alert: @errors
    end
  end

  private

  def record_params
    params.require(:record).permit(:name, :amount, :group_ids)
  end
end
