class AddCompanyToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :company, :string
  end
end
