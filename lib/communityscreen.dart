import 'package:flutter/material.dart';
import 'package:whatsapp_ui/newcommunity.dart';

class CommunityScreen extends StatelessWidget{
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30,),
          Image.asset('images/bg.png',height: 120,width: 120,),
          const SizedBox(height: 30,),
          const Text('Introducing Communities',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold,letterSpacing: 0.5)),
          const SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21.0),
            child: Text('Easily organise your related groups and send announcements. Now,your communities,like neighbourhoods or schools, can have their own space',
            style: TextStyle(color:Colors.grey[600],fontSize: 16),
            textAlign: TextAlign.center,
            softWrap: true,),
          ),
          const SizedBox(height: 30,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> NewCommunity()));
            },
            child: Container(
              decoration: const BoxDecoration(
                color:Color(0xFF075E54),
                 borderRadius: BorderRadius.all(
                   Radius.circular(18)
              ),
              ),
            height: 35,
            width: 280,
            child:const Center(
              child:Text('Start your community',style:TextStyle(color:Colors.white,fontSize: 17,fontWeight: FontWeight.w500)),
            )
      ),
          ),
        ],
      ),
    );
  }

}