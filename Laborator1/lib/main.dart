//in plus://
 // appBar: AppBar(
      //   title:Text('BMI Calculator'),
      //   centerTitle: true,
      //   //backgroundColor: Colors.red,
      // ),
      //BODY CENTER
      //body: Center(
        // child:Text('Welcome!')),
        // child:Image(
        //  /* image: NetworkImage('https://plus.unsplash.com/premium_photo-1671467857784-73e69ed7a02e?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'))*/
        //   image: AssetImage("assets/im1.jpg")),
          //),
  //         child:Image.asset('assets/im2.jpg'),), 
  // or child:Image.network('url')

//   //ICONS:
// //   child:Icon(
// // Icons.airport_shuttle,
// // color:Colors.lightBlue,
// // size:50.0,
// //   ),
//     child: ElevatedButton(
//       onPressed: () {}, 
//      child:Text('click me'),
//      style: ElevatedButton.styleFrom(
//       backgroundColor: Colors.black,
//       foregroundColor:Colors.red,
//       padding:EdgeInsets.symmetric(horizontal: 25,vertical: 15)
//      ),
//      )
//   ),
//BODY CONTAINER
// body:Container(
//   padding:EdgeInsets.fromLTRB(40.0, 15.0, 30.0, 40.0),
//   margin: EdgeInsets.all(30.0),
//   color:Colors.grey[400],
//   child:Text('Hello!!'),
// ),

//aplicatia front stateless
// import 'package:flutter/material.dart';

// void main()=> runApp(MaterialApp(
//     home: Home(),
// ));


// class Home extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//  body: Padding(
//         padding: EdgeInsets.fromLTRB(15, 25, 500, 500),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start, // Alinează textele la stânga
//           children: [
//             Text('Welcome!'),
//             Text('BMI Calculator',
//             style: TextStyle(fontSize: 30),), // Textul adăugat
//             Row(  // Adaugă un Row pentru a afișa butoanele pe același rând
//               mainAxisAlignment: MainAxisAlignment.start, // Alinează butoanele la începutul rândului
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: Size(130, 40),
//                     shape:RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(7))
//                     )
//                     , // Dimensiunea butonului (pătrat de 100x100)
//                   ),
//                   child: Text('Male'),
//                 ),
//                 SizedBox(width: 10), // Adaugă spațiu între butoane
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: Size(130, 40), // Dimensiunea butonului (pătrat de 100x100)
//                   shape:RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(7))
//                     )
//                     , // Dimensiunea butonului (pătrat de 100x100)
//                   ),
//                   child: Text('Female'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: Text('Click me'),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }
//   }

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int weight = 70; // Greutatea implicită
  int age = 23; // Vârsta implicită
  double height = 170; // Înălțimea implicită
  double bmi = 0;
  String gender='';
  String outputBmi='';
  // Funcție pentru calculul BMI
  void calculateBMI() {
    setState(() {
      bmi = weight / ((height / 100) * (height / 100)); // Formula BMI
       determineHealthStatus();
    });
  }

