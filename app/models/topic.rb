class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  validates :name, length: { minimum: 5 }, presence: true
  validates :description, presence: true

  self.per_page = 50

  scope :publicly_viewable, -> { where(public: true) }
  scope :privately_viewable, -> { where(public: false) }
  scope :visible_to, -> (user) {user ? all : publicly_viewable}
  
end
