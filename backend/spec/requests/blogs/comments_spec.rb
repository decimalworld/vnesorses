# frozen_string_literal: true

RSpec.describe 'Comments' do
  let(:blog) { create(:blog) }
  let(:comments) { create_list(:comment, 2, blog_id: blog.id) }

  let(:index_request) { get "/blogs/#{blog.id}/comments" }

  describe 'GET index' do
    it do
      comments
      index_request
      expect(response).to have_http_status(:success)
    end
  end
end
