module UsersHelper
  def ar_t(message)
    t message, :scope => [:activerecord, :attributes]
  end
end
