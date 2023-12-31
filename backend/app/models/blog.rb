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
#  blog_type  :integer          default("normal")
#  tag_id     :uuid
#
class Blog < ApplicationRecord
  has_one :cover, as: :imageable, class_name: Images::Cover.name, dependent: :destroy
  has_many :images, as: :imageable, class_name: Images::Body.name, dependent: :destroy
  has_many :comments, dependent: :nullify
  belongs_to :tag, optional: true

  validates :title, presence: true, on: :update
  validates :body, presence: true, on: :update

  enum blog_type: {
    normal: 0,
    spotlight: 1,
    title_news: 2
  }

  enum status: {
    active: 0,
    deactived: 1
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

  def soft_delete
    transaction do
      cover.destroy
      images.destroy_all
      deactived!
    end
  end
end
