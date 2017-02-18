class User < ApplicationRecord
  GLYCEMIA_UNITS = %w(mg/dL mmol/L)
  validates :username, presence: true
  validates :glycemia_unit, inclusion: { in: GLYCEMIA_UNITS }

  has_many :records

  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
