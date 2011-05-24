ActionController::Routing::Routes.draw do |map|
  map.root :controller => "login", :action => "login"
  map.connect "login/:action", :controller => 'login', :action => /[A-z_]+/
  
  map.resources :control_bars
  map.resources :tolerances
  #map.connect "jobs/:action", :controller => 'jobs', :action => /[A-z_]+/
  map.resources :jobs
  
  

  map.connect "members/:action", :controller => 'members', :action => /[A-z_]+/
  map.resources :members
  map.connect "proofs/:action", :controller => 'sheets', :action => /[A-z_]+/
  map.resources :sheets
  map.connect "devices/:action", :controller => 'devices', :action => /[A-z_]+/
  map.resources :devices
  map.resources :member_preferences
  #map.resources :machines
  # not sure this is fully functioning...
  map.resources :users

end
