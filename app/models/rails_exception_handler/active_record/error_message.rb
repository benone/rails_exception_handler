class RailsExceptionHandler::ActiveRecord

  class ErrorMessage < defined?(ActiveRecord) ? ActiveRecord::Base : Object
    if (defined?(ActiveRecord) && RailsExceptionHandler.configuration.activate? && RailsExceptionHandler.configuration.active_record?)
      db_conf = YAML.load_file(Rails.root.join("config/database.yml"))
      spec = db_conf['exception_database'] 
      establish_connection(spec)
      self.table_name = RailsExceptionHandler.configuration.active_record_store_in[:record_table]
    end
  end

end
