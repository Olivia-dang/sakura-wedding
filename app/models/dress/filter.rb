class Dress::Filter
  def filter(scope, query_params)
    if query_params[:text].present?
      scope = scope.where("name ILIKE :text OR color ILIKE :text OR description ILIKE :text", text: "%#{query_params[:text]}%")
    end

    if query_params[:category_id].present?
      scope = scope.where(category_id: query_params[:category_id])
    end

    scope
  end
end