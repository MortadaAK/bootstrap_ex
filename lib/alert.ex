defmodule BootstrapEx.Alert do
	@moduledoc """
	This module is used to build generic bootstrap 4 alert
	"""
	use Phoenix.HTML
	alias BootstrapEx.Helper

	@doc ~S"""
	Create header to alert
  ## Examples

      iex> safe_to_string(Alert.alert_heading("Message"))
      "<h4 class=\"alert-heading\">Message</h4>"

	"""
	def alert_heading(message) when is_bitstring(message) do
			alert_heading(message,[])
	end


	@doc ~S"""
	Create header to alert with block
	##Examples

      iex> safe_to_string(Alert.alert_heading() do
      ...>  "Message"
      ...> end)
      "<h4 class=\"alert-heading\">Message</h4>"

	"""
	def alert_heading([do: block]) do
			alert_heading([]) do
					block
			end
	end


	@doc ~S"""
	Create header for alert with custome tag

	##Examples

      iex> safe_to_string(Alert.alert_heading(:h5,"Message"))
      "<h5 class=\"alert-heading\">Message</h5>"

	"""
	def alert_heading(tag,message) when is_atom(tag) and is_bitstring(message) do
			alert_heading(tag,message,[])
	end


	@doc ~S"""
	Create header to alert with attributes passed
	##Examples

      iex> safe_to_string(Alert.alert_heading("Message",class: "text-center"))
      "<h4 class=\"alert-heading text-center\">Message</h4>"

	"""
	def alert_heading(message,attrs) when is_bitstring(message) and is_list(attrs) do
			alert_heading(attrs) do
					message
			end
	end

	@doc ~S"""
	Create header to alert with passed attributes and block
	##Examples

      iex> safe_to_string(Alert.alert_heading("Message",class: "text-center"))
      "<h4 class=\"alert-heading text-center\">Message</h4>"

	"""
	def alert_heading(attrs,[do: block]) when is_list(attrs) do
			alert_heading(:h4,attrs) do
					block
			end
	end

	@doc ~S"""
	Create header to alert with attributes passed with custom tag
	##Examples

      iex> safe_to_string(Alert.alert_heading(:h6,"Message",class: "text-center"))
      "<h6 class=\"alert-heading text-center\">Message</h6>"

	"""
	def alert_heading(tag,message,attrs) when is_atom(tag) and is_bitstring(message) and is_list(attrs) do
			alert_heading(tag,attrs) do
					message
			end
	end

	@doc ~S"""
	Create header to alert with attributes passed with custom tag with block
	##Examples

      iex> safe_to_string(Alert.alert_heading(:h6,class: "text-center") do
      ...>    "Message" 
      ...> end)
      "<h6 class=\"alert-heading text-center\">Message</h6>"

	"""
	def alert_heading(tag,attrs,[do: block]) when  is_atom(tag) and is_list(attrs) do
			content_tag(tag,Helper.insure_class(attrs,"alert-heading")) do
					block
			end
	end

	@doc ~S"""
	Generate empty alert div with class alert alert-danger
	##Examples

				iex> safe_to_string(Alert.alert())
				"<div class=\"alert alert-danger\"></div>"

	"""
	def alert() do
			alert("")
	end

	@doc ~S"""
	Generate alert div with class alert alert-danger with given block
	##Examples
			iex> safe_to_string(Alert.alert("ALERT"))
			"<div class=\"alert alert-danger\">ALERT</div>"
	"""
	def alert(message) when is_bitstring(message)  do
			alert(message,[class: "alert-danger"])
	end

	@doc ~S"""
	Generate alert div with class alert and any given attrs
	##Examples

				iex> safe_to_string(Alert.alert(class: "alert-info", id: "some-id"))
				"<div class=\"alert alert-info\" id=\"some-id\"></div>"
			
	"""
	def alert(attrs) when is_list(attrs)  do
			alert("",attrs)
	end

	@doc ~S"""
	Generate div with given message, class alert and any given attrs
	##Examples

				iex> safe_to_string(Alert.alert("Welcome!" ,class: "alert-success", id: "some-id"))
				"<div class=\"alert alert-success\" id=\"some-id\">Welcome!</div>"

	"""
	def alert(message,attrs) when is_list(attrs) and is_bitstring(message)  do
			alert(message,:div,attrs)
	end

	@doc ~S"""
	Generate div with given message, class alert and any given attrs
	##Examples

				iex> safe_to_string(Alert.alert(class: "alert-success", id: "some-id") do
				...>    "Welcome!" 
				...> end)
				"<div class=\"alert alert-success\" id=\"some-id\">Welcome!</div>"

	"""
	def alert(attrs,[do: block]) when is_list(attrs)  do
			alert(:div,attrs) do
					block
			end
	end

	@doc ~S"""
	Generate alert with custom tag with class alert and any given attrs
	##Examples

					iex> safe_to_string(Alert.alert("Welcome!",:p ,class: "alert-success", id: "some-id"))
					"<p class=\"alert alert-success\" id=\"some-id\">Welcome!</p>"

	"""
	def alert(message,tag,attrs) when is_atom(tag) and is_list(attrs) and is_bitstring(message)  do
			alert(tag,attrs) do
					message
			end
	end

	@doc ~S"""
	Generate alert with header,message and context class
	
	## Examples

				iex> safe_to_string(Alert.alert("Haader","Message" ,"success")
				"<div class=\"alert alert-success\"><h4 class=\"alert-heading\">Header</h4>Message</div>"

	"""
	def alert(header,message,context) when is_bitstring(header) and is_bitstring(message) and is_bitstring(context)  do
		alert(header,message,context,[])
	end

	@doc ~S"""
	Generate alert with custom tag class alert and any given attrs
	##Examples

					iex> safe_to_string(Alert.alert(:p,class: "alert-success", id: "some-id") do
					...>    "Welcome!" 
					...> end)
					"<p class=\"alert alert-success\" id=\"some-id\">Welcome!</p>"

	"""
	def alert(tag,attrs,[do: block]) when is_atom(tag) and is_list(attrs)  do
			content_tag(tag,Helper.insure_class(attrs, "alert")) do
					block
			end
	end

	@doc ~S"""
	generate div with class alert and any given attrs
	##Examples

					iex> safe_to_string(Alert.alert(:div,"Hello",class: "alert-success", id: "some-id") do
					...>    "Welcome!" 
					...> end)
					"<div class=\"alert alert-success\" id=\"some-id\"><h4 class=\"alert-heading\">Hello</h4>Welcome!</div>"

	"""
	def alert(tag,header,attrs,[do: block]) when is_atom(tag) and is_list(attrs)  do
			alert(tag,header,"",attrs) do
				block
			end
	end

	@doc ~S"""
	Generate alert with header,message and context class
	
	## Examples

				iex> safe_to_string(Alert.alert("Haader","Message" ,"success",id: "some-id"))
				"<div class=\"alert alert-success\" id=\"some-id\"><h4 class=\"alert-heading\">Haader</h4>Message</div>"

	"""
	def alert(header,message,context,attributes) when is_bitstring(header) and is_bitstring(message) and is_bitstring(context) and is_list(attributes)  do
		alert(:div,header,context,attributes) do
			message
		end
 	end

	@doc ~S"""
	generate div with class alert and any given attrs
	##Examples

					iex> safe_to_string(Alert.alert(:div,"Hello","success",id: "some-id") do
					...>    "Welcome!" 
					...> end)
					"<div class=\"alert alert-success\" id=\"some-id\"><h4 class=\"alert-heading\">Hello</h4>Welcome!</div>"

	"""
	def alert(tag,header,context,attrs,[do: block]) when is_atom(tag) and is_list(attrs)  do
			content_tag(tag,Helper.insure_class(attrs, "alert",context)) do
					[alert_heading(header),block]
			end
	end

end