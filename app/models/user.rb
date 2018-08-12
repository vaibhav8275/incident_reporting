class User < ApplicationRecord

	has_many :incidents

  enum role: {
  	student: 0,
  	teacher: 1,
  	other_staff: 2,
  	guardian: 3
  }

  validate :phone_or_email_blank

  private

    def phone_or_email_blank 
      if !(phone.present? || email.present?)
        errors.add(:base, :phone_or_email_blank, message: "either phone or email must be present")
      end
    end
end