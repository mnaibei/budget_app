require 'rails_helper'

RSpec.feature 'Groups Index Page', type: :feature do
  include Devise::Test::IntegrationHelpers

  let(:user) { create(:user) }
  let!(:group1) { create(:group, name: 'Group 1', created_at: 3.days.ago) }
  let!(:group2) { create(:group, name: 'Group 2', created_at: 1.day.ago) }

  scenario 'displays a list of groups' do
    sign_in user
    visit groups_path

    expect(page).to have_content('Group 1')
    expect(page).to have_content("$#{group1.total_amount}")
    expect(page).to have_content("#{group1.created_at.day}
        #{group1.created_at.strftime('%b')} #{group1.created_at.year}")

    expect(page).to have_content('Group 2')
    expect(page).to have_content("$#{group2.total_amount}")
    expect(page).to have_content("#{group2.created_at.day}
         #{group2.created_at.strftime('%b')} #{group2.created_at.year}")

    expect(page).to have_link('View Transactions', href: group_records_path(group1))
    expect(page).to have_link('View Transactions', href: group_records_path(group2))

    expect(page).to have_button('Remove', id: "remove_btn-#{group1.id}")
    expect(page).to have_button('Remove', id: "remove_btn-#{group2.id}")
  end

  scenario "displays 'Add New Group' button" do
    sign_in user
    visit groups_path

    expect(page).to have_link('Add New Group', href: new_group_path)
  end
end
