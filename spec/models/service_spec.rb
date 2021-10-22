require 'rails_helper'

RSpec.describe Service, type: :model do
  let (:title) {"Carne de res"}
  let (:aproximate_price) {23.8}

  context 'association with busine model' do
    # Association test
    # ensure an service record belongs to a single busine record
    it { should belong_to(:busine) }
  end

  context 'validating title, aproximate_price not be nil or empty' do
    # Validation test
    # ensure column title, aproximate_price is present before saving
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:aproximate_price) }
  end
end
