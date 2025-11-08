# app.ru
require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'rails', '~> 7.1'
  gem 'sqlite3'
end

require 'rails'
require 'action_controller/railtie'

# Конфигурация базы данных
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:'
)

# Схема базы данных
ActiveRecord::Schema.define do
  create_table :posts do |t|
    t.string :title
    t.text :body
    t.timestamps
  end
end

# Модель
class Post < ActiveRecord::Base
end

# Приложение
class App < Rails::Application
  config.eager_load = false
  config.logger = Logger.new($stdout)
  config.secret_key_base = 'secret'
  
  routes.draw do
    root to: 'welcome#index'
    resources :posts, only: [:index, :create]
  end
end

# Контроллеры
class ApplicationController < ActionController::Base
end

class WelcomeController < ApplicationController
  def index
    render plain: 'Welcome to One-File Rails!'
  end
end

class PostsController < ApplicationController
  def index
    render json: Post.all
  end
  
  def create
    post = Post.create(post_params)
    render json: post
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body)
  end
end

# Инициализация и запуск
App.initialize!
run App
