require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord

  def initialize(attributes={})
    attributes.each do |attribute, key|
      self.send("#{attribute}=", key)
    end
  end

  # TODO - Creates attr_accessors for each column name from database
  def attr_accessor
    self.column_names.each do |col_name|
      self.attr_accessor col_name.to_sym
    end
  end

  # TODO - Saves instance attributes to database and updates the object's id
  def save
  end

  # TODO - Returns the column names that will be used to insert values into database
  def col_names_for_insert
    self.class.column_names.delete_if { |col| col == "id" }
  end

  # TODO - #values_for_insert formats the column names to be used in a SQL statement
  def values_for_insert
  end

  # TODO - #table_name_for_insert return the table name when called on an instance of Student
  def table_name_for_insert
  end

  # Returns an array of SQL column names
  def self.column_names
    sql = 'PRAGMA table_info(<table name>)'
    table_info = DB[:conn].execute(sql)

    column_names = []

    table_info.each do |column|
      column_names << column["name"]
    end

    column_names.compact
  end

  # TODO - .find_by_name executes the SQL to find a row by name
  def self.find_by_name
  end

  # TODO - .find_by executes the SQL to find a row by the attribute passed into the method
  # TODO - .find_by accounts for when an attribute value is an integer
  def find_by
  end

  # TODO - .table_name creates a downcased, plural table name based on the Class name
  def self.table_name
  end
end