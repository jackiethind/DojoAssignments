var students = [
     {first_name:  'Michael', last_name : 'Jordan'},
     {first_name : 'John', last_name : 'Rosales'},
     {first_name : 'Mark', last_name : 'Guillen'},
     {first_name : 'KB', last_name : 'Tonel'}
]

partOne (students);
function partOne() {
    for (var i=0; i <students.length; i++) {
        console.log(students[i].first_name + " " + students[i].last_name);
    }
}
var users = {
 'Students': [
     {first_name:  'Michael', last_name : 'Jordan'},
     {first_name : 'John', last_name : 'Rosales'},
     {first_name : 'Mark', last_name : 'Guillen'},
     {first_name : 'KB', last_name : 'Tonel'}
  ],
 'Instructors': [
     {first_name : 'Michael', last_name : 'Choi'},
     {first_name : 'Martin', last_name : 'Puryear'}
  ]
 }
 partTwo ();
 function partTwo() {
     console.log(Object.keys(users)[0]);
     for (var i =0; i<users.Students.length; i++) {
         console.log((i+1) + " - " + users.Students[i].first_name+ " " + users.Students[i].last_name + " - " + (users.Students[i].first_name.length + users.Students[i].last_name.length) );
     }
     console.log(Object.keys(users)[1]);
     for (var i =0; i<users.Students.length; i++) {
         console.log((i+1) + " - " + users.Instructors[i].first_name+ " " + users.Instructors[i].last_name + " - " + (users.Instructors[i].first_name.length + users.Instructors[i].last_name.length) );
     }
 }
 // console.log(Object.keys(users)[0]);
 // console.log(users.Students[0].first_name+ " " + users.Students[0].last_name + " - " + (users.Students[0].first_name.length + users.Students[0].last_name.length) );
 // console.log(users.Students[1].first_name+ " " + users.Students[1].last_name + " - " + (users.Students[1].first_name.length + users.Students[1].last_name.length) );
 // console.log(users.Students[2].first_name+ " " + users.Students[2].last_name + " - " + (users.Students[2].first_name.length + users.Students[2].last_name.length) );
 // console.log(users.Students[3].first_name+ " " + users.Students[3].last_name + " - " + (users.Students[3].first_name.length + users.Students[3].last_name.length) );
