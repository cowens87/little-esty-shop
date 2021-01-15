class MerchantDiscountsController < ApplicationController
  def index
    merchant_discounts = Merchant.find(params[:merchant_id])
    @discounts = merchant_discounts.discounts
  end

  def show
    require 'pry'; binding.pry
    @discount = Discount.find(params[:id])
  end
end