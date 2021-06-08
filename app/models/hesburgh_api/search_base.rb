#file = File.open("path-to-file.tar.gz", "rb")
#contents = file.read

module HesburghAPI
  class SearchBase
    BASE_PATH = "/"

    def self.base_path
      const_get(:BASE_PATH)
    end

    def self.get_json(path, params = {})
      JSON.parse(get(path, params, :json))
    end

    def self.get(path, params = {}, format = nil)
      require 'open-uri'
      open(api_url(path, params, format)).read
    end

    def self.api_url(path, params = {}, format = nil)
      if format.present?
        extension = ".#{format}"
      end
      params[:auth_token] = yml['token']

      File.join(yml['url'], base_path, "#{path}#{extension}?#{convert_params_to_string(params)}")
    end


    protected

      def self.convert_params_to_string(params)
        params.to_query
      end

      def self.yml
        path = File.join(Rails.root, "config", "hesburgh_api.yml")
        template = ERB.new(File.read(path))
        processed = template.result(binding)

        @yml ||= YAML.load(processed)
        @yml.fetch(Rails.env)
      end

  end
end
