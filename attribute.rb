class Attribute

  attr_accessor :name, :type

  def initialize(name, type)
    @name = name.downcase
    @type = type.downcase
    validate
  end

  def self.valid_types
    %w(string text image)
  end

  def validate
    unless Attribute.valid_types.include?(@type)
      puts "Attribute #{@type} is not supported. The supported attributes types are: #{Attribute.valid_types.join(", ")}"
      Kernel::exit
    end
  end

  def self.parse(f)
    Attribute.new(f.split(":")[0], f.split(":")[1])
  end

  def mysql_type
    unless @type == 'text'
      return 'VARCHAR(255)'
    end
    'TEXT'
  end
end
