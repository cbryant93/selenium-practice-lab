require "selenium-webdriver"

class SeleniumQATools

  PRACTICE_FORM_URL = 'http://toolsqa.com/automation-practice-form/'
  FIRST_NAME = 'firstname'
  LAST_NAME = 'lastname'
  SEX = 'sex-'
  EXP = 'exp-'
  DATE = 'datepicker'
  PROFESSION = 'profession-'
  LINK = 'Selenium Automation Hybrid Framework'
  TOOL = 'tool-'
  CONTINENTS = 'continents'
  COMMANDS = 'selenium_commands'


  def initialize
    @chrome_driver = chrome_driver = Selenium::WebDriver.for :chrome
  end

  def visit_practice_form
    @chrome_driver.get(PRACTICE_FORM_URL)
  end

  def input_first_name(text)
    @chrome_driver.find_element(:name, FIRST_NAME).send_keys(text)

  end

  def input_first_name_text
    puts @chrome_driver.find_element(:name, FIRST_NAME)['value']
  end

  def input_last_name(text)
    @chrome_driver.find_element(:name, LAST_NAME).send_keys(text)
  end

  def input_last_name_text
    puts @chrome_driver.find_element(:name, LAST_NAME)['value']
  end

  def input_sex(input)
    puts @chrome_driver.find_element(:id, input).click
    get_sex(input)
  end

  def get_sex(input)
    puts @chrome_driver.find_element(:id, input)['value']
  end

  def input_year(year)

    puts @chrome_driver.find_element(:id, EXP+year).click
    get_year(year)
  end

  def get_year(year)
    puts @chrome_driver.find_element(:id, EXP+year).selected?
  end

  def input_date(date)
    @chrome_driver.find_element(:id, DATE).send_keys(date)
  end

  def get_date
  puts  @chrome_driver.find_element(:id, DATE)['value']
  end

  def input_profession(option)
    puts @chrome_driver.find_element(:id, PROFESSION+option).click
    get_profession(option)
  end

  def get_profession(option)
    puts @chrome_driver.find_element(:id, PROFESSION+option).selected?
  end



  def download_link
     @chrome_driver.find_element(:link_text, LINK).click
  end

  def input_tool(tool)
    @chrome_driver.find_element(:id, TOOL+tool).click
    get_tool(tool)
  end

  def get_tool(tool)
    puts  @chrome_driver.find_element(:id, TOOL+tool).selected?
  end

  def input_continent
    select = @chrome_driver.find_element(:id, CONTINENTS)
     all_options = select.find_elements(:tag_name, "option")
     all_options.each do |option|
       puts "Value is: " + option.attribute("value")
       option.click
     end

  end

  def input_commands
    select = @chrome_driver.find_element(:id, COMMANDS)
     all_options = select.find_elements(:tag_name, "option")
     all_options.each do |option|
     puts "Value is: " + option.attribute("value")
     option.click
  end

  end

  def submit_form
    @chrome_driver.find_element(:id, 'submit').click
  end

end

x = SeleniumQATools.new
x.visit_practice_form
x.input_first_name("Christian")
x.input_first_name_text
x.input_last_name("Bryant")
x.input_last_name_text
x.input_sex("sex-1") # male: sex-0 female: sex-1
x.input_year(rand(1..7).to_i.to_s)
x.input_date("01/01/2000")
x.get_date
x.input_profession(rand(0..1).to_i.to_s)
x.download_link
x.input_tool(rand(1..3).to_i.to_s)
x.input_continent
x.input_commands
x.submit_form
sleep 6
