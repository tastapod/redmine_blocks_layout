class ProjectsShowHooks < Redmine::Hook::ViewListener
  def view_welcome_index_right(context = { })
    block = HomeBlock.find_by_name('projects')
    context[:controller].send(:render_to_string, {:locals => context, :file => "welcome/projects"}) if block
  end
end