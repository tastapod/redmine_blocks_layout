class CreateTables < ActiveRecord::Migration
  def self.up
    create_table :overview_blocks do |t|
      t.column :project_id, :integer, :null =>false
      t.column :name, :string, :unique=>true, :null => false
    end

    create_table :home_blocks do |t|
      t.column :name, :string, :unique=>true, :null => false
    end

    Project.all.each do |prj|
      OverviewBlock.new do |ob|
        ob.project_id = prj.id
        ob.name = 'members'
        ob.save
      end

      OverviewBlock.new do |ob|
        ob.project_id = prj.id
        ob.name = 'news'
        ob.save
      end

      OverviewBlock.new do |ob|
        ob.project_id = prj.id
        ob.name = 'issues'
        ob.save
      end
    end

  end

  def self.down
    drop_table :overview_blocks
    drop_table :home_blocks
  end
end
