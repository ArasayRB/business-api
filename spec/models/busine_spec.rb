require 'rails_helper'

RSpec.describe Busine, type: :model do
  let (:name) {"Restaurant"}
  let (:owner) {"Andrés Meral"}
  let (:mercantil_code) {"AD89T7"}

  context 'association with service model' do
    # Association test
    # ensure Busine model has a 1:m relationship with the Service model
    it { should have_many(:services).dependent(:destroy) }
  end

  context 'validating name, owner, mercantil_code not be nil or empty' do
    # Validation tests
    # ensure columns name, owner, mercantil_code are present before saving
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:owner) }
    it { should validate_presence_of(:mercantil_code) }
  end
end
