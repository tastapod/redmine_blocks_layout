class NewsShowHooks < Redmine::Hook::ViewListener

  def view_projects_show_right(context = { })
    project = context[:project]
    if OverviewBlock.find_by_project_id_and_name(project,'news')
      if context[:hook_caller].respond_to?(:render)
        context[:hook_caller].send(:render, {:locals => context, :partial => "projects/news"})
      elsif context[:controller].is_a?(ActionController::Base)
        context[:controller].send(:render_to_string, {:locals => context, :partial => "projects/news"})
      end
    end
  end

  def view_welcome_index_right(context = { })
    if HomeBlock.find_by_name('news')
      if context[:hook_caller].respond_to?(:render)
        context[:hook_caller].send(:render, {:locals => context, :partial => "welcome/news"})
      elsif context[:controller].is_a?(ActionController::Base)
        context[:controller].send(:render_to_string, {:locals => context, :partial => "welcome/news"})
      end
    end
  end

end
