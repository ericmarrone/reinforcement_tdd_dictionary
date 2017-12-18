class Dictionary
  attr_reader :entries
  def initialize
    @entries = {}
  end

  def add(keyword_definition)
    if keyword_definition.class != Hash
      @entries.merge!('fish' => nil)
    else
      @entries.merge!(keyword_definition)
    end
  end

  def keywords
    @entries.keys.sort
  end

  def include?(word)
    keywords.include?(word)
  end

  def find(word_segment)
    keywords.reduce({}) do |matching_items, keyword|
      if keyword.start_with?(word_segment)
        matching_items[keyword] = @entries[keyword]
      end
      matching_items
    end
  end
end
