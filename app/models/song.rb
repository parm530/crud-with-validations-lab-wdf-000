class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year]}
  validates :released, inclusion: { in: [true, false]}
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released
  validate :release_year?


  def release_year?
    if release_year && release_year >= Time.now.year
        errors.add(:release_year, "can't be released at this time")
    end
  end
end
