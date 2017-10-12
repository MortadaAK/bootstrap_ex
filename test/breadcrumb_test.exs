defmodule BootstrapEx.BreadcrumbTest do
	use ExUnit.Case
	use Phoenix.HTML 
	alias BootstrapEx.Breadcrumb
	test "should create breadcrumb.ol" do
		assert safe_to_string(Breadcrumb.breadcrumb()) ==
		"<ol class=\"breadcrumb\"></ol>" 
	end

	test "should accept block" do
		assert safe_to_string(Breadcrumb.breadcrumb() do
			content_tag(:li,"")
		end) ==
		"<ol class=\"breadcrumb\"><li></li></ol>"
	end

	test "should set any tag with class of breadcrumb" do
		assert safe_to_string(Breadcrumb.breadcrumb(:nav)) ==
		"<nav class=\"breadcrumb\"></nav>" 
	end

	test "should set attributes of breadcrumb" do
		assert safe_to_string(Breadcrumb.breadcrumb(id: "some-id")) ==
		"<ol class=\"breadcrumb\" id=\"some-id\"></ol>"
	end

	test "should accept block and attributes" do
		assert safe_to_string(Breadcrumb.breadcrumb(id: "some-id") do
			content_tag(:li,"")
		end) ==
		"<ol class=\"breadcrumb\" id=\"some-id\"><li></li></ol>"
	end

	test "should accept block and custom tag" do
		assert safe_to_string(Breadcrumb.breadcrumb(:div) do
			content_tag(:a,"")
		end) ==
		"<div class=\"breadcrumb\"><a></a></div>"
	end

	
	test "should set attributes of breadcrumb with custom tag" do
		assert safe_to_string(Breadcrumb.breadcrumb(:nav,id: "some-id")) ==
		"<nav class=\"breadcrumb\" id=\"some-id\"></nav>"
	end
	
	test "should set attributes of breadcrumb with custom tag with block" do
		assert safe_to_string(Breadcrumb.breadcrumb(:nav,id: "some-id") do
			content_tag(:a,"")
		end) ==
		"<nav class=\"breadcrumb\" id=\"some-id\"><a></a></nav>"
	end
	test "create default breadcrumb-item with li" do
		assert safe_to_string(Breadcrumb.breadcrumb_item()) == "<li class=\"breadcrumb-item\"></li>" 
	end
	test "create default breadcrumb-item with li with custom attributes" do
		assert safe_to_string(Breadcrumb.breadcrumb_item(class: "active")) == "<li class=\"breadcrumb-item active\"></li>" 
	end
	test "create breadcrumb-item with custom tag" do
		assert safe_to_string(Breadcrumb.breadcrumb_item(:a)) == "<a class=\"breadcrumb-item\"></a>" 
	end
	test "create breadcrumb-item with custom tag and contnt" do
		assert safe_to_string(Breadcrumb.breadcrumb_item(:a,"Admin")) == "<a class=\"breadcrumb-item\">Admin</a>" 		
	end
	test "create breadcrumb-item with custom tag and attributes" do
		assert safe_to_string(Breadcrumb.breadcrumb_item(:a,id: "some-id")) == "<a class=\"breadcrumb-item\" id=\"some-id\"></a>" 
	end
	test "create breadcrumb-item with custom tag, attributes and content" do
		assert safe_to_string(Breadcrumb.breadcrumb_item(:a,"Admin",id: "some-id")) == "<a class=\"breadcrumb-item\" id=\"some-id\">Admin</a>" 
	end
	test "create breadcrumb-item with custom tag, attributes and block" do
		assert safe_to_string(Breadcrumb.breadcrumb_item(:a,id: "some-id") do
			"Admin"
		end) == "<a class=\"breadcrumb-item\" id=\"some-id\">Admin</a>" 
	end
end