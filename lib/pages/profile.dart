import 'package:flutter/material.dart';
import 'package:zekademy/api/get_details.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, this.i});
  final i;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int id = 0;
  dynamic profile;
  String fullAddr = "";

  @override
  void initState() {
    id = widget.i+1;
    getDetails(id).then((value) => setState((){
      profile = value;
      fullAddr+=profile.address.street+", "+profile.address.suite+", "+profile.address.city+", "+profile.address.zipcode;
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        elevation: 0,
        title: Transform.translate(
          offset: const Offset(-16, 0),
          child: (profile!=null)? Text(
            profile.name,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
          ):null,
        ),
        centerTitle: false,
      ),
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: (profile==null)?const Center(
        child: CircularProgressIndicator(
          color: Color.fromRGBO(112, 0, 255, 1),
        ),
      )
      :Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical:16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                      image: AssetImage('assets/images/person${(id-1)%5}.png'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                const SizedBox(width: 16,),
                SizedBox(
                  height: 58,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: SizedBox(
                          width:230,
                          child: Text(
                            profile.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                            softWrap: false,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                          ),
                        ),
                      ),
                      Text(
                        "@${profile.username}",
                        style: const TextStyle(
                          color: Color.fromRGBO(140, 140, 140, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16,),
            Row(
              children:  [
                const Text(
                  'Email:',
                  style:  TextStyle(
                    color: Color.fromRGBO(140, 140, 140, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 6,),
                Text(
                  profile.email,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Address:',
                  style:  TextStyle(
                    color: Color.fromRGBO(140, 140, 140, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 6,),
                Flexible(
                  child: Text(
                    fullAddr,
                    style:  const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text(
                  'Phone:',
                  style:  TextStyle(
                    color: Color.fromRGBO(140, 140, 140, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 6,),
                Text(
                  profile.phone,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text(
                  'Website:',
                  style:  TextStyle(
                    color: Color.fromRGBO(140, 140, 140, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 6,),
                Text(
                  profile.website,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}