# app.ru
require 'rack'

# Простое Rack-приложение
app = Proc.new do |env|
  path = env['PATH_INFO']
  
  case path
  when '/'
    [200, {'content-type' => 'text/plain'}, ['Welcome to Simple Rack App!']]
  when '/hello'
    [200, {'content-type' => 'text/plain'}, ['Hello, World!']]
  else
    [404, {'content-type' => 'text/plain'}, ['Not Found']]
  end
end

run app
