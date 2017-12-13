class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  validates :name, presence: true
  # (tests don't want this validation) validates_inclusion_of :happiness, :in => 1..5, message: "rating must be between 1 and 5."
  # (tests don't want this validation) validates_inclusion_of :nausea, :in => 1..5, message: "rating must be between 1 and 5."

  def mood
    self.happiness > self.nausea ? "happy" : "sad"
  end
end
