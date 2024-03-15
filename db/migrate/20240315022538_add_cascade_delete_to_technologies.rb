class AddCascadeDeleteToTechnologies < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :technologies, :portfolios
    add_foreign_key :technologies, :portfolios, on_delete: :cascade
  end
end
