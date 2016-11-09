
# Person struct
Person = Struct.new(:id, :name)

# An edge list of connections between people in the format
# [ORIGIN_PERSON, DESTINATION_PERSON, WEIGHT]

EDGE_LIST = [
  [Person.new(1, 'Harry'), Person.new(10, 'Alice'), 2],
  [Person.new(1, 'Harry'), Person.new(0, 'Bob'), 9],
  [Person.new(1, 'Harry'), Person.new(4, 'Michael'), 11],
  [Person.new(1, 'Harry'), Person.new(16, 'Peter'), 12],
  [Person.new(2, 'Sally'), Person.new(7, 'Dan'), 16],
  [Person.new(2, 'Sally'), Person.new(14, 'Mike'), 1],
  [Person.new(2, 'Sally'), Person.new(10, 'Alice'), 7],
  [Person.new(3, 'Sam'), Person.new(19, 'Boris'), 16],
  [Person.new(4, 'Michael'), Person.new(7, 'Dan'), 19],
  [Person.new(4, 'Michael'), Person.new(2, 'Sally'), 8],
  [Person.new(4, 'Michael'), Person.new(17, 'Andur'), 11],
  [Person.new(4, 'Michael'), Person.new(14, 'Mike'), 11],
  [Person.new(5, 'Michelle'), Person.new(3, 'Sam'), 9],
  [Person.new(5, 'Michelle'), Person.new(10, 'Alice'), 12],
  [Person.new(5, 'Michelle'), Person.new(6, 'Alok'), 12],
  [Person.new(7, 'Dan'), Person.new(19, 'Boris'), 13],
  [Person.new(7, 'Dan'), Person.new(10, 'Alice'), 11],
  [Person.new(7, 'Dan'), Person.new(5, 'Michelle'), 1],
  [Person.new(8, 'Nick'), Person.new(15, 'Adam'), 1],
  [Person.new(8, 'Nick'), Person.new(16, 'Peter'), 20],
  [Person.new(8, 'Nick'), Person.new(7, 'Dan'), 9],
  [Person.new(8, 'Nick'), Person.new(0, 'Bob'), 9],
  [Person.new(9, 'Olga'), Person.new(6, 'Alok'), 11],
  [Person.new(9, 'Olga'), Person.new(14, 'Mike'), 20],
  [Person.new(9, 'Olga'), Person.new(19, 'Boris'), 12],
  [Person.new(10, 'Alice'), Person.new(3, 'Sam'), 19],
  [Person.new(11, 'Donald'), Person.new(7, 'Dan'), 19],
  [Person.new(12, 'Garrett'), Person.new(10, 'Alice'), 15],
  [Person.new(12, 'Garrett'), Person.new(16, 'Peter'), 7],
  [Person.new(12, 'Garrett'), Person.new(17, 'Andur'), 16],
  [Person.new(12, 'Garrett'), Person.new(18, 'Tom'), 4],
  [Person.new(13, 'Xin'), Person.new(8, 'Nick'), 5],
  [Person.new(13, 'Xin'), Person.new(5, 'Michelle'), 3],
  [Person.new(13, 'Xin'), Person.new(18, 'Tom'), 12],
  [Person.new(13, 'Xin'), Person.new(15, 'Adam'), 17],
  [Person.new(14, 'Mike'), Person.new(12, 'Garrett'), 10],
  [Person.new(15, 'Adam'), Person.new(0, 'Bob'), 18],
  [Person.new(15, 'Adam'), Person.new(17, 'Andur'), 8],
  [Person.new(16, 'Peter'), Person.new(4, 'Michael'), 12],
  [Person.new(16, 'Peter'), Person.new(11, 'Donald'), 10],
  [Person.new(16, 'Peter'), Person.new(2, 'Sally'), 1],
  [Person.new(17, 'Andur'), Person.new(14, 'Mike'), 9],
  [Person.new(17, 'Andur'), Person.new(5, 'Michelle'), 17],
  [Person.new(18, 'Tom'), Person.new(14, 'Mike'), 9],
  [Person.new(18, 'Tom'), Person.new(16, 'Peter'), 14],
  [Person.new(19, 'Boris'), Person.new(2, 'Sally'), 5],
  [Person.new(19, 'Boris'), Person.new(18, 'Tom'), 3],
  [Person.new(19, 'Boris'), Person.new(12, 'Garrett'), 5],
  [Person.new(19, 'Boris'), Person.new(13, 'Xin'), 7]
]


# Helper function to view the edge list
def print_edge_list
  lines = [" -- Edge List -- "]
  EDGE_LIST.each do |e|
    lines << "#{e[0].name}<-#{e[2]}->#{e[1].name}"
  end
  puts lines.join("\n")
end



