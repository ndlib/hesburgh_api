module HesburghAPI
  class Discovery < SearchBase

    class NotFound < Exception
    end

    BASE_PATH = "/1.0/discovery/"

    def self.record(q)
      q = fix_id(q)
      result = get_json("id", {:q => q})

      if result["records"].nil?
        raise NotFound.new()
      else
        result["records"].first
      end
    end


    def self.fix_id(id)
      if id.match(/^[0-9]{9}$/)
        "ndu_aleph#{id}"
      else
        id
      end
    end


  end
end
