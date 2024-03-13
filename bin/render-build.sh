#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install

bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec rails assets:precompile
bundle exec rails assets:clean

rails runner "if ENV['ADMIN_EMAIL'].present?
                user = User.find_or_initialize_by(email: ENV['ADMIN_EMAIL'])
                user.password = ENV['ADMIN_PASSWORD']
                user.password_confirmation = ENV['ADMIN_PASSWORD']
                user.roles = 'site_admin'
                if user.save
                    puts \"User: \#{user.email} is successfully set up as admin\"
                else
                    puts \"Failed to save user: \#{user.errors.full_messages.join(', ')}\"
                end
              else
                puts 'ADMIN_EMAIL environment variables must be set.'
              end"