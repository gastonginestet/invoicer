# Invoicer

Invoicer is a simple Ruby on Rails application for managing invoices.  
It includes user authentication, a modern dashboard UI, and uses Hotwire (Turbo + Stimulus) for enhanced interactivity.

## Features

- User registration, login, and logout with Devise.
- Admin dashboard to manage invoices.
- CRUD for invoices with modal form support using Turbo Frames.
- TailwindCSS-based responsive UI.
- Turbo-enhanced form submission and rendering (modals, errors, updates).
- API endpoints for user registration and authentication.
- API endpoints for invoice management.

## Stack

- **Ruby on Rails** 8.x
- **PostgreSQL** (or SQLite for development)
- **Devise** for authentication
- **Hotwire (Turbo + Stimulus)** for SPA-like interactions
- **TailwindCSS** for modern, utility-first styles

## Getting Started

### Prerequisites

- Ruby 3.3+
- Rails 8+
- PostgreSQL (or SQLite if configured)

### Installation
```
git clone https://github.com/gastonginestet/invoicer.git
cd invoicer
bundle install
rails db:setup
```
Run locally
```
bin/dev
```
This runs the Rails server with Tailwind + Hotwire in development.

Create new invoices via the dashboard using modals.
Edit or delete invoices directly from the index.
