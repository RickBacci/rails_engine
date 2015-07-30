require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do

  let(:invoice) { Invoice.new(status: 'shipped') }
  let(:item) { Item.new(name: 'sleep',
                        description: '8 hours of actual sleep',
                        unit_price: 100) }

  let(:invoice_item) { invoice.invoice_items.new(
    quantity: 1,
    unit_price: 1.00,
    item_id: item.id,
    invoice_id: invoice.id) }

  context 'is valid' do
    it 'with valid attributes' do

      expect(invoice_item).to be_valid
    end
  end

  context 'is invalid' do
    it 'without a quantity' do

      invoice_item.quantity = nil
      expect(invoice_item).to be_invalid
    end

    it 'without a unit_price' do

      invoice_item.unit_price = nil
      expect(invoice_item).to be_invalid
    end
  end

  context 'Invoice' do
    it 'can exist' do
      expect(invoice_item).to respond_to(:invoice)
    end

    it 'is an Invoice' do
      expect(invoice_item.invoice.is_a? Invoice)
    end
  end


  context 'Item' do
    it 'can exist' do
      expect(invoice_item).to respond_to(:item)
    end

    it 'is an Item' do
      expect(invoice_item.item.is_a? Item)
    end
  end

  context 'Total' do
    it 'can be calculated' do
      expect(invoice_item.line_total).to eq(1)
    end
  end
end
