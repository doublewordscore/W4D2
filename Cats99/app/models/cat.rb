class Cat < ActiveRecord::Base

  COLORS = ['red', 'blue', 'yellow']
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: COLORS, message: 'Wrong color!!'}
  validates :sex, inclusion: { in: ['M', 'F'], message: 'Invalid sex!!'}

  has_many :cat_rental_requests, :dependent => :destroy

  def self.colors
    COLORS
  end


end
