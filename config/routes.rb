ActionController::Routing::Routes.draw do |map|
  map.connect 'blocks/:action', :controller => 'blocks'
  map.connect 'time_entries',:controller => 'time_log'
  map.connect 'time_entries/:action',:controller => 'time_log'
  map.connect 'time_entries/:action?project_id=:id',:controller => 'time_log'  
end