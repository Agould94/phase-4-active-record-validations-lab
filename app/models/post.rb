class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :is_clickbait?

    def is_clickbait?
        clickbait = [/Won't Believe/i, /Secret/i,/Top \d/i,/Guess/i]
        if clickbait.none?{|phrase| phrase.match title}
            errors.add(:title, "This title is not clickbait!")
        end
    end
end
