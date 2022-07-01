require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should belong_to :user }
  it { should validate_presence_of :name }
  it { is_expected.to have_one_attached(:icon) }
end
