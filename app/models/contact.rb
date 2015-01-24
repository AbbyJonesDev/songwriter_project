class Contact < ActiveRecord::Base
  validates :email, :message, presence: true
  validates :message, length: { minimum: 30 }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

  def message_preview
    self.message.split(' ')[0..20].join(' ') + '...'
  end
end
