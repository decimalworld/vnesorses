# frozen_string_literal: true

class BaseService
  def self.execute(*args)
    new.execute(*args)
  end
end
