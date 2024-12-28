require "test_helper"
require "admin_lte_dsl/dsl/sidebar"

class TestController < ActionController::Base
end

class AdminLteDsl::DSL::SidebarTest < ActiveSupport::TestCase
  test "AdminLteDsl::DSL::Sidebar" do
    @controller_view = TestController.new.view_context

    result =
      AdminLteDsl::DSL::Sidebar.new(@controller_view).builder do |b|

      end

    expectation = <<-HTML

HTML

    assert_equal expectation, result
  end
end
