# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Categories' do
  let(:category) { create(:category) }

  let(:index_request) { get '/categories' }
  let(:blogs_request) { post "/categories/#{category.id}/blogs" }

  describe 'INDEX request' do
    it do
      index_request
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Blogs request' do
    it do
      blogs_request
      expect(response).to have_http_status(:success)
    end
  end
end
