class NewsShowHooks < Redmine::Hook::ViewListener

  def view_projects_show_right(context = { })
    project = context[:project]
    block = OverviewBlock.find_by_project_id_and_name(project,'news')
    context[:controller].send(:render_to_string, {:locals => context, :file => "projects/news"}) if block
  end

  def view_welcome_index_right(context = { })
    block = HomeBlock.find_by_name('news')
    context[:controller].send(:render_to_string, {:locals => context, :file => "welcome/news"}) if block
  end


end