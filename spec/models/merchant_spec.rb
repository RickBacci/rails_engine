require 'rails_helper'

RSpec.describe Merchant, type: :model do
  let(:merchant) { Merchant.create!(name: 'aaaAbletoCode') }
  let(:customer) { Customer.create!(first_name: 'Ricky', last_name: 'B') }
  let(:invoice) { customer.invoices.create!(status: 'shipped',
                                            merchant_id: merchant.id) }
  context 'is valid' do
    it 'with valid attributes' do
      expect(merchant).to be_valid
    end
  end

  context 'is invalid' do
    it 'without a name' do
      merchant.name = nil

      expect(merchant).to be_invalid
    end
  end

  context 'items' do
    it 'start out empty' do
      expect(merchant.items).to eq([])
    end

    it 'can be added' do
      merchant.items.create!(name: 'item1', description: 'item1 description', unit_price: 1.00)

      expect(merchant.items.size).to eq(1)
    end
  end


  context 'invoices' do
    it 'start out empty' do
      expect(merchant.invoices).to eq([])
    end

    it 'can be added' do
      merchant.invoices.create!(status: 'shipped')

      expect(merchant.invoices.size).to eq(1)
    end
  end

  context 'customers' do
    it 'start out empty' do
      expect(merchant.customers).to eq([])
      expect(merchant).to respond_to(:customers)
    end

    it 'can be added' do

       merchant.invoices.create!(status: 'shipped',
                                 customer_id: customer.id)

      expect(merchant.customers.count).to eq(1)
      expect(merchant.customers.first.first_name).to eq('ricky')
    end
  end
end

