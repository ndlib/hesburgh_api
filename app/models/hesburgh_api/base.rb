#file = File.open("path-to-file.tar.gz", "rb")
#contents = file.read

module HesburghAPI
  class Base

    def initialize(data)
      @data = data.with_indifferent_access
    end

    def method_missing(method_sym, *arguments, &block)
      if @data[method_sym]
        @data[method_sym]
      else
        super
      end
    end


    def respond_to?(method_sym, include_private = false)
      if @data.has_key?(method_sym)
        true
      else
        super
      end
    end

  end
end
