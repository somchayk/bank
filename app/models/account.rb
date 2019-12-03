class Account < ApplicationRecord
  belongs_to :user

  validates :balance, numericality: { greater_than_or_equal_to: 10000, message: "Must have at least $10,000"}
end
