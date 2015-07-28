require 'rails_helper'

RSpec.describe Invoice, type: :model do
  let(:invoice) { Invoice.create!(status: 'shipped') }

  context 'is valid' do
    it 'with valid attributes' do
      expect(invoice).to be_valid
    end
  end

  context 'is invalid' do
    it 'without a status' do
      invoice.status = nil

      expect(invoice).to be_invalid
    end
  end

  context 'invoice_items' do
    it 'start out empty' do
      expect(invoice.invoice_items).to eq([])
    end

    it 'can be added' do
      invoice.invoice_items.create!(quantity: 1, unit_price: 1.00)

      expect(invoice.invoice_items.size).to eq(1)
    end
  end

  context 'items' do
    it 'start out empty' do
      expect(invoice.items).to eq([])
    end

   it 'can be added' do
      invoice.items.new(name: 'adsf', description: 'asdf', unit_price: 1.00)

      expect(invoice.items.size).to eq(1)
    end
  end
end
