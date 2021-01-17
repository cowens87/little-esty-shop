class Invoice < ApplicationRecord
  validates_presence_of :customer_id, :merchant_id

  enum status: ['cancelled', 'completed', 'in progress']
  
  belongs_to :customer
  belongs_to :merchant
  
  has_many :transactions, dependent: :destroy
  has_many :invoice_items 
  has_many :items, through: :invoice_items

  def self.not_shipped
    Invoice.joins(:invoice_items).where.not('invoice_items.status = 2').distinct(:id).order(created_at: :asc)
  end

  def total_revenue
    invoice_items.sum('unit_price * quantity')
  end

    def grand_total
    grand_total = 0.0
    discounts_by_id = Hash.new
    invoice_items.pluck(:item_id).each do |item_id|
      item = Item.find(item_id)
      quantity = invoice_items.where(item:item).pluck(:quantity)[0]
      discounts = item.merchant.discounts

      if !discounts.empty? && quantity
        discounts.each do |discount|
          multiplier = (100 - discount.discount_percentage)/ 100
          current_total = item.unit_price * quantity
          discounted_total = current_total * multiplier
          discounts_by_id[discount.id] = current_total - discounted_total
          require 'pry'; binding.pry
        end
        discount = Discount.find(discounts_by_id.key(discounts_by_id.values.max))
        multiplier = (100 - discount.discount_percentage).to_f / 100
        grand_total +=(item.unit_price * quantity) * multiplier
      else
        grand_total += item.unit_price * quantity
      end
    end
    grand_total
  end

  def self.best_day
    self.joins(:invoice_items)
        .select('invoices.created_at, SUM(invoice_items.quantity * invoice_items.unit_price) AS best_day')
        .group(:id)
        .order('best_day desc')
        .first
  end
end
