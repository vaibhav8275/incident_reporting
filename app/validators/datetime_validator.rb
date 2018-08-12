class DatetimeValidator < ActiveModel::Validator
  def validate(record)
    DateTime.parse(record.observed_at.to_s)
  rescue ArgumentError
    record.errors[:observed_at] << "Invalid datetime format"
  end
end