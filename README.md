A simple API to authenticate users and store user data.

It is built with Sinatra, a lightweight Ruby-based web framework.
This is my first time making a robust, tested Sinatra application from scratch, so it is a learning process for me.

Getting Started
===============
1. Ruby 2.2.2, RVM, sqlite3, and bundler must be installed.
1. `bundle`
1. `rake db:migrate`
1. `rackup`
1. Visit the app in the browser at `localhost:9292`

To run the specs: `rspec`

Notes
=====
This application is a work in progress. Prominent to-do items include:

1. Storing passwords securely
1. Reworking token checking to use modern strategy
1. Ensuring authentication before allowing API actions
1. Implement end of session route (`DELETE /auth`)
