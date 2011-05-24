# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_press_check_session',
  :secret      => 'ec50bf7202c161d45a6e70cf16a300915425cff11a01ccb1a63c746e89f6888b9e5fb778d4ee8598ed84fc6b7fa9181e7380f0f157cf40f330d83c38771328d8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
