class DailyRecord < ActiveRecord::Base
  validates :user_id, :presence => true, :uniqueness => {:scope => :date}
  validates :date, :presence => true
  # validates :weight, :presence => true, :numericality => {:greater_than => 0, :message => "must be greater than 0"}
  # validates :weight_loss_probability, :presence => true, :numericality => {:greater_than => 0, :less_than => 1, :message => "must be between 0 and 1"}
  # validates :average_fullness, :presence => true, :numericality => {:greater_than_or_equal_to => 1, :less_than_or_equal_to => 10, :message => "must be between 1 and 10"}

  has_many :meals , :class_name => "Meal", :foreign_key => "daily_record_id"

  belongs_to :user , :class_name => "User", :foreign_key => "user_id"
end
