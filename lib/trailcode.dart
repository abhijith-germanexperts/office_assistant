// Padding(
//   padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.2,right: MediaQuery.of(context).size.width*0.2 ),
//   child: ListView.builder(
//     padding: EdgeInsets.zero,
//     itemCount: _items.length,
//       itemBuilder: (_,index){
//     final item= _items[index];
//     return Card(
//       color: index%2==0? Color(0xff5A5858) : Color(0xff424242),
//       child: ListTileTheme(
//         contentPadding: EdgeInsets.all(0),
//         dense: true,
//         horizontalTitleGap: 0.0,
//         minLeadingWidth: 0,
//         child: ExpansionTile(
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(child: AutoSizeText(item['title'],style: TextStyle(color: Colors.white,),maxLines: 1,minFontSize: 4,group: listgroup,)),
//               Spacer(),
//               Expanded(child: MediaQuery.of(context).size.width > 1000? AutoSizeText("Abu Dhabi $index",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,) : AutoSizeText("AUH $index",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,)),
//              Spacer(),
//               Expanded(child: AutoSizeText("IT $index",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,)),
//               Spacer(),
//               Expanded(child: AutoSizeText("777 $index",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,)),
//              Spacer(),
//               Expanded(
//                 child: Row(
//                   children: [
//                     Expanded(child: Icon(Icons.adjust_rounded,color: Colors.red,size: MediaQuery.of(context).size.width*0.009,)),
//                     Expanded(child:MediaQuery.of(context).size.width > 1000? AutoSizeText("offline",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,) :  AutoSizeText("off",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,))
//                   ],
//                 ),
//               )
//             ],
//           ),children: [
//           Padding(
//             padding: const EdgeInsets.all(0.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       AutoSizeText("Name:",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
//                       AutoSizeText("Branch:",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
//                       AutoSizeText("Department:",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
//                       AutoSizeText("Building number:",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
//                       AutoSizeText("Office room:",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       AutoSizeText("John Doe",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
//                       AutoSizeText("Abu Dhabi",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
//                       AutoSizeText("IT",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
//                       AutoSizeText("22",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
//                       AutoSizeText("123",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       AutoSizeText("Status:",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
//                       AutoSizeText("Extension:",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
//                       AutoSizeText("Phone: ",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
//                       AutoSizeText("Email:",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
//
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       AutoSizeText("John Doe",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
//                       AutoSizeText("Abu Dhabi",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
//                       AutoSizeText("IT",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
//                       AutoSizeText("johndoe@gmail.com",style: TextStyle(color: Colors.white),maxLines: 1,minFontSize: 4,group: listgroup,),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],),
//       ),
//     );
//   }),
// ),