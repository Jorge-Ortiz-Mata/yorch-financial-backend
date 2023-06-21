json.expenses @user.expenses, :id, :title, :description, :quantity
json.total @user.expenses.sum(:quantity).to_d.round(2)
