# frozen_string_literal: true

shared_context 'when login' do
  let(:current_user) { create(:user) }
  let(:jwt_token) do
    JWT.encode({
                 'sub' => current_user.id,
                 'scp' => 'user',
                 'iat' => 1_698_633_203,
                 'jti' => SecureRandom.uuid
               }, Rails.application.credentials.devise_jwt_secret)
  end

  let(:base_header) do
    {
      Authorization: "Bearer #{jwt_token}"
    }
  end
end
