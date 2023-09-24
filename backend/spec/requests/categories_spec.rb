# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Categories' do
  let(:index_request) { get '/categories' }

  describe 'INDEX request' do
    it do
      index_request
      expect(response).to have_http_status(:success)
    end
  end
end
