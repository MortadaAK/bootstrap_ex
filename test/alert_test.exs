defmodule BootstrapEx.AlertTest do
	use ExUnit.Case
	use Phoenix.HTML
	alias BootstrapEx.{Alert}
	doctest Alert
	test "create header alert" do
		assert safe_to_string(Alert.alert_heading("Message")) ==
		"<h4 class=\"alert-heading\">Message</h4>"
	end
	test "Create header to alert with block" do
      assert  safe_to_string(Alert.alert_heading() do
      "Message"
        end) == 
      "<h4 class=\"alert-heading\">Message</h4>"
	end
	test "Create header for alert with custome tag" do
		assert safe_to_string(Alert.alert_heading(:h5,"Message")) == 
				"<h5 class=\"alert-heading\">Message</h5>"
	end
	test "Create header to alert with attributes passed" do 
		
		assert safe_to_string(Alert.alert_heading("Message",class: "text-center")) == 
		"<h4 class=\"alert-heading text-center\">Message</h4>"
	end
	test "	Create header to alert with passed attributes and block" do
		assert safe_to_string(Alert.alert_heading("Message",class: "text-center")) == 
		"<h4 class=\"alert-heading text-center\">Message</h4>"
	end
	test "Create header to alert with attributes passed with custom tag" do
		assert safe_to_string(Alert.alert_heading(:h6,"Message",class: "text-center")) == 
		"<h6 class=\"alert-heading text-center\">Message</h6>"
	end
	test "Create header to alert with attributes passed with custom tag with block" do
		
		assert safe_to_string(Alert.alert_heading(:h6,class: "text-center") do
          "Message" 
       end) == 
      "<h6 class=\"alert-heading text-center\">Message</h6>"
	end
	test "Generate empty alert div with class alert alert-danger" do
		assert safe_to_string(Alert.alert()) ==
		"<div class=\"alert alert-danger\"></div>"
	end
	test "Generate alert div with class alert alert-danger with given block" do
		assert safe_to_string(Alert.alert("ALERT")) ==
		"<div class=\"alert alert-danger\">ALERT</div>"
	end
	test "Generate alert div with class alert and any given attrs" do 
		assert safe_to_string(Alert.alert(class: "alert-info", id: "some-id")) == 
		"<div class=\"alert alert-info\" id=\"some-id\"></div>"
	end
	test "Generate div with given message, class alert and any given attrs" do 
		assert safe_to_string(Alert.alert("Welcome!" ,class: "alert-success", id: "some-id")) ==
		"<div class=\"alert alert-success\" id=\"some-id\">Welcome!</div>"
	end
	test "generate div with given class alert, any given attrs and block" do
		assert safe_to_string(Alert.alert(class: "alert-success", id: "some-id") do
			    "Welcome!" 
			 end) == 
			"<div class=\"alert alert-success\" id=\"some-id\">Welcome!</div>"
	end
	test "Generate alert with custom tag with class alert and any given attrs" do 
		assert safe_to_string(Alert.alert("Welcome!",:p ,class: "alert-success", id: "some-id")) == 
		"<p class=\"alert alert-success\" id=\"some-id\">Welcome!</p>"
	end
	test "Generate alert with custom tag class alert and any given attrs" do
		
		assert safe_to_string(Alert.alert(:p,class: "alert-success", id: "some-id") do
			    "Welcome!" 
			 end)==
			"<p class=\"alert alert-success\" id=\"some-id\">Welcome!</p>"
	end
	test "Generate div with class alert with header and any given attrs with block" do
		assert safe_to_string(Alert.alert(:div,"Hello",class: "alert-success", id: "some-id") do
		    "Welcome!" 
		 end) == 
		"<div class=\"alert alert-success\" id=\"some-id\"><h4 class=\"alert-heading\">Hello</h4>Welcome!</div>"
	end
	test "Generate alert div with header,message and context" do
		assert safe_to_string(Alert.alert("Header","Message","danger")) == 
		"<div class=\"alert alert-danger\"><h4 class=\"alert-heading\">Header</h4>Message</div>"
	end
	test "Generate alert div with header,message, context and attributes" do
		assert safe_to_string(Alert.alert("Header","Message","danger",id: "some-id")) == 
		"<div class=\"alert alert-danger\" id=\"some-id\"><h4 class=\"alert-heading\">Header</h4>Message</div>"
	end
end