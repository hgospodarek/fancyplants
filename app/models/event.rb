class Event < ApplicationRecord
  belongs_to :plant, inverse_of: :events

  validates :plant, presence: true
  validates :datetime, presence: true

  validates :name, presence: true,
            inclusion: { in: ['Checked',
                              'Added to Collection',
                              'Potted Up', 'Repotted',
                              'Watered', 'Pruned',
                              'Moved', 'Fertilized',
                              'Neem Oil Applied',
                              'Pesticide Applied',
                              'Alcohol Swab Pest Removal', 'Propagation via Leaf', 'Propagation via Cutting', 'Offshoot Removed',
                              'Blooming', 'Died',
                              'Yellow Leaves',
                              'Crispy Leaves',
                              'Puckered Leaves',
                              'Roots Checked',
                              'Misted', 'Soaked'] }

  scope :watered, -> { where(name: 'Watered' )}
  scope :misted, -> { where(name: 'Misted' )}
  scope :soaked, -> { where(name: 'Soaked' )}
  scope :watering, -> { watered.or(misted).or(soaked)}

  scope :pruned, -> { where(name: 'Pruned' )}
  scope :fertilized, -> { where(name: 'Fertilized' )}

end
