class School

    def initialize
      @school = Hash.new { |hash, key| hash[key] = [] }
    end
  
    def add(student, grade)
      @school[grade] << student
      @school[grade] = @school[grade].sort
    end
  
    def students(grade)
      @school[grade]
    end
  
    def students_by_grade
      @school
          .each_with_object([]) { |(grade, student), result| result << {grade: grade, students: student} unless grade.nil? }
          .sort_by { |hash| hash[:grade] }
    end
  
  end