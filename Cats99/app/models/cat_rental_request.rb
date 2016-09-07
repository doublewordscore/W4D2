require 'byebug'

class CatRentalRequest < ActiveRecord::Base

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: ['PENDING', 'APPROVED', 'DENIED'], message: 'Invalid status!' }
  validate :requests_overlap

  belongs_to :cat

  def overlapping_requests
    CatRentalRequest.where(<<-SQL, start_date: start_date, end_date: end_date)
        (:start_date <= end_date AND :end_date >= start_date)
    SQL
    .where.not(id: self.id)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: "APPROVED")
  end

  def requests_overlap
    unless overlapping_approved_requests.empty?
      errors[:base] << "Cat's already rented."
    end
  end

  def approve!
    debugger
    CatRentalRequest.transaction do
      self.status = "APPROVED"
      self.save!
      self.overlapping_requests.each do |request|
        request.deny!
      end
    end
  end

  def deny!
    self.status = "DENIED"
    self.save!
  end

end
