require "giveaway/version"

module Giveaway
  class Engine < ::Rails::Engine
    paths["app"]                 # => ["app"]
    paths["app/controllers"]     # => ["app/controllers"]
    paths["app/helpers"]         # => ["app/helpers"]
    paths["app/models"]          # => ["app/models"]
    paths["app/views"]
  end
end
