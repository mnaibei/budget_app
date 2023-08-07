require 'rails_helper'

RSpec.describe Record, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password123')
      record = Record.new(
        name: 'Groceries',
        amount: 50,
        author: user
      )
      expect(record).to be_valid
    end

    it 'is invalid without a name' do
      record = Record.new(
        amount: 50
      )
      expect(record).to_not be_valid
    end

    it 'is invalid without an amount' do
      record = Record.new(
        name: 'Groceries'
      )
      expect(record).to_not be_valid
    end

    it 'is invalid with non-numeric amount' do
      record = Record.new(
        name: 'Groceries',
        amount: 'not a number'
      )
      expect(record).to_not be_valid
    end

    it 'is invalid with amount less than or equal to zero' do
      record = Record.new(
        name: 'Groceries',
        amount: 0
      )
      expect(record).to_not be_valid

      record.amount = -100
      expect(record).to_not be_valid
    end
  end
end
