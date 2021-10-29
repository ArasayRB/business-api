class BusineSerializer < ActiveModel::Serializer
  # attributes to be serialized
  attributes :id, :name, :owner, :created_at, :updated_at
  # model association
  has_many :services
end
