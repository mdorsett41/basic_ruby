require 'ostruct'
require 'time'

class RecordParser

  def parse(record_string)
    if record_string.include?('|')
      fields = record_string.split('|').map(&:strip)
      OpenStruct.new(first_name: fields[1], last_name: fields[0],
                     favorite_color: fields[4], date_of_birth: Time.parse(fields[5]))
    else
      fields = record_string.split(' ')
      date = Time.strptime(fields[4], '%m-%d-%Y')
      OpenStruct.new(first_name: fields[1], last_name: fields[0],
                     favorite_color: fields[5], date_of_birth: date)

    end
  end
end
