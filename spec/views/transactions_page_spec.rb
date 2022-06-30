require 'rails_helper'

RSpec.describe 'Specific category/transaction page', type: :system do
  before do
    driven_by(:rack_test)
    @user = User.create(name: 'admin4',
                        email: 'admin4@email.com',
                        password: 'password', password_confirmation: 'password')
    @user.save
    visit 'users/sign_in'
    within('#new_user') do
      fill_in 'Email', with: 'admin4@email.com'
      fill_in 'Password', with: 'password'
    end
    find_button('Log in').click
  end

  it 'I can browse the public recipes.' do
    expect(page).to have_content('Categories')
    expect(page).to have_content('All your categories')
  end

  it 'I can create new transactions for a category.' do
    click_link('Create new category')
    fill_in 'Name', with: 'Clothes'
    attach_file("Icon", Rails.root + "spec/fixtures/meme.jpg")
    find_button('Create Category').click
    expect(page).to have_content('Clothes')
    expect(page).to have_css("img")
    click_link('Clothes')
    expect(page).to have_content('Transactions')
    expect(page).to have_content('Clothes')
    click_link('Create new transaction')
    fill_in 'Name', with: 'Shirt'
    fill_in 'Amount', with: '1000'
    find_button('Create transaction').click
    expect(page).to have_content('Transaction created')
    expect(page).to have_content('Shirt')
    expect(page).to have_content('Payment: 1000.0₹')
  end

end