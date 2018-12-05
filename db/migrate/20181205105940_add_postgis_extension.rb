class AddPostgisExtension < ActiveRecord::Migration[5.2]
  def up
    execute %(
      CREATE EXTENSION postgis;
      CREATE EXTENSION postgis_topology;
    )
  end


  def down
    execute %(
      DROP EXTENSION postgis;
      DROP EXTENSION postgis_topology;
    )
  end
end
