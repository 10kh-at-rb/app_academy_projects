class CatRentalRequest < ActiveRecord::Base
  STATUSES = %w(Pending Approved Denied)
  validates_inclusion_of :status, in: STATUSES
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validate :valid_range

  belongs_to :cat

  scope :approved_requests, -> { where(status: "Approved") }

  def range
    (self.start_date.to_date..self.end_date.to_date)
  end

  def valid_range
    errors.add(:base, "Cat is already rented then") if !open_range
  end

  private
  def open_range
    self.class.approved_requests
      .where(cat_id: self.cat_id)
      .any? do |a_r|
      self.range.cover?(a_r)
    end
  end

end
