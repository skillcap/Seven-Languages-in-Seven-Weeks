# Nathaniel Morrow
# 7 Languages in 7 weeks
# Ruby Day 3: Self Study
#-----------------------#

module ActsAsCsv
    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end

    module InstanceMethods
        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.txt'
            file = File.new(filename)
            @headers = file.gets.chomp.split(', ')

            file.each do |row|
                @csv_contents << CsvRow.new(@headers, row.chomp.split(', '))
            end
        end

        attr_accessor :headers, :csv_contents
        def initialize
            read
        end
    end

    def each(&block)
        @csv_contents.each {|a| yield a}
    end

    class CsvRow
        include ActsAsCsv
        def initialize(headers,rows)
            @headers = headers
            @rows = rows
        end

        def method_missing name, *args
            @rows[@headers.index(name.to_s)]
        end
    end
end

class RubyCsv #no inheritance! You can mix it in
    include ActsAsCsv
    acts_as_csv
end

#m = RubyCsv.new
#puts m.headers.inspect
#puts m.csv_contents.inspect

csv = RubyCsv.new
csv.each {|row| puts row.one}
csv.each {|row| puts row.two}
csv.each {|row| puts row.three}
csv.each {|row| puts row.asdf}
