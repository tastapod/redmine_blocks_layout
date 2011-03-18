module BlocksHelper
  def available_overview_blocks
    ['members', 'news', 'polls', 'forum_messages', 'issues']
  end
  def available_home_blocks
    ['news', 'polls', 'forum_messages','projects']
  end
#  cattr_reader :available_overview_blocks
end