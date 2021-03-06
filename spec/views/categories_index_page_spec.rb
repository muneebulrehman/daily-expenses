require 'rails_helper'

RSpec.describe 'Categories index page', type: :system do
  before do
    driven_by(:rack_test)
    @user = User.create(name: 'admin3',
                        email: 'admin3@email.com',
                        password: 'password', password_confirmation: 'password')
    @user.save
    visit 'users/sign_in'
    within('#new_user') do
      fill_in 'Email', with: 'admin3@email.com'
      fill_in 'Password', with: 'password'
    end
    find_button('Log in').click
  end

  it 'I can browse the public recipes.' do
    expect(page).to have_content('Categories')
    expect(page).to have_content('All your categories')
  end

  it 'I can create new recipes.' do
    click_link('Create new category')
    fill_in 'Name', with: 'Clothes'
    attach_file('Icon', "#{Rails.root}/spec/fixtures/meme.jpg")
    find_button('Create Category').click
    expect(page).to have_content('Clothes')
    expect(page).to have_css('img')
  end
end
