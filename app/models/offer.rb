class Offer < ApplicationRecord
  enum status: { disabled: 0, enabled: 1 }

  validates :advertiser_name,
    presence: true,
    uniqueness: { case_sensitive: false, allow_blank: true }
  validates :url,
    presence: true,
    url: { no_local: true, allow_blank: true }
  validates :description,
    presence: true,
    length: { maximum: 500 }
  validates :starts_at,
    presence: true

  scope :enabled, -> do
    where(status: "enabled").already_started.still_not_ended
  end
  scope :already_started, -> { where("starts_at <= ?", DateTime.now) }
  scope :still_not_ended, -> do
    where("ends_at > ?", DateTime.now).or(Offer.where(ends_at: nil))
  end
  scope :newer_first, -> { order(id: :desc)}
  scope :premium_first, -> { order(premium: :desc)}

  def toggle_status
    if disabled?
      update(status: "enabled")
    else
      update(status: "disabled")
    end
  end
end
