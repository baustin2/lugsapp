class Order < ApplicationRecord
  has_many :orderdetails
  before_save :update_total
  before_create :update_status

  def calculate_total
    self.orderdetails.collect { |detail| detail.priceEach * detail.quantityOrdered }.sum
  end

  private

  def update_status
    if self.status == nil?
      self.status = "In progress"
    end
  end

  def update_total
    self.total_price = calculate_total
  end
end
