ENV['FOOD2FORK_KEY'] = '0057d8098e6bfb6e2b9d7779571e3e05'

class Recipe
  include HTTParty

  default_options.update(verify: false) # Turn off SSL verification
  key_value = ENV['FOOD2FORK_KEY']
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'food2fork.com'
  base_uri "http://#{hostport}/api"
  default_params key: key_value
  format :json

  def self.for term
    response = get("/search", query: { q: term})
    # Sputs "response: #{response}"
    response["recipes"]
  end

end
