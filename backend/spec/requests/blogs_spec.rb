# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Blogs' do
  let(:blog) { create(:blog) }
  let(:body_image_count) { 2 }

  let(:show_request) { get "/blogs/#{blog.id}" }
  let(:create_request) { post '/blogs', params: params }
  let(:put_request) { put "/blogs/#{blog.id}", params: params }

  describe 'GET show' do
    it do
      show_request
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST create' do
    let(:params) do
      { body_image_count: body_image_count }
    end

    it do
      expect { create_request }
        .to change(Blog, :count)
        .by(1)
        .and change(Images::Cover, :count).by(1)
        .and change(Images::Body, :count).by(body_image_count)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT update' do
    context 'with valid params' do
      let(:params) do
        {
          title: 'valid title',
          body: 'valid body'
        }
      end

      it do
        expect { put_request }
          .to change { blog.reload.title }
          .and(change { blog.reload.body })
        expect(response).to have_http_status(:success)
      end
    end

    context 'without body or title' do
      let(:params) do
        {
          title: 'valid title'
        }
      end

      it do
        put_request
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
