require "capybara"
require "capybara/rspec"
require "selenium-webdriver"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include Capybara::DSL

  # Dimensão de tela
  config.before(:example) do
    page.current_window.resize_to(1280,800)
  end

  # Captura de tela
  config.after(:example) do |e|
    # Retirando caracter especial e substituindo espaços pelo _
    # Com o if são casos que falharam
    name = e.description.gsub(/[^A-Za-z0-9]/,'').tr(' ','_')
    page.save_screenshot('log/' + name + '.png') if e.exception
  end

end

Capybara.configure do |config|
  # config.default_driver = :selenium_chrome_headless
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 5
  # Adicionando host global
  config.app_host = 'https://training-wheels-protocol.herokuapp.com'

end