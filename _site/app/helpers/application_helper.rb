module ApplicationHelper
  
  #activerecord attributes scope unu kullanmak için kısayol
  def ar_t(message)
    t message, :scope => [:activerecord, :attributes]
  end
  
  #activerecord modelleri için
  def ar_m(instance)
    instance.class.model_name.human
  end
  
end
