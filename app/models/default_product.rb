class DefaultProduct
  include Mongoid::Document
  field :name, type: String

  has_and_belongs_to_many :products

  def add_product(product_id)
    product = Product.where(id: product_id).first
    self.products << product if product
  end
end
