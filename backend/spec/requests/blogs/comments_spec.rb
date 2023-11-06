# frozen_string_literal: true

RSpec.describe 'Comments' do
  include_context 'when login'
  let(:blog) { create(:blog) }
  let(:comments) { create_list(:comment, 2, blog_id: blog.id) }

  let(:show_request) { get "/blogs/#{blog.id}/comments" }
  let(:put_request) do
    put "/blogs/#{blog.id}/comments",
        headers: {
          **base_header,
          RemoteAddress: '1.2.3.4',
          CONTENT_TYPE: 'application/json'
        },
        params: params
  end

  describe 'GET show' do
    it do
      comments
      show_request
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT update' do
    let(:params) do
      JSON.dump({ comments: comments.map { |comment| { id: comment.id, like: true } } })
    end

    it do
      comments
      expect { put_request }.to change { comments[0].reload.liked_by?(user_id: current_user.id) }.to true
    end
  end
end
