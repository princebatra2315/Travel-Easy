class Feedback < ApplicationRecord
	 validates :name, presence: true
	 validates :email, presence: true
	 validates :subject, presence: true
	 validates :message, presence: true 
end
