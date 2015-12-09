class WeightLossModel < ActiveRecord::Base
  validates :user_id, :presence => true, :uniqueness => {:scope => :model_version}
  validates :coefficient_fullness, :presence => true, :numericality => true
  validates :intercept, :presence => true, :numericality => true
  validates :model_version, :presence => true, :numericality => {:only_integer => true, :greater_than => 0, :message => "must be greater than 0" }
  validates :model_start_date, :presence => true
  validates :model_end_date, :presence => true

  belongs_to :user , :class_name => "User", :foreign_key => "user_id"
end
