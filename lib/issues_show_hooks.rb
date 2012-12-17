class IssuesShowHooks < Redmine::Hook::ViewListener
  def view_projects_show_left(context = { })
    project = context[:project]
    block = OverviewBlock.find_by_project_id_and_name(project,'issues')
    context[:controller].send(:render_to_string, {:locals => context, :file => "/projects/issues"}) if block
  end
end