# frozen_string_literal: true

class ApplicationSerializer < ActiveModel::Serializer
  def current_user
    @instance_options[:current_user]
  end

  def ip_addr
    @instance_options[:ip_addr]
  end
end
