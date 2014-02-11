class User < ActiveRecord::Base
  after_create :notify_added

  validates :email, uniqueness: true

private
  def notify_added
    UserMailer.notify_added(self).deliver
  end
end
