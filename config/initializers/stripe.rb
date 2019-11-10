# config/initializers/stripe.rb
Rails.configuration.stripe = {
  publishable_key: ENV['pk_test_IlhcSBP9JvVYs1xLC3I3gUym00c2uhNNHY'],
  secret_key:      ENV['sk_test_e9Dfcb0k3mz667KlPwn4QHDf009RrRIvlJ']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
