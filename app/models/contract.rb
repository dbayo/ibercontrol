class Contract
  include Mongoid::Document
  field :plazos, type: String
  field :price, type: String

  belongs_to :client
  has_many :services
  has_many :bills
end
