pragma solidity >=0.7.0 <0.9.0;

contract School{
    struct Student {
        uint Id;
        string Name;
        uint Age;
    }
    mapping (uint => bool) isThere;
    mapping (uint => Student) students;

    function setStudent(uint id, string memory name, uint age) public {
        if(isThere[id] != true){
            Student memory stud = Student(id,name,age);
            students[id] = stud;
            isThere[id] = true;
        }
        
    }

    function getStudent(uint id) view public returns (uint, string memory, uint){
        if (isThere[id] == true){
            return (students[id].Id, students[id].Name, students[id].Age);
        }
        else{
            return (0,"",0);
        }
    } 

    function updateStudent(uint id, string memory _name, uint _age) public returns (string memory) {
        if(isThere[id] == true){
             students[id].Name = _name;
             students[id].Age = _age;
             return "updated";
        } 
        else{
            return "no such id exist";
        }
       
    }

    function deleteStudent(uint _id) public returns (string memory) {
        if(isThere[_id] == true){
            delete students[_id];
            return "deleted";
        }
        else{
            return "cannot delete, Id doesnt exist";
        }
        
    }



}
