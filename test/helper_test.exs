defmodule BootstrapEx.HelperTest do
	use ExUnit.Case
	alias BootstrapEx.Helper
	doctest Helper
	test "should return the class as supplied when there is no attributes passed" do
		assert Helper.insure_class([],"class") == [class: "class"]
	end
	test "should add the class to the list of classes that where supplied" do
		assert Helper.insure_class([class: "class1"],"class") == [class: "class class1"]		
	end
	test "should remove all spaces in the supplied class" do
		assert Helper.insure_class([class: "   class1   "],"class") == [class: "class class1"]				
	end
	test "should not add the class if it was supplied" do
		assert Helper.insure_class([class: "class"],"class") == [class: "class"]						
	end
	test "Add context class" do
		assert Helper.insure_class([],"alert","danger") == [class: "alert alert-danger"]
	end
	test "should not add any class if the context is avaialable" do
		assert Helper.insure_class([class: "alert alert-success"],"alert","danger") == [class: "alert alert-success"]
	end
end