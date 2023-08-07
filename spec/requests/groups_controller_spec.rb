require 'rails_helper'

RSpec.describe GroupsController, type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { create(:user) }
  let(:group) { create(:group, user:) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get groups_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get groups_path(group)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get new_group_path
      expect(response).to have_http_status(:ok)
    end
  end
end
