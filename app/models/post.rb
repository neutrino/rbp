class Post < ActiveRecord::Base

  NO_OF_COMMENTS = 10

  has_many :comments
  belongs_to :user

  def recent_commenters
    self.comments.recent(5).collect{|comment| comment.user.login}.map{|commenter| "<li>#{commenter}</li>"}.join("")
  end

  def popular_posts
    self.all.include(:comments).collect{|p| p if p.comments.length > NO_OF_COMMENTS}.compact
  end

end

