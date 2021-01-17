# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Customers:
@salim     = Customer.create!(first_name: 'Salim', last_name: 'Imwera', address: 'Up The Hill, Kwale, Kenya')
@sally     = Customer.create!(first_name: 'Sally', last_name: 'Smith', address: 'Test Address')
# Merchants:
@amazon    = Merchant.create!(name: 'Amazon')
@max       = Merchant.create!(name: 'Merch Max')
# Invoices:
@invoice1  = Invoice.create!(status: 1, customer_id: @sally.id, merchant_id: @max.id)
@invoice2  = Invoice.create!(status: 1, customer_id: @sally.id, merchant_id: @max.id)
@invoice7  = Invoice.create!(status: 2, customer_id: @salim.id, merchant_id: @amazon.id, created_at: 'Fri, 08 Dec 2020 14:42:18 UTC +00:00')
# Transactions:
@tx1       = Transaction.create!(result: "success", credit_card_number: 010001001022, credit_card_expiration_date: 20251001, invoice_id: @invoice1.id,)
@tx2       = Transaction.create!(result: "success", credit_card_number: 010001005555, credit_card_expiration_date: 20220101, invoice_id: @invoice1.id,)
@tx3       = Transaction.create!(result: "success", credit_card_number: 010001005551, credit_card_expiration_date: 20220101, invoice_id: @invoice7.id,)
@tx4       = Transaction.create!(result: "success", credit_card_number: 010001005552, credit_card_expiration_date: 20220101, invoice_id: @invoice7.id,)
@tx5       = Transaction.create!(result: "success", credit_card_number: 010001005553, credit_card_expiration_date: 20220101, invoice_id: @invoice7.id,)
@tx6       = Transaction.create!(result: "success", credit_card_number: 010001005554, credit_card_expiration_date: 20220101, invoice_id: @invoice2.id,)
# Items:
@item_1    = @max.items.create!(name: 'Beans', description: 'Tasty', unit_price: 5)
@item_2    = @max.items.create!(name: 'Item 2', description: 'Blah', unit_price: 10)
@backpack  = @amazon.items.create!(name: 'Camo Backpack', description: 'Double Zip Backpack', unit_price: 5.0)
@radio     = @amazon.items.create!(name: 'Retro Radio', description: 'Twist and Turn to your fav jams', unit_price: 10.0)
@brush     = @amazon.items.create!(name: 'Boar Brush', description: 'Hair Brush', unit_price: 12.5)
# InvoiceItems:
@invitm1   = InvoiceItem.create!(status: 0, quantity: 25, unit_price: 7.0, invoice_id: @invoice1.id, item_id: @item_1.id)
@invitm2   = InvoiceItem.create!(status: 2, quantity: 10, unit_price: 15.5, invoice_id: @invoice2.id, item_id: @item_2.id)
@invitm3   = InvoiceItem.create!(status: 0, quantity: 25, unit_price: 10, invoice_id: @invoice1.id, item_id: @item_2.id)
@invitm4   = InvoiceItem.create!(status: 2, quantity: 50, unit_price: 5.0, invoice_id: @invoice7.id, item_id: @backpack.id)
@invitm5   = InvoiceItem.create!(status: 1, quantity: 100, unit_price: 10.0, invoice_id: @invoice7.id, item_id: @radio.id)
@invitm6   = InvoiceItem.create!(status: 1, quantity: 20, unit_price: 10.0, invoice_id: @invoice7.id, item_id: @brush.id)
# Discounts:
@discount_1 = Discount.create!(discount_percentage: 10, quantity_threshold: 30, merchant_id: @amazon.id)
@discount_2 = Discount.create!(discount_percentage: 15, quantity_threshold: 50, merchant_id: @amazon.id)
@discount_3 = Discount.create!(discount_percentage: 20, quantity_threshold: 100, merchant_id: @amazon.id)
@discount_4 = Discount.create!(discount_percentage: 20, quantity_threshold: 15, merchant_id: @max.id)
@discount_5 = Discount.create!(discount_percentage: 30, quantity_threshold: 15, merchant_id: @max.id)