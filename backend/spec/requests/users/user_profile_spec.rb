# frozen_string_literal: true

RSpec.describe 'user_profile' do
  include_context 'when login'

  let(:params) { {} }

  let(:show_request) { get '/users/user_profile/', headers: base_header }

  let(:update_request) { put '/users/user_profile/', headers: base_header, params: params }

  describe 'when not login' do
    let(:base_header) { {} }

    it do
      show_request
      expect(response).to have_http_status(:forbidden)
    end

    it do
      update_request
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe 'when login' do
    it do
      show_request
      expect(response).to have_http_status(:success)
    end

    context 'when update attr that don\'t need password' do
      let(:params) { { name: 'updated name' } }

      it do
        expect { update_request }.to(change { current_user.user_profile.reload.name })
        expect(response).to have_http_status(:success)
      end
    end

    context 'when update attr that need password with wrong password' do
      let(:params) { { email: 'updated@email.com', password_confirmation: 'wrong password' } }

      it do
        update_request
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when update attr that need password with correct password' do
      let(:params) { { email: 'updated@email.com', password_confirmation: 'password' } }

      it do
        update_request
        expect(response).to have_http_status(:success)
      end
    end
  end
end
