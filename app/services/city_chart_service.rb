class CityChartService
  private_class_method :new

  def self.call(cities)
    new.call(cities)
  end

  def call(cities)
    ccc = cities.select('e.sum_production').joins(join_query).group_by(&:name)
    byebug
    cities.select(:id, :name).map do |city|
      {
        name: city.name,
        data: city.energies
                  .group(:year, :month)
                  .order(:year, :month)
                  .sum(:energy_production)
      }
    end
  end

  private

  def join_query
    <<-SQL.squish
      RIGHT JOIN
        (
          SELECT
            h.city_id,
            e.year,
            e.month,
            SUM(e.energy_production) sum_production
          FROM
            energies e
          LEFT JOIN
            houses h ON e.house_id = h.id
          GROUP BY
            city_id, year, month
        ) AS e
      ON cities.id = e.city_id
    SQL
  end
end
