class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 100}
  validates :summary, length: {maximum: 15}
  validates_inclusion_of :category, in: ["Fiction"]
  validates :title, format: {with: /(Won't Believe|Secret|Top \d+|Guess)/, message: "use clickbait title"}



end
