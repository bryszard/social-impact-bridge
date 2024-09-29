class Avo::Resources::Project < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :nonprofit, as: :belongs_to
    field :name, as: :text
    field :description, as: :textarea
    field :impact_on, as: :select, options: NONPROFIT_CONFIG[:desired_impact_on]
    field :budget, as: :number, format: :currency
    field :area_of_activity, as: :select, options: NONPROFIT_CONFIG[:areas_of_activity]
    field :status, as: :select, enum: ::Project.statuses
  end
end
