module MethodsHelper
  def body_json
    JSON.parse(response.body)
  end
end
