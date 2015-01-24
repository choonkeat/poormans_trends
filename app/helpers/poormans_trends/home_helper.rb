module PoormansTrends
  module HomeHelper
    def tables_with_col(colname, conn = ActiveRecord::Base.connection)
      conn.tables.select {|t| conn.columns(t).find {|x| x.name == colname } }
    end

    def tables_to_classes(table_names)
      table_names.collect {|t|
        Class.new(ActiveRecord::Base) do
          self.table_name = t
        end
      }.sort {|a,b| b.count <=> a.count}
    end

    def group_by_date_sql(colname)
      case ActiveRecord::Base.connection
      when ActiveRecord::ConnectionAdapters::PostgreSQLAdapter
        "#{colname}::date"
      when ActiveRecord::ConnectionAdapters::MysqlAdapter
        "DATE(#{colname})"
      else
        raise Exception.new("Unsupported adapter: #{ActiveRecord::Base.connection.class.name}")
      end
    end

    def data_for(klass, colname, start_at, end_at = 1.day.ago)
      timezone_offset = nil
      db = klass.where("#{colname} >= ?", start_at).group(group_by_date_sql(colname)).count.inject({}) do |sum,(k,v)|
        timezone_offset ||= k.to_time.beginning_of_day - Time.zone.parse(k.to_s).beginning_of_day
        sum.merge(k.to_time.to_i * 1000 => v)
      end
      array = []
      while start_at <= end_at
        t = (start_at.to_i + timezone_offset.to_i) * 1000
        array.push([t, db[t] || 0])
        start_at += 24.hours
      end
      array
    end
  end
end
