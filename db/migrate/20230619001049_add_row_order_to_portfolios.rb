class AddRowOrderToPortfolios < ActiveRecord::Migration[7.0]
  def change
    add_column :portfolios, :row_order, :integer, null: true
  end
end
