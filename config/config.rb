# encoding: UTF-8

configure do
  ### Customizable variables - use strings and ENV variables ###

  set :city_name,               'em Braga'                           # Include the preposition (em Coimbra, no Porto, etc.)
  set :meta_keywords,           'braga,made in braga'
  set :meta_description,        'Uma experiência social para melhorar a vida dos cidadãos de Braga.'            # Entry pages have their own description (the entry text)
  set :background_color,        '#F17370'

  set :site_url,                'http://www.oquefaltaembraga.com'    # Used for facebook comments. No trailing slash please.
  set :fb_app_id,               '720456774666211'                    # You should create a facebook app to moderate comments
  set :analytics_id,            'UA-xxxxxxxx-x'                      # Google Analytics

  set :production_database_url, ENV['DATABASE_URL']                  # Should work on Heroku out of the box
  set :dash_username,           ENV['DASH_USERNAME'] || 'admin'      # Access the dashboard via /dash
  set :dash_password,           ENV['DASH_PASSWORD'] || 'password_'  # Make sure you set the Environment Variable in production



  ### You shouldn't change anything below ###

  # If true, people can only vote once (we're using IPs to validate this)
  set :block_repeated_votes, (ENV['BLOCK_REPEAT'] != 'false') if production?
  set :block_repeated_votes, true unless production?

  # Sessions
  use Rack::Session::Cookie

  # Template Engine
  set    :partial_template_engine, :erb
  enable :partial_underscores

  # Dashboard Authentication
  authorize do |username, password|
    username == settings.dash_username && password == settings.dash_password
  end
end
