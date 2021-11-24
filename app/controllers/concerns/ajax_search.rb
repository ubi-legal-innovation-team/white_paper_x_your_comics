module AjaxSearch
  extend ActiveSupport::Concern

  def ajax_map_projects_search
    params.extract!("utf8", "authenticity_token", "controller", "action")
    @projects    = Project.all
    stakes       = Stake.pluck(:name).sort
    media        = Media.pluck(:name).sort
    stakes_query = []
    media_query  = [] 
    @markers     = {}

    if params != {}

      params[:search_projects].each do |query|
        stakes_query.push(query) if stakes.include?(query)
        media_query.push(query)  if media.include?(query)
      end

      if !stakes_query.empty?
        @projects = @projects.where("stakes && ?", "{#{stakes_query.join(',')}}")
      end

      if !media_query.empty?
        @projects = @projects.where("media IN (?)", media_query)
      end

    end

    @projects.each do |project|

      region      = Country.find_by_name(project.countries.first).region
      position    = Country.find_by_name(project.countries.first).position
      coordinates = [region,position]

      if @markers[coordinates].nil?
        @markers[coordinates] = [].push(project.id)
      else
        @markers[coordinates].push(project.id)
      end

    end
  end
end

