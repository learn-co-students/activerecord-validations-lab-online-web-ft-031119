class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\b(?:Won't|Believe|Secret|Top[0-9]|Guess)\b/
      record.errors[attribute] << (options[:message] || "is not a clickbait title")
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true, title: true
  validates :content, length: { minimum: 10 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
end
