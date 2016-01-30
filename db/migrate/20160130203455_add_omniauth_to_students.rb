class AddOmniauthToStudents < ActiveRecord::Migration
  def change
    add_column :students, :omniauth, :boolean, default: true
  end
end
