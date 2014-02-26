class User < ActiveRecord::Base
  after_create :notify_added
  validates :email, uniqueness: true
  validates_presence_of :full_name, :phone_number, :email

private
  def notify_added
    UserMailer.notify_added(self).deliver
  end
end
