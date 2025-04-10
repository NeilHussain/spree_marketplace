# Spree Market Setup Guide

## Tech Stack

This project uses the following technologies with their versions:

- **Ruby**: 3.2.0
- **Ruby on Rails**: ~> 7.0
- **Spree Commerce**: 4.6 (Core)
  - Spree Auth Devise: 4.5
  - Spree I18n: 5.3
- **MySQL**: 8.0
- **Redis**: 7.2 (Alpine)

## Features

- Base Spree Frontend
- Homepage Template
- Multi-Vendor Gem Installed

## Prerequisites

- Docker installed on your system
- Docker Compose installed
- Basic familiarity with command line operations

## Setup Commands

1. **Build the containers**:
   ```bash
   docker compose build
   ```

2. **Start the services**:
   ```bash
   docker compose up
   ```

3. **Set up the database** (in a new terminal window):
   ```bash
   docker compose run web rails db:drop db:create db:migrate
   ```

4. **Seed the database with sample data**:
   ```bash
   docker compose run web rails db:seed
   ```

5. **Access the application**:
   - The Rails server will be running on `http://localhost:3000`
   - The Spree admin interface will be available at `http://localhost:3000/admin`

## Additional Commands

- **Run Rails console**:
  ```bash
  docker compose run web rails console
  ```

- **Run tests**:
  ```bash
  docker compose run web rspec
  ```

- **View logs**:
  ```bash
  docker compose logs -f web
  ```

## Environment Variables

Copy the sample environment file and update it with your configuration:
```bash
cp .env.sample .env
```

## Troubleshooting

If you encounter issues:
- Make sure all containers are running (`docker compose ps`)
- Check logs for errors (`docker compose logs`)
- Rebuild containers if dependencies change (`docker compose build`)



## Core Setup Functions 

`spree admin api key:`
user = Spree::User.find_by(email: 'admin@shyenmai.com')
user.generate_spree_api_key!
user.save

> ce746ed849008af25b941942b97ff257c4b26c65777ea406

