module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :tagging, as: :taggable
    has_many :tags, through: :tagging
  end
end