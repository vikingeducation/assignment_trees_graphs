class AdjacencyMatrix

  def initialize(edge_list)
    @arr = []
    @hash = {}
  end

  def build_hash()
    row_count=0
    el.list.each do |edge|
      unless @hash.has_key?(edge[0].id)
        @hash[edge[0].id] = row_count
        row_count += 1
      end
    end
  end