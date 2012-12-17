class ProjectsShowHooks < Redmine::Hook::ViewListener
  def view_welcome_index_right(context = { })
    if HomeBlock.find_by_name('projects')
      if context[:hook_caller].respond_to?(:render)
        context[:hook_caller].send(:render, {:locals => context, :partial => "welcome/projects"})
      elsif context[:controller].is_a?(ActionController::Base)
        context[:controller].send(:render_to_string, {:locals => context, :partial => "welcome/projects"})
      end
    end
  end
end
