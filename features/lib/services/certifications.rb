require "capybara"

class Certifications

  VALID_TITLE = "A title"
  VALID_DESCRIPTION = "A valid description"

  # > 100 characters
  INVALID_TITLE = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."

  # > 100 words
  INVALID_DESCRIPTION = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in"

  DESCRIPTION_XPATH = "/html/body/div/div[2]/div/div/form/div[2]/trix-editor"

  include Capybara::DSL

  def visit_certifications
    visit('/certifications')
  end

  def click_new_certification
    click_link("New Certification")
  end

  def input_valid_title
    fill_in('title', :with => VALID_TITLE)
  end

  def input_valid_description
    find(:xpath, DESCRIPTION_XPATH).set(VALID_DESCRIPTION)
  end

  def click_save
    click_button("save")
  end

  def get_notice_text
    find(".notice").text
  end

  def input_invalid_title
    fill_in('title', :with => INVALID_TITLE)
  end

  def input_invalid_description
    find(:xpath, DESCRIPTION_XPATH).set(INVALID_DESCRIPTION)
  end

  def error?
    within(:css, '#error_explanation') do
      find(:css, 'h2').visible?
    end
  end
end
