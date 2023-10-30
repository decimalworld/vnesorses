# frozen_string_literal: true

module ResponseHelper
  extend ActiveSupport::Concern

  def json_with_success(data, options = {})
    serialized_data =
      begin
        {
          data.class.model_name.name.underscore =>
          ActiveModelSerializers::SerializableResource.new(
            data,
            {
              include: '**',
              **options
            }
          )
        }
      rescue NoMethodError
        {}
      end
    {
      status_code: 200,
      message: options[:message] || 'Successful',
      **serialized_data
    }
  end

  def json_with_pagination(data, options = {})
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
      data.klass.model_name.human.pluralize.downcase => serialized_data,
      pagination: {
        current_page: data.try(:current_page) || 1,
        limit_value: data.try(:limit_value) || 25,
        total_pages: data.try(:total_pages) || 1
      }
    }
  end
end
