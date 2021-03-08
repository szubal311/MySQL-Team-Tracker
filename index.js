const mysql = reqire("mysql");
const inquirer = reqire("inquirer");

const connection = mysql.createConnection({
    host: 'localhost',  

    port: 3306,

    user: 'root',  
    
    password: '',
    database: 'employees_db',
  });

  connection.connect(function(err) {
    if (err) throw err;
    start();
  });

  const start = () => {
    inquirer
        .prompt({
            name: 'action',
            type: 'list',
            message: 'What would you like to do?',
            choices: [
                'View Employee List',
                'View List of Roles',
                'View Departmet List',
                'Add New Employee',
                'Add Department',
                'Add Employee Roles',
                'exist'
            ]
        })
        .then((answer) => {
            switch (answer.action){
                case 'View Employee List':
                    searchAllEmp();
                    break;
                case 'View List of Roles':
                    searchRole();
                    break;
                case 'View Departmet List':
                    searchDept();
                    break;
                case 'Add New Employee':
                    newEmpAdd();
                    break;
                case 'Add Department':
                    deptAdd();
                    break;
                case 'Add Employee Roles':
                    roleAdd();
                    break;
                case 'exit':
                    connection.end();
                    break;
            }
        });
  };

  const searchAllEmp = () => {
      connection.query(
        `SELECT e.employ_id
        , e.first_name, e.last_name
        , cr.title
        , d.dept_name AS department
        , cr.salary
        , CONCAT(em.first_name, ' ', em.last_name) AS manager 
        FROM employee e
        LEFT JOIN company_roles cr
        on e.employ_role_id = cr.role_id 
        LEFT JOIN department d
        on cr.dept_id = d.dept_id 
        LEFT JOIN employee em 
        on e.manager_id = em.employ_id;`,
        
        (err, res) => {
            if (err) throw err;
            console.table(res);
            start()
        }
      );      
  };
  

