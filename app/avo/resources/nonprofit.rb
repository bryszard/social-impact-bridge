class Avo::Resources::Nonprofit < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :name, as: :text
    field :description, as: :textarea
    field :logo, as: :text
    field :area_of_activity, as: :select, options: NONPROFIT_CONFIG[:areas_of_activity]
    field :operating_in, as: :select, options: NONPROFIT_CONFIG[:operating_in]
    field :desired_impact_on, as: :select, options: NONPROFIT_CONFIG[:desired_impact_on]
    field :income, as: :number, format: :currency
    field :projects, as: :has_many
  end
end
