# frozen_string_literal: true

module BlogSerializer
  class CommonSerializer < ActiveModel::Serializer
    attributes :id, :tag_name, :created_at
    has_one :cover
    has_many :images, if: :newly_created?
    attribute :title, unless: :newly_created?
    attribute :summary, unless: :newly_created?
    attribute :body, unless: :newly_created?

    def newly_created?
      object.id_previously_changed?
    end

    def created_at
      object.created_at.strftime('%A, %d/%m/%Y, %H:%M')
    end

    def tag_name
      object.tag&.name
    end
  end
end