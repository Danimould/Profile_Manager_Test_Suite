require 'capybara'

class CustomSectionPage
  include Capybara::DSL


  def visit_custom_section_page
    visit('/customs')
  end

  def click_custom_section name
    click_on(name)
  end

  def click_new_custom_section
    click_on('New Custom Section')
  end

  def find_custom_section name
    find_link(name).visible?
  end

  def check_custom_section edit_id
    page.has_css?("a[id=#{edit_id}]")
  end

  def find_notice_message
    find(:css, '.notice').text
  end

  def destroy_section num
    titles = all(:css ,'tr td a')
    n=titles.length
    i=0
    # puts titles[i][:id]
    while i<n do
      if titles[i][:id] == "title-#{num}"
        edit_id = titles[i+1][:id]
        click_on(find("a[data-id=destroy-#{i/3}]").text)
        return edit_id
      end
      i+=3
    end
  end

  def click_confirm
    click_button('Confirm')
  end

  def click_cancel
    click_button('Cancel')
  end

  #=================== FORM METHODS ================================
  def input_title title
    fill_in('title', :with => title)
  end

  def input_heading heading
    fill_in('heading', :with => heading)
  end

  def input_body body
    fill_in('body', :with => body)
  end

  def click_save
    click_on('save-button')
  end

  def select_title
    click_on(find(:css,'#title'))
  end

  def check_dropdown name
    false
  end

  def check_errors
    all(:css, '#error_explanation li').length
  end

  def check_error_message i
    all(:css, '#error_explanation li')[i].text
  end
  def check_on_edit
    if current_url.include? "edit"
      return true
    end
    return false
  end
end
