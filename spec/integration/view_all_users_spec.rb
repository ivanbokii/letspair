require 'spec_helper'

feature 'View all users' do
  context 'Not logged in' do
    scenario 'cannot see link to users' do
      visit root_path
      expect(page).not_to have_link('users')
    end
  end

  # context 'logged in' do
    # scenario 'can see link to users' do
      # visit root_path
      # expect(page).to have_link('users', href: '/users')
    # end
  # end
end
