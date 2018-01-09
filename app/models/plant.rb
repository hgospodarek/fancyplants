class Plant < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy

  validates :name, presence: true
  validates :user, presence: true

  # TODO: Distinguish between watering, soaking, misting, esp. for airplants?
  def last_watered
    events.watering.order(:datetime).last.try(:datetime) || 'never'
  end

  def last_pruned
    events.pruned.order(:datetime).last.try(:datetime) || 'never'
  end

  def last_fertilized
    events.fertilized.order(:datetime).last.try(:datetime) || 'never'
  end
end
