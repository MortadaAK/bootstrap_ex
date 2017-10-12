defmodule BootstrapEx.Badge do
	@moduledoc ~S"""
	This module is used to build generic bootstrap 4 badge
	"""
	use Phoenix.HTML
	alias BootstrapEx.Helper
 
	@doc ~S"""
	create badge

	iex> safe_to_string(BootstrapEx.Badge.badge(1))
	"<span class=\"badge badge-secondary\">1</span>"
	"""
	def badge(message) do
			badge(message,"secondary")
	end
 
	@doc ~S"""
	Create badge with custom tag

	## Examples 

	iex> safe_to_string(BootstrapEx.Badge.badge(:b,1))
	"<b class=\"badge badge-secondary\">1</b>"

	"""
	def badge(tag,message) when is_atom(tag) do
			badge(tag,message,"secondary")
	end

	@doc ~S"""
	create badge with context
	iex> safe_to_string(BootstrapEx.Badge.badge(1,"danger"))
	"<span class=\"badge badge-danger\">1</span>"
	"""
	def badge(message,context) when is_bitstring(context) do
			badge(message,context,[])
	end
	
 
	@doc ~S"""
	create badge with attributes

	iex> safe_to_string(BootstrapEx.Badge.badge(1,class: "badge-secondary"))
	"<span class=\"badge badge-secondary\">1</span>"
	"""
	def badge(message,attrs) when is_list(attrs) do
			badge(message,"",attrs)
	end
	

	@doc ~S"""
	create badge with context and attributes

	iex> safe_to_string(BootstrapEx.Badge.badge(1,"danger",class: "text-bold"))
	"<span class=\"badge text-bold badge-danger\">1</span>"
	"""
	def badge(message,context,attrs) when is_bitstring(context) and is_list(attrs) do
			badge(:span,message,context,attrs)
	end

	@doc ~S"""
	create badge with custom tage, context and attributes

	iex> safe_to_string(BootstrapEx.Badge.badge(:b,1,"danger"))
	"<b class=\"badge badge-danger\">1</b>"
	"""
	def badge(tag,message,context) when is_atom(tag) and is_bitstring(context) do
			badge(tag,message,context,[])
	end

	@doc ~S"""
	create badge with custom tag and context and attributes

	iex> safe_to_string(BootstrapEx.Badge.badge(:b,1,"danger",class: "other-class"))
	"<b class=\"badge other-class badge-danger\">1</b>"
	"""
	def badge(tag,message,context,attrs) when is_atom(tag) and is_bitstring(context) and is_list(attrs) do
			content_tag(tag,message,Helper.insure_class(attrs,"badge",context))
	end
end