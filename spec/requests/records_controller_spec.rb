require 'rails_helper'

RSpec.describe 'RecordsController', type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { create(:user) }
  let(:group) { create(:group, user:) }
  let(:record_params) { attributes_for(:record) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get group_records_path(group)
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get new_group_record_path(group)
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates a new record with valid attributes' do
      expect do
        post group_records_path(group), params: { record: record_params }
      end.to change(Record, :count).by(1)

      expect(response).to redirect_to(group_records_path(group))
      expect(flash[:notice]).to eq('Transaction was successfully added :)')
    end
  end
end
