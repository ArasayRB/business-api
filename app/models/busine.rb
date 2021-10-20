class Busine < ApplicationRecord
  # model Association
  has_many :services, dependent: :destroy

  #validations
  validates_presence_of :name, :owner, :mercantil_code
end
