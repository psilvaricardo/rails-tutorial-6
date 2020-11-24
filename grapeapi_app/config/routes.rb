Rails.application.routes.draw do
  # I need to tell Rails how to connect the routes that 
  # would be comming in our application and forward them 
  # to the Grapes API, mounting the Grape endpoint.

  # We need to place API files into app/api, because app/api is 
  # the top-level folder for your API classes.
  # Rails expects a subdirectory that matches the name of the Ruby 
  # module and a file name that matches the name of the class.
  # https://github.com/ruby-grape/grape#rails
  mount API => '/'

end
