# frozen_string_literal: true

class BaseService
  def self.execute(*args, **argv)
    new.execute(*args, **argv)
  end
end
