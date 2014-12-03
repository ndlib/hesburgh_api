module HesburghAPI
  class Employee < SearchBase

    def self.all
      result = get_json('library/all')
      result["people"]
    end
  end
end
