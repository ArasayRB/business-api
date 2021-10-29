require 'rails_helper'

RSpec.describe User, type: :model do  

  context 'ensure Busine model has a 1:m relationship with the Service model' do
    # Association test
    it {should have_many(:busines)}
  end

  context 'ensure name, email and password_digest are present before save' do
    # Validation tests
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
  end
end
