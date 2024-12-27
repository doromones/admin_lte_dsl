require "admin_lte_dsl/helpers/navbar"

module AdminLteDsl
  class Railtie < ::Rails::Railtie
    initializer "admin_lte_dsl.view_helpers" do
      ActiveSupport.on_load(:action_view) { include AdminLteDsl::Helpers::Navbar }
    end
  end
end
