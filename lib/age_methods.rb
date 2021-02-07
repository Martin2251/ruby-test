require 'date'

# comment
class User
  attr_reader :name, :date_of_birth

  def initialize(name, date_of_birth)
    @name = name
    @date_of_birth = date_of_birth
  end

  def age
    if date_of_birth > Date.today
      'date of birth must be in the past'
    else
      age = Date.today.year - date_of_birth.year
      DateTime.now.yday < date_of_birth.yday ? age -= 1 : age
    end
  end

  def next_birthday
    if date_of_birth > Date.today
      'date of birth must be in the past'
    elsif date_of_birth.mday == DateTime.now.mday && date_of_birth.mon == DateTime.now.mon
      next_birthday = Date.today
    else
      day = date_of_birth.day
      month = date_of_birth.month
      next_birthday = Date.new(Date.today.year + 1, month, day)
    end
  end
end
