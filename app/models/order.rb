class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items
  has_many :products, through: :order_items, dependent: :destroy

  enum state: %i[]

  before_create -> { generate_number(hash_prefix, hash_size) }

  def add_product(product_id, quantity)
    product = Product.find(product_id)

    if product && (product.stock > 0) && (product.stock >= quantity)
      self.order_items.create(product: product, quantity: quantity, price: product.price)
    end
  end

  def generate_number(prefix, size)
    self.number ||= loop do
      random = random_candidate(prefix, size)
      break random unless self.class.exists?(number: random)
    end
  end

  def random_candidate(prefix, size)
    "#{prefix}#{Array.new(size){ rand(size) }.join }"
  end

  def hash_prefix
    'BO'
  end

  def hash_size
    9
  end
end
