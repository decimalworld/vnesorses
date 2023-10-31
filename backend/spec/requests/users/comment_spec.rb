# frozen_string_literal: true

RSpec.describe 'comment' do
  include_context 'when login'

  let(:blog) { create(:blog) }

  let(:params) do
    {
      content: 'Comment content',
      blog_id: blog.id
    }
  end

  let(:post_request) { post '/users/comments/', headers: base_header, params: params }

  describe 'when not login' do
    let(:base_header) { {} }

    it { expect { post_request }.not_to change(Comment, :count) }
  end

  describe 'when login and create new comment' do
    it do
      expect { post_request }.to change(Comment, :count).by(1)
      expect(response).to have_http_status(:success)
    end
  end
end
