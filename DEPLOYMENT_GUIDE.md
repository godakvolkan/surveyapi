# Survey API - Deployment Guide

## 🚀 Production Deployment

### Heroku Deployment

1. **Heroku CLI'yi yükleyin:**

```bash
# Windows
winget install Heroku.HerokuCLI

# macOS
brew tap heroku/brew && brew install heroku
```

2. **Heroku'ya login olun:**

```bash
heroku login
```

3. **Heroku app oluşturun:**

```bash
heroku create survey-api-[your-name]
```

4. **PostgreSQL ekleyin:**

```bash
heroku addons:create heroku-postgresql:mini
```

5. **Database.yml'i güncelleyin:**

```yaml
production:
  <<: *default
  url: <%= ENV['DATABASE_URL'] %>
```

6. **Deploy edin:**

```bash
git add .
git commit -m "Initial commit"
git push heroku main
```

7. **Migration'ları çalıştırın:**

```bash
heroku run rails db:migrate
```

### Docker Deployment

1. **Dockerfile oluşturun:**

```dockerfile
FROM ruby:3.4.7-alpine

RUN apk add --no-cache \
    build-base \
    sqlite-dev \
    nodejs \
    yarn

WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
RUN rails db:migrate

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
```

2. **Docker image oluşturun:**

```bash
docker build -t survey-api .
```

3. **Container'ı çalıştırın:**

```bash
docker run -p 3000:3000 survey-api
```

## 📊 Monitoring

### Health Check

- **URL:** `/up`
- **Response:** 200 OK
- **Purpose:** Load balancer health check

### API Status

- **URL:** `/api/v1/`
- **Response:** JSON endpoints list
- **Purpose:** API availability check

## 🔧 Environment Variables

### Development

```bash
RAILS_ENV=development
DATABASE_URL=sqlite3:db/development.sqlite3
```

### Production

```bash
RAILS_ENV=production
DATABASE_URL=postgresql://user:pass@host:port/dbname
SECRET_KEY_BASE=your-secret-key
```

## 📈 Performance Optimization

### Database Indexing

```ruby
# Add to migration files
add_index :users, :email, unique: true
add_index :users, :username, unique: true
add_index :surveys, :user_id
add_index :questions, :survey_id
add_index :answers, [:question_id, :response_id]
add_index :responses, [:survey_id, :user_id]
```

### Caching

```ruby
# Add to Gemfile
gem 'redis', '~> 4.0'

# Add to application.rb
config.cache_store = :redis_cache_store, { url: ENV['REDIS_URL'] }
```

## 🛡️ Security

### CORS Configuration

```ruby
# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
```

### Rate Limiting

```ruby
# Add to Gemfile
gem 'rack-attack'

# Add to application.rb
config.middleware.use Rack::Attack
```

## 📝 Logging

### Production Logging

```ruby
# config/environments/production.rb
config.log_level = :info
config.log_formatter = ::Logger::Formatter.new
```

### Error Tracking

```ruby
# Add to Gemfile
gem 'sentry-ruby'
gem 'sentry-rails'

# Add to application.rb
Sentry.init do |config|
  config.dsn = ENV['SENTRY_DSN']
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]
end
```

## 🔄 CI/CD Pipeline

### GitHub Actions

```yaml
# .github/workflows/ci.yml
name: CI
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: ruby/setup-ruby@v1
        with:
          ruby-version: 3.4.7
      - run: bundle install
      - run: rails db:migrate
      - run: rails test
```

## 📊 Analytics

### API Metrics

- **Response Time:** < 200ms
- **Throughput:** 1000 requests/minute
- **Error Rate:** < 1%
- **Uptime:** 99.9%

### Database Metrics

- **Connection Pool:** 5-20 connections
- **Query Time:** < 100ms
- **Storage:** < 1GB

## 🚨 Troubleshooting

### Common Issues

1. **Database Connection Error:**

```bash
rails db:create
rails db:migrate
```

2. **Bundle Install Error:**

```bash
bundle install --without production
```

3. **Migration Error:**

```bash
rails db:rollback
rails db:migrate
```

4. **Port Already in Use:**

```bash
rails server -p 3001
```

### Log Files

- **Development:** `log/development.log`
- **Production:** `log/production.log`
- **Test:** `log/test.log`

## 📞 Support

**Issues:** [GitHub Issues](https://github.com/username/survey-api/issues)  
**Documentation:** [API Docs](API_TEST_GUIDE.md)  
**Email:** [email@example.com]

---

**Last Updated:** 22 Ekim 2025  
**Version:** 1.0.0
