require 'csv'

def read_lines
  lines = []
  loop do
    line = gets.chomp
    break if line == ""
    lines << line.split(",")
  end
  return lines
end

def read_csv_from_user_input
  puts 'Copie e cole seu CSV abaixo:'
  lines = read_lines
  headers = lines.delete_at(0)

  new_lines = []
  lines.each do |line|
    new_line = {}
    headers.each_with_index do |header, i|
      new_line[header.to_sym] = line[i]
    end
    new_lines << new_line
  end
  return new_lines
end

def read_csv_from_file(filepath)
  lines = []
  CSV.foreach(filepath) { |line| lines << line }
  headers = lines.delete_at(0)

  new_lines = []
  lines.each do |line|
    new_line = {}
    headers.each_with_index do |header, i|
      new_line[header.to_sym] = line[i]
    end
    new_lines << new_line
  end
  return new_lines
end
