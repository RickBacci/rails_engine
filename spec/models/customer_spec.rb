require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { Customer.create!(first_name: 'Ricky', last_name: 'B') }
  let(:merchant) { Merchant.create!(name: 'aaaAbletoCode') }
  let(:invoice) { customer.invoices.create!(status: 'shipped',
                                            merchant_id: merchant.id) }

  context 'is valid' do
    it 'with valid attributes' do
      expect(customer).to be_valid
    end
  end

  context 'is invalid' do
    it 'without a first_name' do
      customer.first_name = nil

      expect(customer).to be_invalid
    end

    it 'without a last_name' do
      customer.last_name = nil

      expect(customer).to be_invalid
    end
  end

  context 'invoices' do
    it 'start out empty' do
      expect(customer.invoices).to eq([])
    end

    it 'can be added' do
      invoice

      expect(customer.invoices.size).to eq(1)
    end
  end

  context 'transactions' do
    it 'start out empty' do
      expect(customer.transactions).to eq([])
    end

    it 'can be added' do
      invoice
      customer.invoices.first.transactions.create!(
        credit_card_number: '1111222233334444',
        credit_card_expiration_date: '',
        result: 'success')

      expect(customer.transactions.size).to eq(1)
    end
  end

  context 'merchants' do
    it 'start out empty' do
      expect(customer.merchants).to eq([])
    end

    it 'can be added' do
      invoice
      expect(customer.merchants.size).to eq(1)
      expect(customer).to respond_to(:merchants)
      expect(customer.merchants.first.name).to eq('aaaAbletoCode')
    end
  end
end

