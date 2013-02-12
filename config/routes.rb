if Rails::VERSION::MAJOR >= 3
  match 'blocks/:action', :controller => 'blocks'
  match 'time_entries', :controller => 'timelog'
  match 'time_entries/:action',:controller => 'timelog'
  match 'time_entries/:action?project_id=:id',:controller => 'timelog'
else
  ActionController::Routing::Routes.draw do |map|
    map.connect 'blocks/:action', :controller => 'blocks'
    map.connect 'time_entries',:controller => 'timelog'
    map.connect 'time_entries/:action',:controller => 'timelog'
    map.connect 'time_entries/:action?project_id=:id',:controller => 'timelog'  
  end
end
