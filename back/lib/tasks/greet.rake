# frozen_string_literal: true

namespace :greet do
  desc 'あいさつ'
  task say_hello: :environment do
    puts 'Hello, World!'
  end

  desc 'あいさつ（日本）'
  task say_hello2: :environment do
    puts 'こんにちは、世界！'
  end

  desc 'あいさつ（中国）'
  task say_hello_chinese: :environment do
    greet_chinese
  end

  desc 'あいさついろいろ'
  task say_hello_optional: :environment do
    greet('السلام عليكم')
  end

  desc 'mock_test'
  # docker-compose run back bundle exec rake greet:mock_test
  task mock_test: :environment do
    puts Greet.new.test
  end
end

def greet_chinese
  puts '你好'
end

def greet(greeting = 'Hello, World!')
  puts greeting
end

def test
  'test'
end

class Greet
  def test
    GreetNested.new.test_nested
  end
end

class GreetNested
  def test_nested
    'test'
  end
end
