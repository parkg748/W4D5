require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(username: 'Blake', password: 'password') }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  
  describe '::find_by_credentials' do
    it 'should return user if it exist in the database' do
      User.create!(username: 'Blake', password: 'password')
      user = User.find_by(username: 'Blake')
      expect(User.find_by_credentials('Blake', 'password')).to eq(user)
    end
    
    it 'should return nil if it doesn\'t exist in the database' do
      expect(User.find_by_credentials('Grace', 'appacademy')).to be_nil
    end
    
    
  end
end