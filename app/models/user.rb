class User < ApplicationRecord
  enum glycemia_unit: [ :mg_dl, :mmol_L ]
  validates :username, presence: true

  has_many :records

  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
