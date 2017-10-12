defmodule BootstrapEx.Helper do
	@moduledoc """
	This module is used as helper in building classess
	"""
	@doc """
	Add base class to a list
	
  ## Examples

      iex> BootstrapEx.Helper.insure_class([],"card")
      [class: "card"]

	Do nothing when the class already there

	## Examples
	
			iex> BootstrapEx.Helper.insure_class([class: "card"],"card")
			[class: "card"]

	Trim spaces between classes

  ## Examples

			iex> BootstrapEx.Helper.insure_class([class: " card "],"card")
			[class: "card"]

	"""
	def insure_class([],class) do
			[class: class]
	end
	
	def insure_class(attr,class) do
			insure_class(attr,class,"")
	end

	@doc ~S"""
	add default context to classes
	## Examples   
      iex> BootstrapEx.Helper.insure_class([class: " alert "],"alert","danger")
      [class: "alert alert-danger"]

      iex> BootstrapEx.Helper.insure_class([class: " alert alert-success"],"alert","danger")
      [class: "alert alert-success"]
	"""
	def insure_class([],default,context) do
		[class: "#{default} #{default}-#{context}"]
	end
	def insure_class(attr,default,context) do
			class = attr |> List.keyfind(:class,0)
			attr = attr |> List.delete(class)
			class_name = class 
									|> get_class 
									|> add_default_class(default) 
									|> add_context(default,context)
									|> String.split 
									|> Enum.uniq 
									|> Enum.join(" ")
			[class: class_name] ++ attr
	end
	defp get_class(class) do
			case class do 
					{:class, i} -> i
					nil -> ""
			end
	end
	defp add_default_class(class,default) do
			case String.split(class) |> Enum.member?(default) do
					true -> class
					false -> "#{default} #{class}"
			end
	end
	defp add_context(class,_default,"") do
			class
	end
	defp add_context(class,default,context) do
			case Regex.match?(~r/#{default}-\w+/ ,class) do
					true -> class
					false -> "#{class} #{default}-#{context}"
			end
	end
end