require "admin_lte_dsl/helpers/navbar"
require "admin_lte_dsl/dsl/navbar"

module AdminLteDsl
  class Railtie < ::Rails::Railtie
    initializer "admin_lte_dsl.view_helpers" do
      ActiveSupport.on_load(:action_view) do
        include AdminLteDsl::Helpers::Navbar
      end
    end
  end
end
