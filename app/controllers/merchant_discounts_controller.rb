class MerchantDiscountsController < ApplicationController
  def index
    @discounts = Discount.find(params[:merchant_id]) 
  end
end