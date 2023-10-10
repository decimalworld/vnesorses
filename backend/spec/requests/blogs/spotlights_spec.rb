# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Spotlights' do
  let!(:blog) { create(:blog, blog_type: 'spotlight') }
  let(:body_image_count) { 2 }

  let(:index_request) { get '/blogs/spotlights' }

  describe 'GET index' do
    it do
      index_request
      expect(response).to have_http_status(:success)
      expect(response.parsed_body.dig('blog', 'id')).to eq(blog.id)
    end
  end
end
