module BlocksHelper
  def available_overview_blocks
    blocks = ['members','news','issues']
    blocks.push('polls') if Redmine::Plugin.installed?(:redmine_polls)
    blocks.push('forum_messages') if Redmine::Plugin.installed?(:redmine_last_messages)
    return blocks
  end
  def available_home_blocks
    blocks = ['news', 'projects']
    blocks.push('polls') if Redmine::Plugin.installed?(:redmine_polls)
    blocks.push('forum_messages') if Redmine::Plugin.installed?(:redmine_last_messages)
    return blocks
  end
#  cattr_reader :available_overview_blocks
end