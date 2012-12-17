require 'redmine'
require 'issues_show_hooks'
require 'members_show_hooks'
require 'news_show_hooks'
require 'projects_show_hooks'

Redmine::Plugin.register :redmine_blocks_layout do
  name 'Blocks Layout plugin'
  author 'Pavel Vinokurov, Sergei Vasiliev'
  description 'Manage presence of boxes on Home, Project Overview and My Page'
  version '0.0.2'

  project_module :redmine_blocks_layout do
    permission :edit_overview, {:blocks => [:edit_overview]}
  end

end
