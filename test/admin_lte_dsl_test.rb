require "test_helper"

class AdminLteDslTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert AdminLteDsl::VERSION
  end

  test "AdminLteDsl::Helpers::Navbar" do
    require "admin_lte_dsl/helpers/navbar"

    class DummyClass
      include AdminLteDsl::Helpers::Navbar
    end

    assert_equal DummyClass.new.admin_lte_navbar, "AdminLteDsl::Navbar#navbar"
  end
end
