class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, :presence => true, :uniqueness => true
  # validates :first_name, :presence => true
  # validates :last_name, :presence => true
  # validates :zip, :presence => true, length: {is: 5}
  # validates :activity_level, :presence => true
  # validates :weight_starting_lbs, :presence => true, :numericality => {:greater_than => 0, :message => "must be greater than 0"}
  # validates :weight_goal_lbs, :numericality => {:greater_than => 0, :message => "must be greater than 0", :allow_blank => true}
  # validates :height_inches, :presence => true, :numericality => {:greater_than => 0, :message => "must be greater than 0" }
  # validates :dob, :presence => true
  # validates :gender, :presence => true, inclusion: {in: ["Male", "Female"], message: "%(value) is not a valid gender"}

  has_many :weight_loss_models , :class_name => "WeightLossModel", :foreign_key => "user_id"
  has_many :daily_records , :class_name => "DailyRecord", :foreign_key => "user_id"

end
