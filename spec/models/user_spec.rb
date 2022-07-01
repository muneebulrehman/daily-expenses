require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Admin101', email: 'admin10@gmail.com', password: 'password', password_confirmation: 'password')
  end

  before { subject.save }
  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
