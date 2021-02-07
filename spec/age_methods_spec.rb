require 'age_methods'

# tests = [
#   Date.new(1986, 1, 1),
#   Date.new(1988, Date.today.month, Date.today.day),
#   Date.new(1990, 12, 30)
# ]

# puts '====== ages ======'
# tests.each do |date|
#   puts "#{date} => #{User.new('Test', date).age}"
# end

# puts '====== birthdays ======'
# tests.each do |date|
#   puts "#{date} => #{User.new('Test', date).next_birthday}"
# end

describe '#age' do
  let(:age_check) { User.new('Test', Date.new(1986, 1, 1)) }
  it 'should return an Integer representing the users current age' do
    expect(age_check.age).to eq 34
  end

  let(:age_check_today) { User.new('Test', Date.new(1988, Date.today.month, Date.today.day)) }
  it 'should return an Integer representing the users current age if they were born on this day' do
    expect(age_check_today.age).to eq 32
  end

  let(:age_check_future_born) { User.new('Test', Date.new(2030, 12, 30)) }
  it 'should return "date of birth must be in the past" if the inputted date is in the future' do
    expect(age_check_future_born.age).to eq 'date of birth must be in the past'
  end
end

describe '#next_birthday' do
  let(:next_birthday_check) { User.new('Test', Date.new(1986, 1, 1)) }
  it 'should returns a Date object for the users current upcoming birthday' do
    expect(next_birthday_check.next_birthday).to eq Date.new(2021, 1, 1)
  end

  let(:next_birthday_check_today) { User.new('Test', Date.new(1988, Date.today.month, Date.today.day)) }
  it 'should return a Date object for the user born on this day in the past' do
    expect(next_birthday_check_today.next_birthday).to eq Date.today
  end

  let(:next_birthday_check_future) { User.new('Test', Date.new(2030, 12, 30)) }
  it 'should return "date of birth must be in the past" if the inputted date is in the future' do
    expect(next_birthday_check_future.next_birthday).to eq 'date of birth must be in the past'
  end
end
