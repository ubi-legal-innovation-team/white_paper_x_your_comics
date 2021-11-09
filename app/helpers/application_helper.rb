module ApplicationHelper
  include Pagy::Frontend
  
  def svg(name)
    file_path = Rails.root.join('app/assets/images/svg/').join(name+".svg")
    if File.exists?(file_path)
      File.read(file_path).html_safe
    else
      '(not found)'
    end
  end
end
