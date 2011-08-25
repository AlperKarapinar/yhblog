module ApplicationHelper
  
  def markdown(text)
    syntax_highlighter(text).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end 
  
  #activerecord attributes scope unu kullanmak için kısayol
  def ar_t(message)
    t message, :scope => [:activerecord, :attributes]
  end
  
  #activerecord modelleri için
  def ar_m(instance)
    instance.class.model_name.human
  end
  
end
