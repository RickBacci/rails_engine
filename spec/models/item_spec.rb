require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { Item.create!(name: 'sleep', description: '8 hours of actual sleep', unit_price: 100) }

  context 'is valid' do
    it 'with valid attributes' do
      expect(item).to be_valid
    end
  end

  context 'is invalid' do
    it 'without a name' do
      item.name = nil

      expect(item).to be_invalid
    end

    it 'without a description' do
      item.description = nil

      expect(item).to be_invalid
    end

    it 'without a unit price' do
      item.unit_price = nil

      expect(item).to be_invalid
    end
  end
  context 'responds to' do
    it 'invoices' do
      expect(item).to respond_to(:invoices)
    end

    it 'merchant' do
      expect(item).to respond_to(:merchant)
    end
  end
end
