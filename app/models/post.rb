class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbaity?

  def clickbaity?
   # if title=="True Facts"
   #   binding.pry
   # end
    
    if title
      if title.match(/Won't Believe/i) || title.match(/Secret/i) || title.match(/Top [0-9]*/i) || title.match(/Guess/i)
        true
      else
        errors.add(:title, "must be clickbait")
      end
    else 
      false
    end
  end
end
