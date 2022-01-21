class Employee 
    attr_reader :name, :title, :salary, :boss
    def initialize(name, title, salary, boss)
        @name = name
        @title = title 
        @salary = salary 
        @boss = boss
    end

    def bonus(multiplier)
        bonus = salary * multiplier
    end
end

class Manager < Employee 
    def initialize(name,title,salary,boss)
        super
        @employees = []
    end

    def add_employee(name)
        @employees << name
    end

    def bonus(multiplier) 
        sum = 0
        @employees.each do |employee|
            sum += employee.salary
        end
        sum * multiplier
    end
end

zack = Employee.new("zack", "employee", 10000, "rick")
rick = Manager.new("rick", "manager", 30000, "john")

rick.add_employee(zack)
# p zack.bonus(2)
p rick
p rick.bonus(5)
