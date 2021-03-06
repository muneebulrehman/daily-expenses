class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy
  has_one_attached :icon
  validates :name, presence: true

  def all_transactions
    transactions.order(created_at: :desc)
  end

  def sum_of_transactions
    transactions.sum(:amount)
  end
end
