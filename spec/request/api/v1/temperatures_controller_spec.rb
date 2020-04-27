require 'rails_helper'

RSpec.describe Api::V1::TemperaturesController, type: :request do
  describe 'Get #index' do
    it 'responds with http status ok' do
      get '/temperatures'
      expect(response).to  have_http_status(:ok)
    end

    context "when return 0 objects" do
      it 'responds with path objecs array' do
        get '/temperatures'
        expect(response.body).to have_json_path('temperatures')
      end
  
      it 'responds with zero results' do
        get '/temperatures'
        expect(response.body).to have_json_size(0).at_path('temperatures')
      end
    end

    context "when exist datas" do
      before(:each) do
        create(:temperature)
      end

      it 'responds with array objects' do
        get '/temperatures'
        expect(response.body).to have_json_size(1).at_path('temperatures')
      end
    end

    context "when apply fileters" do
      let!(:temperature1) { create(:temperature, temperature: 1, created_at: DateTime.now) }
      let!(:temperature2) { create(:temperature, temperature: 2, created_at: DateTime.now - 2.hours) }

      context "when apply temperature filter" do
        let(:params) do
          {
            q: 'temperature'
          }
        end

        it 'responds with array objects' do
          get '/temperatures', params: params

          result = JSON.parse(response.body)
          expect(result['temperatures'].first['id']).to eq(temperature1.id)
        end
      end

      context "when apply creation_date filter" do
        let(:params) do
          {
            q: 'creation_date'
          }
        end

        it 'responds with array objects' do
          get '/temperatures', params: params

          result = JSON.parse(response.body)
          expect(result['temperatures'].first['id']).to eq(temperature2.id)
        end
      end
    end
  end

  describe 'Get #min_temperature' do
    let!(:temperature1) { create(:temperature, temperature: 1, created_at: DateTime.now) }
    let!(:temperature2) { create(:temperature, temperature: 2, created_at: DateTime.now - 2.hours) }

    it 'responds with array objects' do
      get '/min_temperature'
      result = JSON.parse(response.body)

      expect(result['temperature']['id']).to eq(temperature1.id)
    end
  end
end