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

  scope :enabled, -> { where(status: "enabled")}
  scope :newer_first, -> { order(id: :desc)}

  def toggle_status
    if disabled?
      update(status: "enabled")
    else
      update(status: "disabled")
    end
  end
end
