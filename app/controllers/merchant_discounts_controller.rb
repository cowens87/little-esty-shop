class MerchantDiscountsController < ApplicationController
  def index
    merchant_discounts = Merchant.find(params[:merchant_id])
    @discounts = merchant_discounts.discounts
  end

  def show
    merchant = Merchant.find(params[:merchant_id])
    @discount = merchant.discounts.find(params[:id])
  end

  def new
    merchant = Merchant.find(params[:merchant_id])
    @discount = Discount.new(merchant_id: merchant.id)  
  end

  def create
    merchant = Merchant.find(params['merchant_id'])
    discount = Discount.create!({
                                discount_percentage: params['discount']['discount_percentage'], 
                                quantity_threshold: params['discount']['quantity_threshold'], 
                                merchant_id: merchant.id
                                })
    discount.save
    redirect_to merchant_discounts_path
  end

  private

  def discount_params
    params.require(:discount).permit(:discount_percentage, :quantity_threshold, :merchant_id)
  end
end