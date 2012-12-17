class IssuesShowHooks < Redmine::Hook::ViewListener
  def view_projects_show_left(context = { })
    project = context[:project]
    if  OverviewBlock.find_by_project_id_and_name(project,'issues')
      if context[:hook_caller].respond_to?(:render)
        context[:hook_caller].send(:render, {:locals => context, :partial => '/projects/issues'})
      elsif context[:controller].is_a?(ActionController::Base)
        context[:controller].send(:render_to_string, {:locals => context, :partial => '/projects/issues'})
      end
    end
  end
end

