require 'rails_helper'

RSpec.describe Temperature, type: :model do
  describe 'min_temperature' do
    let!(:temperature1) { create(:temperature, temperature: 10) }
    let!(:temperature2) { create(:temperature, temperature: 20) }

    it 'return min temperature' do
      temp = Temperature.min_temperature
      expect(temp.count).to eq(1) 
    end
  end
end