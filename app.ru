# app.ru
require 'rack'

# Простое Rack-приложение
app = Proc.new do |env|
  path = env['PATH_INFO']
  
  case path
  when '/'
    ['200', {'Content-Type' => 'text/plain'}, ['Welcome to Simple Rack App!']]
  when '/hello'
    ['200', {'Content-Type' => 'text/plain'}, ['Hello, World!']]
  else
    ['404', {'Content-Type' => 'text/plain'}, ['Not Found']]
  end
end

run app
