require 'csv'

csv_import_models = %w(food_category food recipe_category recipe ingredient)

csv_import_models.each do |model_name|
  puts const = model_name.camelize.constantize

  const.transaction do
    ids = []

    CSV.foreach("db/seeds/#{model_name.pluralize}.csv", headers: true) do |csv_row|
      ids << id = csv_row.to_hash['id']
      record = const.find_or_initialize_by(id: id)
      record.update!(csv_row.to_hash.select{ |k, _| k.in?(const.column_names) })
      puts "=> #{record.inspect}"
    end

    const.where.not(id: ids).destroy_all

    ActiveRecord::Base.connection.execute("ALTER SEQUENCE #{model_name.pluralize}_id_seq RESTART WITH #{ids.map(&:to_i).max + 1}")
  end
end
