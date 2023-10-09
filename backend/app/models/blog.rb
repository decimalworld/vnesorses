# frozen_string_literal: true

# == Schema Information
#
# Table name: blogs
#
#  id         :uuid             not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Blog < ApplicationRecord
  has_one :cover, class_name: Images::Cover.name, dependent: :destroy
  has_many :images, class_name: Images::Body.name, dependent: :destroy

  validates :title, presence: true, on: :update
  validates :body, presence: true, on: :update

  enum is_spotlight: {
    spotlight: true,
    normal: false
  }

  def summary
    (body || '')
      .then(&CGI.method(:unescapeHTML))
      .match(::Default::PARAGRAPH_REGEX)
      .to_s
  end

  def title
    CGI.unescapeHTML(super || '')
  end

  def title=(value)
    super(ERB::Util.html_escape(value))
  end

  def body
    CGI.unescapeHTML(super || '')
  end

  def body=(value)
    super(ERB::Util.html_escape(value))
  end

  def generate_signed_url
    cover.generate_signed_url
    images.each(&:generate_signed_url)
  end
end
