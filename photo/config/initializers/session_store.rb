# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_photo_session',
  :secret      => 'dde1cda6a8ccf741e6779b27aa220d46319a34ce88ac45d4112cf7fdbbbc899c4a16101acc9f366d39db522dbe7cdd99e68facd121c9ebef3538b80d6cc98945'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
