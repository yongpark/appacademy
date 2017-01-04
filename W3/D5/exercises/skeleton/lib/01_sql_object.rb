require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    return @columns if !@columns.nil?
    data = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        "#{self.table_name}"
    SQL
    @columns = data.first.map(&:to_sym)
  end

  def self.finalize!
    columns = self.columns
    columns.each do |column|
      define_method("#{column}=") do |val|
        self.attributes[column] = val
      end
      define_method(column.to_s) do
        self.attributes[column]
      end
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name ||= "#{self.name.underscore}s"
  end

  def self.all
    # ...
    data = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        "#{self.table_name}"
    SQL
    data[1..-1]
    self.parse_all(data[1..-1])
  end

  def self.parse_all(results)
    # ...
    results.map do |hash|
      self.new(hash)
    end
  end

  def self.find(id)
    # ...
    self.all.detect { |obj| obj.id == id }
  end

  def initialize(params = {})
    # ...
    columns = self.class.columns
    params.each do |key, value|
      if !columns.include?(key.to_sym)
        raise "unknown attribute '#{key}'"
      else
        self.send("#{key}=", value)
      end
    end
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
    @attributes.values
  end

  def insert
    # ...
    columns = self.class.columns.drop(1)
    col_names = columns.map(&:to_s).join(", ")
    values = (["?"] * columns.count).join(", ")

    DBConnection.execute(<<-SQL, *self.attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{values})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    # ...
    set = self.class.columns.map { |attr| "#{attr} = ?" }.join(", ")

    DBConnection.execute(<<-SQL, *self.attribute_values, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set}
      WHERE
        #{self.class.table_name}.id = ?
    SQL
  end

  def save
    # ...
      if id.nil?
        insert
      else update
    end
  end
end
