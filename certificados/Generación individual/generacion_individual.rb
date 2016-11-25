require 'prawn'
require 'barby'
require 'stringio'

filename = ARGV[0] + ".pdf"
input_value = ARGV[1]
# puts filename

Prawn::Document.generate("out.pdf", :template => filename) do |pdf|
  pdf.font "arial.ttf"

  x = 110
  y = 315
  box_width = 500
  box_height = 30 
  letter_size = 20

  #pdf.fill_color "003b4c" #Permite cambiar el color de la letra del pdf
  pdf.bounding_box([x,y], :width => box_width, :height => box_height) do
      # pdf.stroke_bounds
      pdf.text_box input_value, :size => letter_size, :overflow => :shrink_to_fit, :align => :center, :valign => :center
  end
  
end
