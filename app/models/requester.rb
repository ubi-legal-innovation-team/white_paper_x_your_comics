class Requester < ApplicationRecord
	strip_attributes
	
	validates :first_name, :last_name, :reason, :message, presence: { message: I18n.t('join.error_message.text_field') }
	validates :reason, presence: { message: I18n.t('join.error_message.check_box') }
	validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: I18n.t('join.error_message.email') }
	validates :consent, presence: { message: I18n.t('join.error_message.consent') }

	after_create  :set_data_retention_period
	before_create :remove_unpermited

	private

	def set_data_retention_period
		self.update(data_retention_period:self.created_at + 3.year)
	end

	def remove_unpermited
		self.destroy if self.email.include?('sample')
	end

end
