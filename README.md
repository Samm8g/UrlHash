# URL Hash - A Stateless URL Shortener

This is a simple URL shortener application built with Ruby on Rails. It's a showcase project that demonstrates a unique, stateless approach to URL shortening.

## How it works

Instead of storing the original URL in a database and providing a short ID, this application encodes the original URL directly into a hash. The hash is a compressed and Base64-encoded version of the original URL.

When a user visits a shortened URL, the application decodes the hash back to the original URL and redirects the user.

## Features

-   Stateless design: No database is used for URL mappings.
-   Simple and lightweight.
-   Built with Ruby on Rails.

## Setup and Usage

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/Samm8g/UrlHash.git
    ```
2.  **Install dependencies:**
    ```bash
    bundle install
    ```
3.  **Run the Rails server:**
    ```bash
    rails server
    ```
4.  **Open your browser:**
    Navigate to `http://localhost:3000` to use the application.
