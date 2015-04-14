class CatRentalRequest < ActiveRecord::Base
  STATUSES = %w(Pending Approved Denied)
  validates_inclusion_of :status, in: STATUSES
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validate :valid_range
  after_initialize :set_defaults

  belongs_to :cat

  private

  def valid_range
    unless overlapping_approved_requests.none?
      errors.add(:base, "Cat is already rented then")
    end
  end

  def overlapping_requests
    CatRentalRequest
      .where(cat_id: cat_id)
      .where("NOT (end_date < :start OR start_date > :end)", start: start_date, end: end_date)
  end

  def overlapping_approved_requests
    overlapping_requests
      .where(status: "Approved")
  end

  def set_defaults
    self.status ||= 'Pending'
  end

end
