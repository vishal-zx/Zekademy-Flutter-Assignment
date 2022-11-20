import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zekademy/pages/profile.dart';

import '../api/get_people.dart';
import '../models/person.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({super.key});

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

Widget peopleCard(BuildContext context, Person person, int i) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal:14, vertical: 7),
    height: 72,
    decoration: BoxDecoration(
      color: const Color.fromRGBO(255, 255, 255, 1),
      border: Border.all(
        color: const Color.fromRGBO(238, 238, 238, 1),
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 10, 8),
      child: Row(
        children: [
          Image.asset(
            'assets/images/person${i%5}.png',
            width: 56,
            height: 56,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            width:12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: SizedBox(
                  width: 165,
                  child: Text(
                    person.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                  ),
                ),
              ),
              Text(
                "@${person.username}",
              ),
            ]
          ),
          const Spacer(),
          Container(
            width: 72,
            height: 32,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              border: Border.all(
                color: const Color.fromRGBO(238, 238, 238, 1),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: TextButton(
                onPressed: (){
                  //navigate to profile page
                  Navigator.push(
                    context, 
                    PageTransition(
                      type: PageTransitionType.rightToLeft, 
                      duration: const Duration(milliseconds: 300),
                      child: Profile(i:i),
                      childCurrent: const PeoplePage()
                    )

                  );
                },
                child: const Text(
                  'View',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(112, 0, 255, 1)
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class _PeoplePageState extends State<PeoplePage> {
  List<Person> personList = [];
  
  @override
  void initState() {
    getPeople().then((value) => setState((){
      personList = value;
    }));
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        titleSpacing: 0,
        elevation: 1,
        title: Image.asset(
          'assets/images/Logo.png',
          height: 30,
        ),
        actions: [
          Image.asset(
            'assets/images/Notification.png',
            width: 24,
          ),
          const SizedBox(width: 20,),
          Image.asset(
            'assets/images/Search.png',
            width: 24,
          ),
          const SizedBox(width: 30,),
        ],
      ),
      
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: Container(
        child: (personList.isEmpty)?const Center(
          child: CircularProgressIndicator(
            color: Color.fromRGBO(112, 0, 255, 1),
          ),
        ):ListView.builder(
          itemCount: personList.length,
          padding: const EdgeInsets.symmetric(vertical: 7),
          itemBuilder: (context, index){
            return peopleCard(context, personList[index], index);
          }
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromRGBO(112, 0, 255, 1),
        selectedLabelStyle: const TextStyle(
          fontSize: 10,
          color: Color.fromRGBO(112, 0, 255, 1)
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 10,
          color: Color.fromRGBO(170, 170, 170, 1)
        ),

        items: const [
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/images/Home.png'),
              width: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/images/3User.png'),
              width: 24,
            ),
            label: 'People',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/images/Plus.png'),
              width: 24,
            ),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/images/Heart.png'),
              width: 24,
            ),
            label: 'Activites',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage('assets/images/Profile.png'),
              width: 24,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}