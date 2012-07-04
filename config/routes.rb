ActionController::Routing::Routes.draw do |map|
  map.connect 'blocks/:action', :controller => 'blocks'
end