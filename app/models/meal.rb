class Meal < ActiveRecord::Base
  validates :daily_record_id, :presence => true
  validates :position, :presence => true, :numericality => {:only_integer => true, :greater_than => 0, :message => "must be greater than 0"}
  validates :fullness_score, :presence => true, :numericality => {:greater_than_or_equal_to => 1, :less_than_or_equal_to => 10, :message => "must be between 1 and 10"}

  belongs_to :daily_record , :class_name => "DailyRecord", :foreign_key => "daily_record_id"
end
