require_relative 'helpers/csv_helper'
require_relative 'helpers/lendings_helper'

# lendings = read_csv_from_user_input
lendings = read_csv_from_file('files/lendings.csv')

begin
  lendings.each do |lending|
    add_lending_agreement(lending)
  end
rescue RestClient::ExceptionWithResponse => e
  puts e.response
end
