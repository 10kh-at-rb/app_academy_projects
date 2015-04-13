require 'rest-client'
require 'addressable/uri'

def show_users
  url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users.json',
  query_values: {
    }
    ).to_s
    puts RestClient.get(url)
end




def create_user(name, email)
  begin
    url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/'
    ).to_s

    puts RestClient.post(
      url,
      { user: { name: name, email: email } }
    )
  rescue RestClient::Exception
    render json: "Something is invalid"
  end


end


create_user("eric", "john@gmail.com")
show_users
