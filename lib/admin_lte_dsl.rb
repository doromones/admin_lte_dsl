require "dry-configurable"
require "admin_lte_dsl/version"
require "admin_lte_dsl/railtie"

module AdminLteDsl
  extend Dry::Configurable

  setting :views do
    setting :navbar, default: "admin_lte_dsl/navbar"
    # setting :navbar, default: File.join(File.expand_path('../..', __FILE__), 'app/views/admin_lte_dsl/navbar')
  end

  def self.root
    Pathname.new(File.expand_path('..', __dir__))
  end
end
