# frozen_string_literal: true

module ResponseHelper
  extend ActiveSupport::Concern

  def json_with_success(data, options = {})
    serialized_data =
      ActiveModelSerializers::SerializableResource.new(
        data,
        {
          include: '**',
          **options
        }
      )
    {
      status_code: 200,
      message: options[:message] || 'Successful',
      data.class.model_name.human.downcase => serialized_data
    }
  end
end
