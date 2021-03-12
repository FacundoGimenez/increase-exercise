Dir[File.join(Rails.root, 'lib', 'external', '*.rb')].each { |l| require l }
