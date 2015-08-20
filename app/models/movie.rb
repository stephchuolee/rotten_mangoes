class Movie < ActiveRecord::Base

  has_many :reviews

  mount_uploader :image, ImageUploader

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  # validates :poster_image_url, presence: true

  validate :release_date_is_in_the_future

  scope :title,              -> (title) { where('title LIKE ?', "%#{title}%") }
  scope :director,           -> (director) { where('director LIKE ?', "%#{director}%") }
  scope :runtime_in_minutes, -> (min_duration, max_duration) { where ("runtime_in_minutes > #{min_duration} AND runtime_in_minutes <= #{max_duration}") }

  def review_average
    if reviews.size > 0 
      reviews.sum(:rating_out_of_ten)/reviews.size
    end 
  end 


  protected 

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end 
  end  

end
