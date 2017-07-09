## Features
- Admin can log in and view custom built CMS menu with quick links and quick reference
guide. 
- Admin can perform CRUD functions on artists and will automatically sort alphabetically 
into each category. All admin uploaded images are saved to S3 storage. 
- Admin can perform CRUD functions on FAQ and Events. 
- Pulls from Instagram API to populate the News page (along with any upcoming events). 
- Shoppers can browse current artists by category, read their bios and view samples.
- Shoppers can purchase items via Square. 
- Contact page features embedded custom google map for showing neighborhood features. 
- Admin can adjust store hours which display automatically on contact and footer.

## Set-up

**Ruby v. 2.3.3 Rails v. 4.2.5 Databases: SQLite (Test, Development), PostgreSQL (Production)**

**To run Booted locally:**

- Run bundle install --without production
- Create and migrate the SQLite database with rake db:create and rake db:migrate
- Seed the database with rake db:seed
- Start the server using rails s
- Run the app on localhost:3000

**Gems Used**
- Bcrypt
- Rspec
- Capybara
- Redcarpet
- Paperclip
- AWS S3
- HTTParty
- JSON

