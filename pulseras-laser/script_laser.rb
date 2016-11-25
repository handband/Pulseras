require 'prawn'
require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/png_outputter'
require 'stringio'


filename = "molde laser.pdf"

#Funcion generadora de codigos de barra 128
def insert_code(pdf, string, x, y)
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

Prawn::Document.generate("out.pdf", :template => filename) do |pdf|

	pdf.font "BebasNeue.ttf"
	total = 1
	start_from = 4200 #numero del codigo de barras
	start_from2 = 4200 #numero del texto bajo el codigo de barras
	counter = 0
	sec = 0
	

	while total>sec do
	
		
		if counter > 10 then
			pdf.start_new_page(:template => filename)
			counter = 0
		
		"0%011d" % (start_from)
	    
		insert_code pdf, "0%05d" % (sec+start_from+0), -2, 87
		insert_code pdf, "0%05d" % (sec+start_from+1), 70, 87
		insert_code pdf, "0%05d" % (sec+start_from+2), 143, 87
		insert_code pdf, "0%05d" % (sec+start_from+3), 214, 87
		insert_code pdf, "0%05d" % (sec+start_from+4), 285, 87
		insert_code pdf, "0%05d" % (sec+start_from+5), 280+75+2, 87
		insert_code pdf, "0%05d" % (sec+start_from+6), (280+75*2)-2, 87
		insert_code pdf, "0%05d" % (sec+start_from+7), (280+75*3)-5, 87
		insert_code pdf, "0%05d" % (sec+start_from+8), (280+75*4)-8, 87
		insert_code pdf, "0%05d" % (sec+start_from+9), (280+75*5)-11, 87

		sec += 10

		dx = 0
		y=85+22
		box_width = 125
		xi = 25
			
		pdf.text_box "0%05d" % (start_from2), :at => [xi+4,y], :size => 14, :rotate => 90, :width => box_width, :height=> 12, :overflow => :shrink_to_fit, :disable_wrap_by_char => true
		pdf.text_box "0%05d" % (start_from2+1), :at => [xi+74+3,y], :size => 14, :rotate => 90, :width => box_width, :height=> 12, :overflow => :shrink_to_fit, :disable_wrap_by_char => true
		pdf.text_box "0%05d" % (start_from2+2), :at => [xi+(74*2)+1,y], :size => 14, :rotate => 90, :width => box_width, :height=> 12, :overflow => :shrink_to_fit, :disable_wrap_by_char => true
		pdf.text_box "0%05d" % (start_from2+3), :at => [xi+(74*3)-2,y], :size => 14, :rotate => 90, :width => box_width, :height=> 12, :overflow => :shrink_to_fit, :disable_wrap_by_char => true
		pdf.text_box "0%05d" % (start_from2+4), :at => [xi+(74*4)-4,y], :size => 14, :rotate => 90, :width => box_width, :height=> 12, :overflow => :shrink_to_fit, :disable_wrap_by_char => true
		pdf.text_box "0%05d" % (start_from2+5), :at => [xi+(74*5)-7,y], :size => 14, :rotate => 90, :width => box_width, :height=> 12, :overflow => :shrink_to_fit, :disable_wrap_by_char => true
		pdf.text_box "0%05d" % (start_from2+6), :at => [xi+(74*6)-10,y], :size => 14, :rotate => 90, :width => box_width, :height=> 12, :overflow => :shrink_to_fit, :disable_wrap_by_char => true
		pdf.text_box "0%05d" % (start_from2+7), :at => [xi+(74*7)-12,y], :size => 14, :rotate => 90, :width => box_width, :height=> 12, :overflow => :shrink_to_fit, :disable_wrap_by_char => true
		pdf.text_box "0%05d" % (start_from2+8), :at => [xi+(74*8)-14,y], :size => 14, :rotate => 90, :width => box_width, :height=> 12, :overflow => :shrink_to_fit, :disable_wrap_by_char => true
		pdf.text_box "0%05d" % (start_from2+9), :at => [xi+(74*9)-16,y], :size => 14, :rotate => 90, :width => box_width, :height=> 12, :overflow => :shrink_to_fit, :disable_wrap_by_char => true

		# end

		start_from2 += 10
		
		print start_from2
	end
	counter += 1	
	end
	print "terminé"
end
