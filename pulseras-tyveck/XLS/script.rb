require 'prawn'
require 'barby'
require 'barby/barcode/code_128'
require 'barby/barcode/ean_13'
require 'barby/outputter/png_outputter'
require 'stringio'
require 'spreadsheet'


filename = "pulseras tyveck.pdf"

def insert_code_128(pdf, string, x, y)
	barcode = Barby::Code128B.new(string)
	outputter = Barby::PngOutputter.new(barcode)
	outputter.height = 30
	outputter.margin = 0
	blob = outputter.to_png #Raw PNG data
	data = StringIO.new(blob)
	pdf.rotate(90, :origin => [x, y]) do
		pdf.image data, :at => [x, y], :width => 70, :height => 30
	end
end

def insert_code_ean(pdf, string, x, y)
	barcode = Barby::EAN13.new(string)
	outputter = Barby::PngOutputter.new(barcode)
	outputter.height = 30
	outputter.margin = 0
	blob = outputter.to_png #Raw PNG data
	data = StringIO.new(blob)
	pdf.rotate(90, :origin => [x, y]) do
		pdf.image data, :at => [x, y], :width => 70, :height => 30
	end
end

Prawn::Document.generate("out.pdf", :template => filename) do |pdf|

	pdf.font "MyriadPro-Bold.ttf"
	start_from = 1
	counter = 0
	sec = 0
	Spreadsheet.open('data.xls') do |book|
		book.worksheet('Sheet1').each do |row|
			break if row[0].nil?
			pdf.fill_color "154992"
			
			if (counter >= 5) then
				pdf.start_new_page(:template => filename)
				counter = 0
			end

			puts "0%011d" % (start_from)

			sec += 5
			start_from += 1
			dx = 349
			y= 61

			box_width = 100
			
			case counter
				when 0
					xi = 0
				when 1
					xi = 67
				when 2
					xi = 140
				when 3
					xi = 212
				when 4
					xi = 283
			end
				
			pdf.rotate(90) do 
				pdf.bounding_box([y,xi-dx], :width => box_width, :height => 40) do
					pdf.stroke_bounds
					pdf.text_box "#{row[0]}", :rotate_around => :center, :size => 23, :overflow => :shrink_to_fit,  :align => :center, :valign => :center, :disable_wrap_by_char => true
				end
				pdf.bounding_box([y+194,xi-dx], :width => box_width, :height => 40) do
					pdf.stroke_bounds
					pdf.text_box "#{row[0]}", :rotate_around => :center, :size => 23, :overflow => :shrink_to_fit,  :align => :center, :valign => :center, :disable_wrap_by_char => true
				end
			end
			counter += 1
			

		end

	end
end
