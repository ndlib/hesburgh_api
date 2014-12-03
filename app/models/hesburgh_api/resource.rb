module HesburghAPI
  class Resource < SearchBase
    BASE_PATH = "/1.0/resources/"

    def self.find(netid)
      result = get_json("by_netid/#{netid}")
      result["people"].first
    end

  end
end
