module AjaxSearch
  extend ActiveSupport::Concern

  def ajax_map_projects_search
    params.extract!("utf8", "authenticity_token", "controller", "action")
    binding.pry
    # @legaltools      = Tool.sort_name
    # teams_name       = Team.sort_by_name.pluck(:name)
    # typologies       = [ "Automation","Communication & awareness","Legal ops","Legal design"]
    # scales           = [ "Quick and dirty","Little and efficient","Long shot","Agile","Partnership","Experimentation"]
    # teams_query      = []
    # typologies_query = []
    # scales_query     = []

    # if params == {}
    #   @legaltools
    # else
    #   params[:search_projects].each do |query|
    #     teams_query.push(query)      if teams_name.include?(query)
    #     typologies_query.push(query) if typologies.include?(query)
    #     scales_query.push(query)     if scales.include?(query)
    #   end
    # end
  end

end
