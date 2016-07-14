require_relative 'edge_list.rb'

class AdMat
  attr_accessor :matrix, :name_list

  def initialize
    @matrix = []
    @name_list = []
  end

  def run
    loop do
      puts "What would you like to do? i/p/q"
      result = gets.chomp
      dispatch_command(result.to_sym) if %w(i p q).include?(result)
    end
  end

  def dispatch_command(command)
    case command
    when :q
      exit
    when :p
      print_matrix
    when :i
      import(EDGE_LIST)
    end
  end

  def import(elist)
    num_users = find_num_users(elist)
    @matrix = Array.new(num_users){Array.new(num_users)}
    elist.each do |edge|
      combo = [edge[0].name, edge[0].id]
      @name_list << combo unless @name_list.include?(combo)
      @matrix[edge[0].id-1][edge[1].id-1] = edge[2]
    end
  end

  def print_matrix
    print_name_row
    @matrix.each_with_index do |edge, index|
      name = get_name_by_index(index + 1)
      print format_name(name)
      edge.each do |item|
        print item.to_s.ljust(6)
      end
      puts
    end
  end

  def format_name(name)
    return "".ljust(6) if name.nil?
    name[0..4].ljust(6)
  end

  def get_name_by_index(index)
    @name_list.each do |item|
      return item[0] if item[1] == index
    end
    nil
  end

  def print_name_row
    print ' '.ljust(6)
    @name_list.each do |item|
      print format_name(item[0])
    end
    puts
  end

  def find_num_users(elist)
    max = 0
    elist.each do |edge|
      max = edge[0].id if edge[0].id > max
      max = edge[1].id if edge[1].id > max
    end
    max
  end
end
