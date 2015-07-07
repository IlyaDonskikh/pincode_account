class Service::Errors
  ## Etc.
  def initialize
    @list = []
  end

  def add(name, text)
    @list << { "#{name}" => text }
  end

  def merge_with_models(*objects)
    objects.each do |obj|
      obj.errors.messages.each do |msg|
        msg[1].each { |text| add(msg[0], text) }
      end
    end
  end

  def format_group_list
    @list.group_by { |hash| hash[:object] }
  end

  def format_list
    @list
  end

  def exists?
    @list.size > 0
  end
end
