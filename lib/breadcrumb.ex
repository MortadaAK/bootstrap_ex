defmodule BootstrapEx.Breadcrumb do
	use Phoenix.HTML
	alias BootstrapEx.Helper

	def breadcrumb() do
		breadcrumb(:ol)
	end
	
	def breadcrumb([do: block])  do
		breadcrumb(:ol) do
			block
		end
	end

	def breadcrumb(tag) when is_atom(tag) do
		breadcrumb(tag,[])
	end


	def breadcrumb(attrs) when is_list(attrs) do
				breadcrumb(:ol,attrs)
	end


	def breadcrumb(attrs,[do: block]) when is_list(attrs) do
		breadcrumb(:ol,attrs) do
			block
		end
	end

	def breadcrumb(tag,[do: block]) when is_atom(tag) do
		breadcrumb(tag,[]) do
			block
		end
	end

	def breadcrumb(tag,attrs) when is_atom(tag) and is_list(attrs) do 
		breadcrumb(tag,attrs) do
		end
	end
	
	def breadcrumb(tag,attrs,[do: block]) when is_atom(tag) and is_list(attrs) do 
		content_tag(tag,Helper.insure_class(attrs, "breadcrumb")) do
			block
		end
	end

	def breadcrumb_item() do
		breadcrumb_item([])
	end

	def breadcrumb_item(attrs) when is_list(attrs) do
		breadcrumb_item(:li,attrs)
	end

	def breadcrumb_item(tag) when is_atom(tag) do
		breadcrumb_item(tag,[])
	end

	def breadcrumb_item(tag,contnt) when is_atom(tag) and is_bitstring(contnt) do
		breadcrumb_item(tag,contnt,[])
	end

	def breadcrumb_item(tag,attrs) when is_atom(tag) and is_list(attrs) do
		breadcrumb_item(tag,attrs) do
			
		end
	end
	def breadcrumb_item(tag,content,attrs) when is_atom(tag) and is_list(attrs) and is_bitstring(content) do
		breadcrumb_item(tag,attrs) do 
			content
		end
	end
	def breadcrumb_item(tag,attrs,[do: block]) when is_atom(tag) and is_list(attrs) do
		content_tag(tag,Helper.insure_class(attrs,"breadcrumb-item")) do
			block
		end
	end
end