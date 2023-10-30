class FailureApp < Devise::FailureApp
  def respond
    self.content_type = "application/json"
    self.response_body = { error_message: http_auth_body }.to_json 
    self.status = :forbidden
  end
end
