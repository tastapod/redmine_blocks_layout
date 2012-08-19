ActionController::Routing::Routes.draw do |map|
  map.connect 'blocks/:action', :controller => 'blocks'
  map.connect 'time_entries',:controller => 'timelog'
  map.connect 'time_entries/:action',:controller => 'timelog'
  map.connect 'time_entries/:action?project_id=:id',:controller => 'timelog'  
end