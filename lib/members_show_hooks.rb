class MembersShowHooks  < Redmine::Hook::ViewListener
  def view_projects_show_left(context = { })
    project = context[:project]
    block = OverviewBlock.find_by_project_id_and_name(project,'members')
    context[:controller].send(:render_to_string, {:locals => context, :file => "/projects/members"}) if block
  end
end