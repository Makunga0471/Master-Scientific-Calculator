
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
enum ThemeOption { light, dark, systemDefault }
class _HomeScreenState extends State<HomeScreen> {
  String userInput = '';
  String result = '0';
  bool isOpen = true;
   ThemeOption selectedTheme = ThemeOption.light;

  
  TextEditingController stringText = TextEditingController();

  @override
  void initState() {
    super.initState();
    stringText = TextEditingController();
  }

  @override
  void dispose() {
    stringText.dispose();
    super.dispose();
  }

  
  void handleButtons(String text) {
   if (text == "C") {
      if (userInput.isNotEmpty) {
        userInput = userInput.substring(0, userInput.length - 1);
      }
    } else if (text == "=") {
      result = calculate();
      if (result.endsWith(".0")) {
        result = result.replaceAll(".0", "");
      }
      userInput = result;
    } else {
      userInput += text;
    }
  }

  String calculate() {
    try {
      var exp = Parser().parse(userInput);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "Error";
    }
  }
   
    // Placeholder function to show history information
  void showHistoryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('History'),
          content: const Text('Display your history information here.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Placeholder function to show theme options


  void showThemeOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Theme'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Light'),
                leading: Radio(
                  value: ThemeOption.light,
                  groupValue: selectedTheme,
                  onChanged: (value) {
                    setState(() {
                      selectedTheme = value as ThemeOption;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Dark'),
                leading: Radio(
                  value: ThemeOption.dark,
                  groupValue: selectedTheme,
                  onChanged: (value) {
                    setState(() {
                      selectedTheme = value as ThemeOption;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('System Default'),
                leading: Radio(
                  value: ThemeOption.systemDefault,
                  groupValue: selectedTheme,
                  onChanged: (value) {
                    setState(() {
                      selectedTheme = value as ThemeOption;
                    });
                  },
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Implement logic to save selected theme (selectedTheme)
                // For now, just print the selected theme
                print("Selected Theme: $selectedTheme");
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }


  // Placeholder function to show privacy policy
  void showPrivacyPolicy() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Privacy Policy'),
          content: const Text('Display your privacy policy here.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Placeholder function to allow users to send feedback
  void sendFeedback() {
    // Implement your feedback submission logic here.
    // For example, you can navigate to a feedback screen.
  }

  // Placeholder function to show help information
  void showHelp() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Help'),
          content: const Text('Display help information here.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 64, 96),
        title: const Text('General Calculator',
            style: TextStyle(fontSize: 22, color: Colors.white)),
        // actions: [
        //  PopupMenuButton<String>(
        //       icon: const Icon(Icons.more_vert, color: Colors.white),
        //       onSelected: (value) {
        //         switch (value) {
        //           case 'History':
        //             // Placeholder: Implement code to show history
        //             showHistoryDialog();
        //             break;
        //           case 'Choose theme':
        //             // Placeholder: Implement code to show theme options
        //             showThemeOptionsDialog();
        //             break;
        //           case 'Privacy policy':
        //             // Placeholder: Implement code to show privacy policy
        //             showPrivacyPolicy();
        //             break;
        //           case 'Send feedback':
        //             // Placeholder: Implement code to allow users to send feedback
        //             sendFeedback();
        //             break;
        //           case 'Help':
        //             // Placeholder: Implement code to show help information
        //             showHelp();
        //             break;
        //         }
        //       },
        //       itemBuilder: (BuildContext context) => [
        //         const PopupMenuItem<String>(
        //           value: 'History',
        //           child: Text('History', style: TextStyle(color: Colors.black)),
        //         ),
        //         const PopupMenuItem<String>(
        //           value: 'Choose theme',
        //           child: Text('Choose theme', style: TextStyle(color: Colors.black)),
        //         ),
        //         const PopupMenuItem<String>(
        //           value: 'Privacy policy',
        //           child: Text('Privacy policy', style: TextStyle(color: Colors.black)),
        //         ),
        //         const PopupMenuItem<String>(
        //           value: 'Send feedback',
        //           child: Text('Send feedback', style: TextStyle(color: Colors.black)),
        //         ),
        //         const PopupMenuItem<String>(
        //           value: 'Help',
        //           child: Text('Help', style: TextStyle(color: Colors.black)),
        //         ),
        //       ],
        //     ),

        // ],
      ),
       
        body: SingleChildScrollView(
          child: Column(
            children: [        
             Container(
                color: Colors.black,
                height: 250,
                width: 500,
                padding:const  EdgeInsets.only(right: 20),
                alignment: Alignment.bottomRight,
                
              child:  SingleChildScrollView(
                scrollDirection: Axis.horizontal ,
                child: Row(
                  children: [          
                 Text(userInput, style: const TextStyle(color: Colors.white, fontSize: 80),textAlign: TextAlign.center),
                 const SizedBox(height: 15,),
                 
                            
                ],),
              )
              ),
             Row(children: [

              Container(
                width: 90,
                height: 60,
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                decoration: BoxDecoration(border: Border.all(color:const  Color.fromARGB(255, 222, 212, 212))),
                child: MaterialButton(onPressed: (){
                  setState(() {
                    userInput = '';
                    result = '';

                  });
                },
                child: const Center(child: Text('C', style: TextStyle(fontSize:30),)),
                ),
              ),
              Container(
                width: 90,
                height: 60,
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                decoration: BoxDecoration(border: Border.all(color:const  Color.fromARGB(255, 222, 212, 212))),
                child: MaterialButton(onPressed: (){
                  setState(() {  
                        isOpen =  !isOpen;
                       if(isOpen == true){
                        userInput += '(';
                       }
                       else{
                        userInput += ')';
                       }
                  });
                },
                child: const Center(child: Text('( )', style: TextStyle(fontSize:30),)),
                ),
              ),
              Container(
                width: 90,
                height: 60,
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                decoration: BoxDecoration(border: Border.all(color:const  Color.fromARGB(255, 222, 212, 212))),
                child: MaterialButton(onPressed: (){
                  setState(() {
                    userInput += '%';
                    
                  });
                },
                child: const Center(child: Text('%', style: TextStyle(fontSize:30),)),
                ),
              ),
              Container(
                width: 90,
                height: 60,
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                decoration: BoxDecoration(border: Border.all(color:const  Color.fromARGB(255, 222, 212, 212))),
                child: MaterialButton(onPressed: (){
                  setState(() {
                    userInput += '/';
                    
                  });
                },
                child:const  Center(child: Text('/', style: TextStyle(fontSize:30),)),
                ),
              )
          
              ],),
              Row(children: [
              Container(
                width: 90,
                height: 60,
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                decoration: BoxDecoration(border: Border.all(color:const  Color.fromARGB(255, 222, 212, 212))),
                child: MaterialButton(onPressed: (){
                  setState(() {
                    userInput += '7';
                    
                  });
                 
                },
                child: const Center(child: Text('7', style: TextStyle(fontSize:30),)),
                ),
              ),
              Container(
                width: 90,
                height: 60,
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                decoration: BoxDecoration(border: Border.all(color:const  Color.fromARGB(255, 222, 212, 212))),
                child: MaterialButton(onPressed: (){
                  setState(() {
                    userInput += '8';     
                  });
                },
                child: const Center(child: Text('8', style: TextStyle(fontSize:30),)),
                ),
              ),
              Container(
                width: 90,
                height: 60,
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                decoration: BoxDecoration(border: Border.all(color:const  Color.fromARGB(255, 222, 212, 212))),
                child: MaterialButton(onPressed: (){
                  setState(() {
                    userInput += '9';

                   
                  });
                },
                child: const Center(child: Text('9', style: TextStyle(fontSize:30),)),
                ),
              ),
              Container(
                width: 90,
                height: 60,
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                decoration: BoxDecoration(border: Border.all(color:const  Color.fromARGB(255, 222, 212, 212))),
                child: MaterialButton(onPressed: (){
                  setState(() {
                    userInput += '*';
                  
                  });
                },
                child:const  Center(child: Text('x', style: TextStyle(fontSize:30),)),
                ),
              )
          
              ],),
              Row(children: [
              Container(
                width: 90,
                height: 60,
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                decoration: BoxDecoration(border: Border.all(color:const  Color.fromARGB(255, 222, 212, 212))),
                child: MaterialButton(onPressed: (){
                  setState(() {
                    userInput += '4';
                  });
                },
                child: const Center(child: Text('4', style: TextStyle(fontSize:30),)),
                ),
              ),
              Container(
                width: 90,
                height: 60,
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                decoration: BoxDecoration(border: Border.all(color:const  Color.fromARGB(255, 222, 212, 212))),
                child: MaterialButton(onPressed: (){
                  setState(() {
                    userInput += '5';
                     
                  });
                },
                child: const Center(child: Text('5', style: TextStyle(fontSize:30),)),
                ),
              ),
              Container(
                width: 90,
                height: 60,
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                decoration: BoxDecoration(border: Border.all(color:const  Color.fromARGB(255, 222, 212, 212))),
                child: MaterialButton(onPressed: (){
                  setState(() {
                    userInput += '6';
                    
                  });
                },
                child: const Center(child: Text('6', style: TextStyle(fontSize:30),)),
                ),
              ),
              Container(
                width: 90,
                height: 60,
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                decoration: BoxDecoration(border: Border.all(color:const  Color.fromARGB(255, 222, 212, 212))),
                child: MaterialButton(onPressed: (){
                  setState(() {
                    userInput += '+';
                       
                  },);
                },
                child:const  Center(child: Text('+', style: TextStyle(fontSize:30),)),
                ),
              )
          
              ],),
              Row(children: [
              Container(
                width: 90,
                height: 60,
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                decoration: BoxDecoration(border: Border.all(color:const  Color.fromARGB(255, 222, 212, 212))),
                child: MaterialButton(onPressed: (){
                  setState(() {
                    userInput += '1';
                           
                  });
                },
                child: const Center(child: Text('1', style: TextStyle(fontSize:30),)),
                ),
              ),
              Container(
                width: 90,
                height: 60,
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                decoration: BoxDecoration(border: Border.all(color:const  Color.fromARGB(255, 222, 212, 212))),
                child: MaterialButton(onPressed: (){
                  setState(() {
                    userInput += '2';
                   
                  });
                },
                child: const Center(child: Text('2', style: TextStyle(fontSize:30),)),
                ),
              ),
              Container(
                width: 90,
                height: 60,
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                decoration: BoxDecoration(border: Border.all(color:const  Color.fromARGB(255, 222, 212, 212))),
                child: MaterialButton(onPressed: (){
                  setState(() {
                    userInput += '3';
                    
                  });
                },
                child: const Center(child: Text('3', style: TextStyle(fontSize:30),)),
                ),
              ),
              Container(
                width: 90,
                height: 60,
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                decoration: BoxDecoration(border: Border.all(color:const  Color.fromARGB(255, 222, 212, 212))),
                child: MaterialButton(onPressed: (){
                  setState(() {
                    userInput += '-';
                   
                  });
                },
                child:const  Center(child: Text('-', style: TextStyle(fontSize:30),)),
                ),
              ),
          
              ],),
              Row(children: [
              Container(
                width: 90,
                height: 60,
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                decoration: BoxDecoration(border: Border.all(color:const  Color.fromARGB(255, 222, 212, 212))),
                child: MaterialButton(onPressed: (){
                  setState(() {
                    userInput += '0';
                
                  });
                },
                child: const Center(child: Text('0', style: TextStyle(fontSize:30),)),
                ),
              ),
              Container(
                width: 90,
                height: 60,
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                decoration: BoxDecoration(border: Border.all(color:const  Color.fromARGB(255, 222, 212, 212))),
                child: MaterialButton(onPressed: (){
                  setState(() {
                     userInput += '00';
                    
                  });
                },
                child: const Center(child: Text('00', style: TextStyle(fontSize:30),)),
                ),
              ),
              Container(
                width: 90,
                height: 60,
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                decoration: BoxDecoration(border: Border.all(color:const  Color.fromARGB(255, 222, 212, 212))),
                child: MaterialButton(onPressed: (){
                  setState(() {
                   
                    userInput += '.';
                    
                  });
                },
                child: const Center(child: Text('.', style: TextStyle(fontSize:30),)),
                ),
              ),
              Container(
                width: 90,
                height: 60,
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                decoration: BoxDecoration(border: Border.all(color:const  Color.fromARGB(255, 222, 212, 212),),color: Colors.blue),
                child: MaterialButton(onPressed: (){
                  setState(() {
                      result = calculate();
                      userInput = result;
                      if(result.endsWith(".0")){
                        userInput = userInput.replaceAll(".0", "" );
                     }
                      if(result.endsWith(".0")){
                        result =result.replaceAll(".0", "");
                        return;
                      }    
                  
                  }
                                  
                  );
                },
                child:const  Center(child: Text('=', style: TextStyle(fontSize:30, color: Colors.white),)),
                ),
              )
          
              ],
              ),
              const SizedBox(height: 50,) ,  
              const Text('Designed by Mr Makunga', style: TextStyle(fontStyle: FontStyle.italic), )    
            ],
          ),
        ),
         );    
  }
}