//functie bmi conform gender
 void determineHealthStatus() {
    if (gender == 'Male') {
      if (bmi < 18.5) {
        outputBmi = 'Underweight';
      } else if (bmi >= 18.5 && bmi < 24.9) {
        outputBmi = 'Healthy';
      } else if (bmi >= 25 && bmi < 29.9) {
        outputBmi = 'Overweight';
      } else {
        outputBmi = 'Obese';
      }
    } else if (gender == 'Female') {
      if (bmi < 18.5) {
        outputBmi = 'Underweight';
      } else if (bmi >= 18.5 && bmi < 24.9) {
        outputBmi = 'Healthy';
      } else if (bmi >= 25 && bmi < 29.9) {
        outputBmi = 'Overweight';
      } else {
        outputBmi = 'Obese';
      }
    } else {
      outputBmi = 'Select a gender';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 177, 209, 224), // Fundalul aplicației
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ Padding(
        padding: EdgeInsets.only(top: 15), // Adjust the value to your preference
        child: Text('Welcome!',style: TextStyle(fontSize: 10),),
      ),
                Text(
                  'BMI Calculator',
                  style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold),
                ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 177, 209, 224), // Fundalul aplicației
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          gender = 'Male';
                          calculateBMI();
                        });},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:gender=='Male'?Colors.blue : const Color.fromARGB(255, 255, 255, 255),
                          minimumSize: Size(150, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(7))),
                        ),
                        child: Row(children: [
                          Icon(Icons.male,color: gender=='Male'? Colors.white:Colors.blue,),
                          Text('Male',style: TextStyle(color: gender=='Male'? Colors.white:Colors.blue,fontWeight: FontWeight.bold))])),
  
                    ElevatedButton(
                        onPressed: () {
                        setState(() {
                          gender = 'Female';
                          //calculateBMI();
                        });},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:gender=='Female'?Colors.blue : const Color.fromARGB(255, 255, 255, 255),
                          minimumSize: Size(150, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(7))),
                        ),
                        child: Row(children: [
                          Icon(Icons.female,color: gender=='Female'? Colors.white:Colors.blue,), 
                        Text('Female',style: TextStyle(color:gender=='Female'? Colors.white:Colors.blue,fontWeight: FontWeight.bold))])),
                  ],
                ),
                SizedBox(height: 30,width: 50), 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // greutate
                    Container(
                      height: 170,
                      width: 150,
                      padding: EdgeInsets.fromLTRB(5, 25, 5, 5),
                      decoration: BoxDecoration(
                        color: Colors.white, // Culoarea casetei
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        children: [
                          Text('Weight', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey)),
                          Text('$weight', style: TextStyle(fontSize: 40)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    weight = (weight > 0) ? weight - 1 : 0;
                                    //calculateBMI();
                                  });
                                },
                                child: Container(
                                    height: 35,
                                    width: 35,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                        child: Text('-',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white)))),
                              ),
                              SizedBox(width: 10),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    weight += 1;
                                    //calculateBMI();
                                  });
                                },
                                child: Container(
                                    height: 35,
                                    width: 35,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                        child: Text('+',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white)))),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Age Container
                    Container(
                      height: 170,
                      width: 150,
                      padding: EdgeInsets.fromLTRB(5, 25, 5, 5),
                      decoration: BoxDecoration(
                        color: Colors.white, // Culoarea casetei
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text('Age', style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.bold)),
                          Text('$age', style: TextStyle(fontSize: 40)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    age = (age > 0) ? age - 1 : 0;
                                  });
                                },
                                child: Container(
                                    height: 35,
                                    width: 35,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                        child: Text('-',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white)))),
                              ),
                              SizedBox(width: 10),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    age += 1;
                                  });
                                },
                                child: Container(
                                    height: 35,
                                    width: 35,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                        child: Text('+',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white)))),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text('Height', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                SizedBox(height: 2),
 Container(
              width: 200,
              height: 50,
              //padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.white, // Culoarea casetei
                borderRadius: BorderRadius.circular(7),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Height',
                      hintStyle: TextStyle(fontSize: 15),
                       border: InputBorder.none,
                       contentPadding: EdgeInsets.only(left:5),
                    ),
                    onChanged: (value) {
                      setState(() {
                        height = double.tryParse(value) ?? height;
                        //calculateBMI();
                      });
                    },
                  ),
                ],
              ),
            ),
              ]
            ),
            SizedBox(height: 5),
             // Afișare BMI și starea de sănătate
            Center(
              child: Column(
                children: [                  
                  Text(
                    bmi.toStringAsFixed(2),
                    style: TextStyle(fontSize: 20, color: Colors.blue,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 3),
                  Text(
                    outputBmi,
                    style: TextStyle(fontSize: 10, color: Colors.blue,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            // Buton pentru calculul BMI
            Center(
              child: ElevatedButton(
                onPressed: () {
                  calculateBMI();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Culoarea fundalului butonului
                  minimumSize: Size(350, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Lets Go',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}