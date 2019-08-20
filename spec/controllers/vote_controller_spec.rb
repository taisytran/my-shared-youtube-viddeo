# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VoteController, type: :controller do
  describe 'GET #up' do
    it 'returns http success' do
      get :up
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #down' do
    it 'returns http success' do
      get :down
      expect(response).to have_http_status(:success)
    end
  end
end
