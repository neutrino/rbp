class Comment < ActiveRecord::Base
  belongs_to :user

  def commenter_address
    "#{self.user.address.city},#{self.user.address.country}"
  end

  def self.recent(count)
    order("created_at DESC").limit(count)
  end

  def is_minimum_length?
    if self.text.length < 4
      return false
    else
      return true
    end
  end
end

