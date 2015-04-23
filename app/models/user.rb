class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :orders
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  validates :name, presence: true, length: { in: 2..40 }
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  def set_default_role
    self.role ||= :user
  end

	def skip_reconfirmation_update(params)
		self.skip_reconfirmation!
		self.update(params)
	end

end
