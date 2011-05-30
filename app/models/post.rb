class Post < ActiveRecord::Base

  NO_OF_COMMENTS = 10
  RECENT_COMMENTS = 5

  has_many :comments
  belongs_to :user

  #validations
  validate :title, :presence => true
  validate :text, :presence => true

  def recent_commenters
    self.comments.recent(RECENT_COMMENTS).inlcude(:user).collect{|comment| comment.user.login}
  end


  def popular_posts
    # return posts that have more than 10 comments
    self.all.include(:comments).collect{|p| p if p.comments.length > NO_OF_COMMENTS}.compact
  end

end

