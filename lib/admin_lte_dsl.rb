require "dry-configurable"
require "admin_lte_dsl/version"
require "admin_lte_dsl/railtie"

module AdminLteDsl
  extend Dry::Configurable

  setting :theme, default: 'dark'

  setting :dsl do
    setting :navbar do
      setting :path, default: "admin_lte_dsl/navbar"
    end

    setting :sidebar do
      setting :path, default: "admin_lte_dsl/sidebar"
    end
  end

  def self.root
    Pathname.new(File.expand_path("..", __dir__))
  end
end
