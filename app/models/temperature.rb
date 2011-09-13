class Temperature < ActiveRecord::Base
  #Validations#
  validates :value, :numericality => true, 
                    :presence => true
  validates :scale_from, :inclusion => { :in => %w(Kelvin Celsius Fahrenheit), 
                         :message => "Not a valid scale" }, 
						 :presence => true
  validates :scale_to, :inclusion => { :in => %w(Kelvin Celsius Fahrenheit), 
                       :message => "Not a valid scale" }, 
					   :presence => true
  
  #Methods#
  def labeled
    value.round(2).to_s + "\xC2\xB0 " + scale_from
  end
  
  def labeled_conversion
    conversion.round(2).to_s + "\xC2\xB0 " + scale_to
  end
  
  def conversion
    if scale_from == "Kelvin"
	  if scale_to == "Celsius"
	    kToC
	  elsif scale_to == "Fahrenheit"
	    kToF
	  else
	    value
	  end
	elsif scale_from == "Celsius"
	  if scale_to == "Kelvin"
	    cToK
	  elsif scale_to == "Fahrenheit"
	    cToF
	  else
	    value
	  end
	else
	  if scale_to == "Kelvin"
	    fToK
	  elsif scale_to == "Celsius"
	    fToC
	  else
	    value
	  end
	end  
  end
  
  def kToC
    value - 273.15
  end
  
  def kToF
    (value-273.15) * (9.0/5.0) + 32.0
  end

  def cToK
    value + 273.15
  end
  
  def cToF
    (value * (9.0/5.0)) + 32.0
  end
  
  def fToK
    (value - 32.0) * (5.0/9.0) + 273.15
  end
  
  def fToC
    (value - 32.0) * (5.0/9.0)
  end

end
