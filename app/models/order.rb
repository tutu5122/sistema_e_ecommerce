class Order < ApplicationRecord
  belongs_to :user

  enum state: %i[]

  before_create -> { generate_number(hash_prefix, hash_size) }

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
