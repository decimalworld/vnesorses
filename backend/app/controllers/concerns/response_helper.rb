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
      status: {
        code: 200,
        message: 'Logged in successfully.',
        data: serialized_data
      }
    }
  end
end
