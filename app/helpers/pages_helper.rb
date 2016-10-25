module PagesHelper

  def svg(name)
    file_path = "#{Rails.root}/app/assets/images/tq-diamond.svg"
    return File.read(file_path).html_safe if File.exists?(file_path)
    '(not found)'
  end
  
end
