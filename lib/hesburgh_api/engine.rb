require File.expand_path('../../hash_ostruct', __FILE__)

module HesburghApi
    class Engine < ::Rails::Engine
        config.autoload_paths << File.expand_path("../../app/service", __FILE__)
        isolate_namespace HesburghApi
    end
end
