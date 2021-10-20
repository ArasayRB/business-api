class Service < ApplicationRecord
  # model association
  belongs_to :busine

  #validations
  validates_presence_of :title, :aproximate_price
end
