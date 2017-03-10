require_relative "crossncircle/version"

module Crossncircle
end

require_relative "./crossncircle/core_extensions.rb"
lib_path = File.expand_path(File.dirname(__FILE__))
Dir[lib_path + "/crossncircle/**/*.rb"].each { |file| require file }
