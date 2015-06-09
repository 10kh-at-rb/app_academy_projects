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

def create_user
  begin
    url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/'
    ).to_s

    puts RestClient.post(
      url,
      { user: { username: "test" } }
    )
  rescue RestClient::Exception
    render json: "Something is invalid"
  end
end

def show_user
  url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/1.json',
  query_values: {
    }
    ).to_s
    puts RestClient.get(url)
end

def destroy_user
  url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/2'
  ).to_s

  puts RestClient.delete(url)
end

def update_user
  url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/3.json'
  ).to_s

  puts RestClient.put(url, user: { username: "eric is the coolest" })
end


def show_contacts
  url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/3/contacts.json',
  query_values: {
    }
    ).to_s
    puts RestClient.get(url)
end

def create_contact
  begin
    url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts/'
    ).to_s

    puts RestClient.post(
      url,
      { contact: { name: "charles", email: "charles@chen.com", user_id: 3 } }
    )
  rescue RestClient::Exception
    render json: "Something is invalid"
  end
end

def show_contact
  url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/contacts/1.json',
  query_values: {
    }
    ).to_s
    puts RestClient.get(url)
end

def destroy_contact
  url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/contacts/2'
  ).to_s

  puts RestClient.delete(url)
end

def update_contact
  url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/contacts/1'
  ).to_s

  puts RestClient.put(url, contact: {name: "bob", email: "bob", user_id: 3})
end
# puts "test show users"
# show_users
# puts "test create users"
# a = create_user
# puts "test show user, by showing user 1"
# show_user
# puts "test destroy user 2"
# destroy_user
# puts "test update user"
# update_user
#
# puts "testing contacts now"

puts "test show contacts"
show_contacts
# puts "test create contacts"
# a = create_contact
# puts "test show contact, by showing contact 1"
# # show_contact
# puts "test destroy contact 2"
# destroy_contact
# puts "test update contact"
# update_contact
