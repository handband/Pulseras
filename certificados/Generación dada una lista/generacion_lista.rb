require 'prawn'
require 'barby'
require 'barby/barcode/code_128'
require 'barby/barcode/ean_13'
require 'barby/outputter/png_outputter'
require 'stringio'
require 'spreadsheet'


filename = "molde_certificado.pdf"

Prawn::Document.generate("out.pdf", :template => filename) do |pdf|

	pdf.font "arial.ttf"
	
	Spreadsheet.open('lista.xls') do |book|
		book.worksheet('Sheet1').each do |row|
			break if row[0].nil?

			pdf.start_new_page(:template => filename)
			x = 310
			y = 379

			box_width = 270
			box_heigth = 80 
			letter_size = 14

			pdf.bounding_box([x,y], :width => box_width, :height => box_heigth) do
			      pdf.stroke_bounds
			      pdf.text_box "#{row[0]}", :size => letter_size, :disable_wrap_by_char => true, :valign => :center,:align => :left
			end			

			puts "#{row[0]}"


			end

	end
end