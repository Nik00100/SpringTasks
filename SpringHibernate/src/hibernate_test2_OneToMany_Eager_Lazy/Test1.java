package hibernate_test2_OneToMany_Eager_Lazy;




import hibernate_test2_OneToMany_Eager_Lazy.entity.Department;
import hibernate_test2_OneToMany_Eager_Lazy.entity.Employee;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public class Test1 {
    public static void main(String[] args) {
        // all entities from package enityBidir
        SessionFactory factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(Employee.class)
                .addAnnotatedClass(Department.class)
                .buildSessionFactory();
        Session session = null;
        try {
            // create
            session = factory.getCurrentSession();

            Department dep = new Department("Sales", 1500, 300);

            Employee emp1 = new Employee("Peter", "Aven", 1000);
            Employee emp2 = new Employee("Misha", "Smirnov", 900);
            Employee emp3 = new Employee("Anton", "Sidorov", 1200);

            dep.addEmployeeToDepartment(emp1);
            dep.addEmployeeToDepartment(emp2);
            dep.addEmployeeToDepartment(emp3);

            session.beginTransaction(); // open transaction
            session.save(dep); // insert to bd

            session.getTransaction().commit(); // close transaction

            System.out.println("Done!!");

        } finally {
            session.close();
            factory.close(); // need to close factory even exception appears
        }

    }
}
