json.revenues @user.revenues, :id, :title, :description, :quantity
json.total @user.revenues.sum(:quantity).to_d.round(2)
