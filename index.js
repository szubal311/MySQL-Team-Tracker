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

  const searchDept = () => {
      connection.query(
        `SELECT *
        FROM department`,
      (err, res) => {
          if (err) throw(err);
          console.table(res);
          start()
      });
  };

  const searchRole = () => {
    connection.query(
        `SELECT *
        FROM company_roles`,
    (err, res) => {
        if (err) throw(err);
        console.table(res);
        start()
    });
};

const empManagerUpdate = (employ_id, employ_role_id) => {
    connection.query(`UPDATE employee
                      SET employ_role_id = ?
                      WHERE employ_id =?` , [employ_role_id, employ_id ] 
                      
    )};

const employeeAdd = () => {
    let questions = [
        {
            type: "input",
            message: "What is the employee's first name?",
            name: "first_name"
        },

        {
            type: "input",
            message: "What is the employee's last name?",
            name: "last_name"
        },

        {
            type: "input",
            message: "What is the employee's title (employ_role_id)",
            name: "roleID"
        },

        {
            type: "input",
            message: "What is the employee's manager's name (employ_id?",
            name: "managerId"
        },
    ];

    inquirer.prompt(questions).then((answer) => {
        connection.query(
            `INSERT INTO employee SET ?`,
            {
               first_name: answer.first_name,
               last_name: answer.last_name,
               employ_id: answer.roleId,
               manager_id = answer.managerId,
            },
            (err) => {
               if (err) throw(err);
               empManagerUpdate(answer.roleId, answer.managerId);
            }
        );
    });
};








  

