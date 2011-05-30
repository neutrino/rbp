class Comment < ActiveRecord::Base

  belongs_to :user

  before_create :is_minimum_length

  scope :recent, lambda {|count = nil | order("created_at DESC").limit(count)}

  def commenter_address
    "#{self.user.address.city},#{self.user.address.country}"
  end

  def is_minimum_length?
    return true if self.text.length > 3
  end

end

