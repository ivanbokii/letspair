require 'spec_helper'

feature 'View the homepage' do
  scenario 'user sees title and logo' do
    visit root_path
    expect(page).to have_title 'Letspair'
    expect(page).to have_css "img[src*='/assets/logo.png']"
  end

  scenario 'user sees link to github' do
    visit root_path
    expect(page).to have_link('Available on github')
  end
end
