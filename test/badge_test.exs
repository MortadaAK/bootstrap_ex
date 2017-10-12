defmodule BootstrapEx.BadgeTest do
	use ExUnit.Case
	use Phoenix.HTML
	alias BootstrapEx.{Badge}
	doctest Badge

	test "create badge" do
		 assert safe_to_string(Badge.badge(1)) ==
		 "<span class=\"badge badge-secondary\">1</span>"
	end

	test "Create badge with custom tag" do
		assert safe_to_string(Badge.badge(:b,1)) == 
		"<b class=\"badge badge-secondary\">1</b>"
	end

	test "create badge with context" do 
		assert safe_to_string(BootstrapEx.Badge.badge(1,"danger")) == 
		"<span class=\"badge badge-danger\">1</span>"
	end

	test "create badge with attributes" do 
		assert safe_to_string(BootstrapEx.Badge.badge(1,class: "badge-secondary")) == 
		"<span class=\"badge badge-secondary\">1</span>"
	end

	test "create badge with context and attributes" do
		assert safe_to_string(BootstrapEx.Badge.badge(1,"danger",class: "text-bold")) ==
		"<span class=\"badge text-bold badge-danger\">1</span>"
	end

	test "create badge with custom tage,context and attributes" do
		assert safe_to_string(BootstrapEx.Badge.badge(:b,1,"danger")) == 
		"<b class=\"badge badge-danger\">1</b>"
	end
	test "create badge with custom tag and context and attributes" do
		assert safe_to_string(BootstrapEx.Badge.badge(:b,1,"danger",class: "other-class")) == 
		"<b class=\"badge other-class badge-danger\">1</b>"
	end
end