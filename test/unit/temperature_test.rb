require 'test_helper'

class TemperatureTest < ActiveSupport::TestCase

  #Check validations
  test "temperatures are valid" do
    assert Temperature.find(temperatures(:one)).valid?  
  end
  
  test "value is present to save" do
    temp = Temperature.new(:scale_from => "Kelvin", :scale_to => "Kelvin")
	assert !temp.save
  end
  
  test "scale_from is a scale" do
    scales = ["Fahrenheit","Celsius","Kelvin"]
    assert scales.include?(Temperature.find(temperatures(:one)).scale_from)
  end
  
  test "require scale_to to save" do
	temp = Temperature.new(:value => 0.0, :scale_from => "Kelvin")
    assert !temp.save
  end
  
  test "require scale_from to save" do
	temp = Temperature.new(:value => 0.0, :scale_to => "Kelvin")
    assert !temp.save
  end
  
  test "scale_to is a scale" do
    scales = ["Fahrenheit","Celsius","Kelvin"]
    assert scales.include?(Temperature.find(temperatures(:one)).scale_to)    
  end
  
  #Check Conversions
  test "fahrenheit to celsius" do
    assert Temperature.find(temperatures(:five)).conversion.round(2) == Temperature.find(temperatures(:three)).value.round(2)
  end
  
  test "fahrenheit to kelvin" do
    assert Temperature.find(temperatures(:six)).conversion.round(2) == Temperature.find(temperatures(:one)).value.round(2)
  end
  
  test "kelvin to celsius" do
    assert Temperature.find(temperatures(:one)).conversion.round(2) == Temperature.find(temperatures(:three)).value.round(2)
  end
  
  test "kelvin to fahrenheit" do
    assert Temperature.find(temperatures(:two)).conversion.round(2) == Temperature.find(temperatures(:five)).value.round(2)
  end
  
  test "celsius to kelvin" do
    assert Temperature.find(temperatures(:four)).conversion.round(2) == Temperature.find(temperatures(:one)).value.round(2)
  end
  
  test "celsius to fahrenheit" do
    assert Temperature.find(temperatures(:three)).conversion.round(2) == Temperature.find(temperatures(:five)).value.round(2)
  end
end
