class CompaniesController < ApplicationController
  def search
    @params_present = params_present?

    if params_present?
      perform_search
    else
      @nonprofits = []
    end
  end

  private

  def params_present?
    [
      :budget,
      :area_of_activity,
      :desired_impact_on,
      :nonprofit_size,
      :project_location
    ].any? { |param| params[param].present? }
  end

  def perform_search
    budget = params[:budget]
    area_of_activity = params[:area_of_activity]
    desired_impact_on = params[:desired_impact_on]
    nonprofit_size = params[:nonprofit_size]
    project_location = params[:project_location]

    @nonprofits = Nonprofit.includes(:projects).distinct

    # Apply filters only if not "Any" (nil)
    @nonprofits = @nonprofits.where(area_of_activity: area_of_activity) unless area_of_activity.blank?
    @nonprofits = @nonprofits.where(desired_impact_on: desired_impact_on) unless desired_impact_on.blank?
    @nonprofits = @nonprofits.where(operating_in: project_location) unless project_location.blank?
    @nonprofits = @nonprofits.where("income >= ?", nonprofit_size) unless nonprofit_size.blank?

    @nonprofits = @nonprofits
      .joins(:projects)
      .includes(:projects)
      .group("nonprofits.id")
      .select("nonprofits.*,
              COUNT(CASE
                    WHEN projects.status = 2 AND projects.budget >= #{budget.to_i}
                    AND projects.area_of_activity = '#{area_of_activity}'
                    AND projects.impact_on = '#{desired_impact_on}'
                    THEN 1 END) AS matching_finished_projects_count,
              COUNT(CASE
                    WHEN projects.status = 2 AND projects.area_of_activity = '#{area_of_activity}'
                    AND projects.impact_on = '#{desired_impact_on}'
                    THEN 1 END) AS matching_area_impact_finished_projects_count,
              COUNT(CASE WHEN projects.status = 2 THEN 1 END) AS finished_projects_count,
              COUNT(projects.id) AS total_projects_count")
      .order("matching_finished_projects_count DESC,
              matching_area_impact_finished_projects_count DESC,
              finished_projects_count DESC,
              total_projects_count DESC,
              nonprofits.income DESC")
  end
end
