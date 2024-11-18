// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';

// import '../../../services/apiservices.dart';
// class MobilePantryViewOrder extends StatefulWidget {
//   const MobilePantryViewOrder({Key? key}) : super(key: key);

//   @override
//   State<MobilePantryViewOrder> createState() => _MobilePantryViewOrderState();
// }
// late TabController _tabController;
// class _MobilePantryViewOrderState extends State<MobilePantryViewOrder>  with TickerProviderStateMixin{
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//     _tabController.animateTo(1);
//   }
//   ApiProvider client = ApiProvider();
//   @override
//   Widget build(BuildContext context) {
//     var headingGroup = AutoSizeGroup();
//     List catGory=["Coffee","Tea","Coffee"];
//     List catItem=["Cappuccino","Green tea","Americano"];
//     List itemQuantity=["3","2","1"];
//     return Scaffold(
//         backgroundColor: Colors.black87,
//         // backgroundColor: Colors.white,
//         // appBar: AppBar(
//         //   title: Text('image/end user directory banner.jpg'),
//         // ),
//         body: Column(
//           children: [
//             Container(
//                 width: double.maxFinite,
//                 height: MediaQuery.of(context).size.height * 0.25,
//                 decoration:  const BoxDecoration(
//                     image: DecorationImage(
//                       image:
//                       AssetImage("image/rohit-khadgi-lEbR6nR8V1A-unsplash (2).jpg"),
//                       fit: BoxFit.cover,
//                       alignment: Alignment(0.0, 0.3),
//                     )),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                             width: MediaQuery.of(context).size.width * 0.4,
//                             height: MediaQuery.of(context).size.height * 0.05,
//                             // color: Colors.red,
//                             child: const Image(
//                                 image: AssetImage(
//                                     "image/GE office assistant white.png"))),
//                         Padding(
//                           padding: EdgeInsets.only(
//                               right: MediaQuery.of(context).size.width * 0.03),
//                           child: Icon(
//                             Icons.menu,
//                             color: Colors.white,
//                             size:
//                             MediaQuery.of(context).size.shortestSide * 0.04,
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height * .2,
//                       // color: Colors.blue,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Expanded(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 AutoSizeText(
//                                   "The Pantry",
//                                   style: GoogleFonts.inriaSerif(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 40,
//                                       color: Colors.white),
//                                   minFontSize: 5,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 )),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.018,
//             ),
//             Container(
//               // color: Colors.yellow,
//               height: MediaQuery.of(context).size.height * 0.08,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Align(
//                       alignment: Alignment.topCenter,
//                       child: InkWell(
//                           onTap: (){Navigator.pop(context);},
//                           child: Icon(Icons.arrow_back_rounded,size: MediaQuery.of(context).size.height*0.04,color: Colors.white,))),
//                   // Align(
//                   //   alignment: Alignment.topCenter,
//                   //   child: Padding(
//                   //       padding: EdgeInsets.only(
//                   //           left: MediaQuery.of(context).size.width * 0.08),
//                   //       child: ElevatedButton(
//                   //         onPressed: () {
//                   //           Navigator.pop(context);
//                   //         },
//                   //         style: ElevatedButton.styleFrom(
//                   //           elevation: 4,
//                   //           backgroundColor: Colors.transparent,
//                   //           // foregroundColor: Colors.white,
//                   //           shape: RoundedRectangleBorder(
//                   //             borderRadius: BorderRadius.circular(17), // Set border radius of 3
//                   //             side: const BorderSide(
//                   //               color: Colors.white,
//                   //             ),
//                   //           ),
//                   //         ),
//                   //         child: Row(
//                   //           mainAxisAlignment: MainAxisAlignment.start,
//                   //           children:  [
//                   //             Icon(Icons.arrow_back_rounded,size: MediaQuery.of(context).size.height*0.05,),
//                   //             SizedBox(width: 8),
//                   //             Text('Go back'),
//                   //           ],
//                   //         ),
//                   //       )
//                   //   ),
//                   // ),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.03,
//                   ),
//                   Expanded(
//                     child: Container(
//                       height: 1200,
//                       child: TabBar(
//                         indicatorWeight: 4,
//                         indicatorColor: Colors.white,
//                         indicatorSize: TabBarIndicatorSize.label,
//                         indicatorPadding: const EdgeInsets.all(10),
//                         controller: _tabController,
//                         tabs: const [
//                           Tab(child: Padding(
//                             padding: EdgeInsets.all(11.0),
//                             child: AutoSizeText("Pending",maxLines: 1,minFontSize: 10,style: TextStyle(fontSize: 30),),
//                           ),),
//                           Tab(child: Padding(
//                             padding: EdgeInsets.all(11.0),
//                             child: AutoSizeText("Accepted",maxLines: 1,minFontSize: 10,style: TextStyle(fontSize: 30),),
//                           ),),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // SizedBox(
//             //   height: MediaQuery.of(context).size.height * 0.01,
//             // ),
//             // Spacer(),
//             Container(height: 1,width: double.maxFinite,color: Colors.white,),
//             Padding(
//               padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03,right: MediaQuery.of(context).size.width*0.03),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       // color:Colors.blue,
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(child: SizedBox(child: AutoSizeText("Date & Time",textAlign: TextAlign.center,style: const TextStyle(fontSize: 24),maxLines: 1,group: headingGroup,))),
//                               Expanded(child: SizedBox(child: AutoSizeText("Office & Extension ",textAlign: TextAlign.left,minFontSize:2,style: const TextStyle(fontSize: 24),maxLines: 1,group: headingGroup,))),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       // color: Colors.green,
//                       width: 100,
//                       height: 40,
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Expanded(child: SizedBox(child: AutoSizeText("Category",textAlign: TextAlign.start,style: const TextStyle(fontSize: 24),maxLines: 1,group: headingGroup,))),
//                                 Expanded(child: SizedBox(child: AutoSizeText("Item",textAlign: TextAlign.start,style: const TextStyle(fontSize: 24),maxLines: 1,group: headingGroup,))),
//                                 Expanded(child: SizedBox(child: AutoSizeText("Quantity",textAlign: TextAlign.center,style: const TextStyle(fontSize: 24),maxLines: 1,group: headingGroup,))),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10,),
//             Container(height: 1,width: double.maxFinite,color: Colors.white,),
//             const SizedBox(height: 10,),
//             Expanded(
//               child: TabBarView(
//                 controller: _tabController,
//                 children: [
//                   pantryViewOrderPendingList(context,) ?? const Text("Null"),
//                   pantryViewOrderAcceptedList(context,) ?? const Text("Null"),
//                   // pantryViewOrderPendingList(context,catGory,catItem,itemQuantity) ?? const Text("Null"),
//                   // pantryViewOrderList(context,catGory,catItem,itemQuantity) ?? const Text("Null"),
//                 ],
//               ),
//             ),
// // Spacer(),
//             Padding(
//               padding: const EdgeInsets.only(left: 8.0, right: 8),
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.5,
//                 height: MediaQuery.of(context).size.height * 0.05,
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: AutoSizeText(
//                     "Copyright 2023 © German Experts. All Rights Reserved",
//                     style: GoogleFonts.inter(
//                       textStyle: const TextStyle(color: Color(0xffFFFFFF)),
//                     ),
//                     maxLines: 1,
//                     minFontSize: 2,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
//   // ================================================Accepted order API =============================
//   pantryViewOrderAcceptedList(BuildContext context){
//     return
//       FutureBuilder(
//           future: client.acceptedOrderByPantry(),
//           builder: (context,snapshot){
//             if(snapshot.connectionState == ConnectionState.waiting){
//               return const Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError){
//               return Text(snapshot.error.toString());
//             } else if(
//             snapshot.hasData
//             ){
//               return ListView.builder(
//                   padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03,right: MediaQuery.of(context).size.width*0.03),
//                   itemCount: snapshot.data!.data.length,
//                   itemBuilder: (BuildContext context, int index){
//                     return Padding(
//                       padding: const EdgeInsets.only(bottom: 18.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: index%2==0? const Color(0XFF424242):const Color(0XFF5A5858),
//                           borderRadius: BorderRadius.circular(5.0),
//                         ),
//                         child: Column(
//                           children: [
//                             const SizedBox(height: 15,),
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: Container(
//                                     // color:Colors.blue,
//                                     child: Column(
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children:  [
//                                             Expanded(child: SizedBox(child: Text(DateFormat('HH:mm').format(snapshot.data!.data[index].createdAt)
//                                               ,textAlign: TextAlign.center,))),
//                                             Expanded(child: SizedBox(child: Text(snapshot.data!.data[index].officename,textAlign: TextAlign.left,))),
//                                           ],
//                                         ),
//                                         const SizedBox(height: 5,),
//                                         Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                           children:  [
//                                             Expanded(child: SizedBox(child: Text(DateFormat('dd-MM-yyyy').format(snapshot.data!.data[index].createdAt)
//                                               ,textAlign: TextAlign.center,))),
//                                             Expanded(child: SizedBox(child: Text("np${snapshot.data!.data[index].orderid}",textAlign: TextAlign.center,))),
//                                           ],
//                                         ),
//                                         Align(
//                                             alignment: Alignment.topLeft,
//                                             child: Row(
//                                               children: const [
//                                                 SizedBox(width: 20,),
//                                                 Text("Notes:"),
//                                               ],
//                                             )),
//                                         Align(
//                                           alignment: FractionalOffset.bottomLeft,
//                                           child: Row(
//                                             children: [
//                                               const SizedBox(width: 20,),
//                                               Container(
//                                                   height:52,
//                                                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0),color: Colors.white, ),
//                                                   width:MediaQuery.of(context).size.width*0.3,
//                                                   child:  Padding(
//                                                     padding: const EdgeInsets.only(top: 8.0,bottom: 8,left: 18),
//                                                     child: Text(snapshot.data!.data[index].remark,style: const TextStyle(color: Colors.black),),
//                                                   )),
//                                             ],
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: SizedBox(
//                                     // color: Colors.green,
//                                     height:107,
//                                     width:100,
//                                     child: Column(
//                                       children: [
//                                         Expanded(
//                                           child: ListView.builder(
//                                               itemCount: snapshot.data?.data[index].orderdetails.length,
//                                               itemBuilder: (BuildContext context, int index){
//                                                 return Column(
//                                                   children: [
//                                                     Row(
//                                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                                       children: [
//                                                         Expanded(child: SizedBox(child: Text(snapshot.data?.data.first.orderdetails[index].categoryname.name ?? "",textAlign: TextAlign.start,))),
//                                                         Expanded(child: SizedBox(child: Text(snapshot.data?.data.first.orderdetails[index].itemname.name.toString() ?? "",textAlign: TextAlign.start,))),
//                                                         Expanded(child: SizedBox(child: Text("x${snapshot.data?.data.first.orderdetails[index].qty.toString() ?? ""}",textAlign: TextAlign.center,))),
//                                                       ],
//                                                     ),
//                                                     const SizedBox(height: 5,)
//                                                   ],
//                                                 );
//                                               }),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             const SizedBox(height: 20,),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     String  orderId= snapshot.data!.data[index].orderid.toString() ;
//                                     String  statusOrderId= "4" ;
//                                     String  modifiedBy= "33" ;
//                                     alertbox(context,orderId,statusOrderId,modifiedBy);
//                                   },
//                                   style: ButtonStyle(
//                                     backgroundColor:
//                                     const MaterialStatePropertyAll(Color(0xff303030)),
//                                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                                       RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(5.0),
//                                           side: const BorderSide(color: Color(0xffE97979)) // Replace with your desired border color
//                                       ),
//                                     ),
//                                   ),
//                                   child: const Padding(
//                                     padding: EdgeInsets.all(8.0),
//                                     child: AutoSizeText("Cancel",style: TextStyle(fontSize: 20),),
//                                   ),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     String  orderId= snapshot.data!.data[index].orderid.toString() ;
//                                     String  statusOrderId= "3" ;
//                                     String  modifiedBy= "33" ;
//                                     alertbox(context,orderId,statusOrderId,modifiedBy);
//                                   },
//                                   style: ButtonStyle(
//                                     backgroundColor:
//                                     const MaterialStatePropertyAll(Colors.transparent),
//                                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                                       RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(5.0),
//                                           side: const BorderSide(color: Color(0xff69C86D)) // Replace with your desired border color
//                                       ),
//                                     ),
//                                   ),
//                                   child: const Padding(
//                                     padding: EdgeInsets.all(8.0),
//                                     child: AutoSizeText("Completed",style: TextStyle(fontSize: 20),),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 15,),
//                           ],
//                         ),
//                       ),
//                     );
//                   });
//             }
//             return Container();
//           }
//       );
//   }

//   // =================================================pending=======================================================

//   pantryViewOrderPendingList(BuildContext context){
//     return
//       FutureBuilder(
//           future: client.pendingOrderForPantry(),
//           builder: (context,snapshot){
//             if(snapshot.connectionState == ConnectionState.waiting){
//               return  AlertDialog(
//                 content: Container(
//                   height: 80.0,
//                   child: Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 ),
//               );
//             } else if (snapshot.hasError){
//               print(snapshot.error);
//             } else if(
//             snapshot.hasData
//             ) {
//               if (snapshot.data!.data.length == 0) {
//                 return Text("Please Check Pending Orders");
//               } else{
//                 return ListView.builder(
//                     padding: EdgeInsets.only(left: MediaQuery
//                         .of(context)
//                         .size
//                         .width * 0.03, right: MediaQuery
//                         .of(context)
//                         .size
//                         .width * 0.03),
//                     itemCount: snapshot.data!.data.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Padding(
//                         padding: const EdgeInsets.only(bottom: 18.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: index % 2 == 0
//                                 ? const Color(0XFF424242)
//                                 : const Color(0XFF5A5858),
//                             borderRadius: BorderRadius.circular(5.0),
//                           ),
//                           child: Column(
//                             children: [
//                               const SizedBox(height: 15,),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Container(
//                                       // color:Colors.blue,
//                                       child: Column(
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment
//                                                 .spaceBetween,
//                                             children: [
//                                               Expanded(child: SizedBox(
//                                                   child: Text(
//                                                     DateFormat('HH:mm').format(
//                                                         snapshot.data!
//                                                             .data[index]
//                                                             .createdAt)
//                                                     , textAlign: TextAlign
//                                                       .center,))),
//                                               Expanded(child: SizedBox(
//                                                   child: Text(
//                                                     snapshot.data!.data[index]
//                                                         .officename,
//                                                     textAlign: TextAlign
//                                                         .left,))),
//                                             ],
//                                           ),
//                                           const SizedBox(height: 5,),
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment
//                                                 .spaceAround,
//                                             children: [
//                                               Expanded(child: SizedBox(
//                                                   child: Text(
//                                                     DateFormat('dd-MM-yyyy')
//                                                         .format(snapshot.data!
//                                                         .data[index].createdAt)
//                                                     , textAlign: TextAlign
//                                                       .center,))),
//                                               Expanded(child: SizedBox(
//                                                   child: Text(
//                                                     "np${snapshot.data!
//                                                         .data[index].orderid}",
//                                                     textAlign: TextAlign
//                                                         .center,))),
//                                             ],
//                                           ),
//                                           Align(
//                                               alignment: Alignment.topLeft,
//                                               child: Row(
//                                                 children: const [
//                                                   SizedBox(width: 20,),
//                                                   Text("Notes:"),
//                                                 ],
//                                               )),
//                                           Align(
//                                             alignment: FractionalOffset
//                                                 .bottomLeft,
//                                             child: Row(
//                                               children: [
//                                                 const SizedBox(width: 20,),
//                                                 Container(
//                                                     height: 52,
//                                                     decoration: BoxDecoration(
//                                                       borderRadius: BorderRadius
//                                                           .circular(5.0),
//                                                       color: Colors.white,),
//                                                     width: MediaQuery
//                                                         .of(context)
//                                                         .size
//                                                         .width * 0.3,
//                                                     child: Padding(
//                                                       padding: const EdgeInsets
//                                                           .only(top: 8.0,
//                                                           bottom: 8,
//                                                           left: 18),
//                                                       child: Text(snapshot.data!
//                                                           .data[index].remark,
//                                                         style: const TextStyle(
//                                                             color: Colors
//                                                                 .black),),
//                                                     )),
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: SizedBox(
//                                       // color: Colors.green,
//                                       height: 107,
//                                       width: 100,
//                                       child: Column(
//                                         children: [
//                                           Expanded(
//                                             child: ListView.builder(
//                                                 itemCount: snapshot.data
//                                                     ?.data[index].orderdetails
//                                                     .length,
//                                                 itemBuilder: (
//                                                     BuildContext context,
//                                                     int index) {
//                                                   return Column(
//                                                     children: [
//                                                       Row(
//                                                         mainAxisAlignment: MainAxisAlignment
//                                                             .spaceAround,
//                                                         children: [
//                                                           Expanded(
//                                                               child: SizedBox(
//                                                                   child: Text(
//                                                                     snapshot
//                                                                         .data
//                                                                         ?.data
//                                                                         .first
//                                                                         .orderdetails[index]
//                                                                         .categoryname
//                                                                         .name ??
//                                                                         "",
//                                                                     textAlign: TextAlign
//                                                                         .start,))),
//                                                           Expanded(
//                                                               child: SizedBox(
//                                                                   child: Text(
//                                                                     snapshot
//                                                                         .data
//                                                                         ?.data
//                                                                         .first
//                                                                         .orderdetails[index]
//                                                                         .itemname
//                                                                         .name
//                                                                         .toString() ??
//                                                                         "",
//                                                                     textAlign: TextAlign
//                                                                         .start,))),
//                                                           Expanded(
//                                                               child: SizedBox(
//                                                                   child: Text(
//                                                                     "x${snapshot
//                                                                         .data
//                                                                         ?.data
//                                                                         .first
//                                                                         .orderdetails[index]
//                                                                         .qty
//                                                                         .toString() ??
//                                                                         ""}",
//                                                                     textAlign: TextAlign
//                                                                         .center,))),
//                                                         ],
//                                                       ),
//                                                       const SizedBox(height: 5,)
//                                                     ],
//                                                   );
//                                                 }),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               const SizedBox(height: 20,),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment
//                                     .spaceAround,
//                                 children: [
//                                   ElevatedButton(
//                                     onPressed: () {
//                                       String orderId = snapshot.data!
//                                           .data[index].orderid.toString();
//                                       String statusOrderId = "4";
//                                       String modifiedBy = "33";
//                                       alertbox(context,orderId,statusOrderId,modifiedBy);
//                                     },
//                                     style: ButtonStyle(
//                                       backgroundColor:
//                                       const MaterialStatePropertyAll(
//                                           Color(0xff303030)),
//                                       shape: MaterialStateProperty.all<
//                                           RoundedRectangleBorder>(
//                                         RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(
//                                                 5.0),
//                                             side: const BorderSide(color: Color(
//                                                 0xffE97979)) // Replace with your desired border color
//                                         ),
//                                       ),
//                                     ),
//                                     child: const Padding(
//                                       padding: EdgeInsets.all(8.0),
//                                       child: AutoSizeText("Cancel",
//                                         style: TextStyle(fontSize: 20),),
//                                     ),
//                                   ),
//                                   ElevatedButton(
//                                     onPressed: () {
//                                       String orderId = snapshot.data!
//                                           .data[index].orderid.toString();
//                                       String statusOrderId = "2";
//                                       String modifiedBy = "33";
//                                       alertbox(context,orderId,statusOrderId,modifiedBy);
//                                     },
//                                     style: ButtonStyle(
//                                       backgroundColor:
//                                       const MaterialStatePropertyAll(
//                                           Colors.transparent),
//                                       shape: MaterialStateProperty.all<
//                                           RoundedRectangleBorder>(
//                                         RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(
//                                                 5.0),
//                                             side: const BorderSide(color: Color(
//                                                 0xff69C86D)) // Replace with your desired border color
//                                         ),
//                                       ),
//                                     ),
//                                     child: const Padding(
//                                       padding: EdgeInsets.all(8.0),
//                                       child: AutoSizeText("Accept",
//                                         style: TextStyle(fontSize: 20),),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 15,),
//                             ],
//                           ),
//                         ),
//                       );
//                     });
//               }
//             }
//             return Container();
//           }
//       );
//   }

//   // =============================================changing order status==================================================

//   changeStatusOfTheOrder(BuildContext context,orderId,stOrderId,modifiedBy){
//     return  FutureBuilder(
//         future: client.changeOrderStatus(orderId,stOrderId,modifiedBy),
//         builder: (context,snapshot){
//           if(snapshot.connectionState == ConnectionState.waiting){
//             print("running");
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError){
//             print(snapshot.error);
//           } else if(
//           snapshot.hasData
//           ){
//             if(snapshot.data!.messagecode=="1001"){
//               setState(() {

//               });
//             }
//           }
//           return Container();
//         }
//     );
//   }

//   // ================================================Accepted order API =============================
//   // pantryViewOrderAcceptedList(BuildContext context) {
//   //   return FutureBuilder(
//   //       future: client.acceptedOrderByPantry(),
//   //       builder: (context, snapshot) {
//   //         if (snapshot.connectionState == ConnectionState.waiting) {
//   //           return const Center(child: CircularProgressIndicator());
//   //         } else if (snapshot.hasError) {
//   //           return Text(snapshot.error.toString());
//   //         } else if (snapshot.hasData) {
//   //           return ListView.builder(
//   //               padding: EdgeInsets.only(
//   //                   left: MediaQuery.of(context).size.width * 0.09,
//   //                   right: MediaQuery.of(context).size.width * 0.09),
//   //               itemCount: snapshot.data!.data.length,
//   //               itemBuilder: (BuildContext context, int index) {
//   //                 return Padding(
//   //                   padding: const EdgeInsets.only(bottom: 18.0),
//   //                   child: Container(
//   //                     decoration: BoxDecoration(
//   //                       color: index % 2 == 0
//   //                           ? const Color(0XFF424242)
//   //                           : const Color(0XFF5A5858),
//   //                       borderRadius: BorderRadius.circular(5.0),
//   //                     ),
//   //                     child: Column(
//   //                       children: [
//   //                         const SizedBox(
//   //                           height: 15,
//   //                         ),
//   //                         Row(
//   //                           children: [
//   //                             Expanded(
//   //                               child: Container(
//   //                                 // color:Colors.blue,
//   //                                 child: Column(
//   //                                   children: [
//   //                                     Row(
//   //                                       mainAxisAlignment:
//   //                                       MainAxisAlignment.spaceBetween,
//   //                                       children: [
//   //                                         Expanded(
//   //                                             child: SizedBox(
//   //                                                 child: Text(
//   //                                                   DateFormat('HH:mm').format(snapshot
//   //                                                       .data!.data[index].createdAt)  ?? "",
//   //                                                   textAlign: TextAlign.center,
//   //                                                 ))),
//   //                                         Expanded(
//   //                                             child: SizedBox(
//   //                                                 child: Text(
//   //                                                   snapshot
//   //                                                       .data!.data[index].officename  ?? "",
//   //                                                   textAlign: TextAlign.left,
//   //                                                 ))),
//   //                                       ],
//   //                                     ),
//   //                                     const SizedBox(
//   //                                       height: 5,
//   //                                     ),
//   //                                     Row(
//   //                                       mainAxisAlignment:
//   //                                       MainAxisAlignment.spaceAround,
//   //                                       children: [
//   //                                         Expanded(
//   //                                             child: SizedBox(
//   //                                                 child: Text(
//   //                                                   DateFormat('dd-MM-yyyy').format(
//   //                                                       snapshot.data!.data[index]
//   //                                                           .createdAt)  ?? "",
//   //                                                   textAlign: TextAlign.center,
//   //                                                 ))),
//   //                                         Expanded(
//   //                                             child: SizedBox(
//   //                                                 child: Text(
//   //                                                   "np${snapshot.data!.data[index].orderid  ?? ""}",
//   //                                                   textAlign: TextAlign.center,
//   //                                                 ))),
//   //                                       ],
//   //                                     ),
//   //                                     Align(
//   //                                         alignment: Alignment.topLeft,
//   //                                         child: Row(
//   //                                           children: const [
//   //                                             SizedBox(
//   //                                               width: 20,
//   //                                             ),
//   //                                             Text("Notes:"),
//   //                                           ],
//   //                                         )),
//   //                                     Align(
//   //                                       alignment: FractionalOffset.bottomLeft,
//   //                                       child: Row(
//   //                                         children: [
//   //                                           const SizedBox(
//   //                                             width: 20,
//   //                                           ),
//   //                                           Container(
//   //                                               height: 52,
//   //                                               decoration: BoxDecoration(
//   //                                                 borderRadius:
//   //                                                 BorderRadius.circular(
//   //                                                     5.0),
//   //                                                 color: Colors.white,
//   //                                               ),
//   //                                               width: MediaQuery.of(context)
//   //                                                   .size
//   //                                                   .width *
//   //                                                   0.3,
//   //                                               child: Padding(
//   //                                                 padding:
//   //                                                 const EdgeInsets.only(
//   //                                                     top: 8.0,
//   //                                                     bottom: 8,
//   //                                                     left: 18),
//   //                                                 child: Text(
//   //                                                   snapshot.data!.data[index]
//   //                                                       .remark  ?? "",
//   //                                                   style: const TextStyle(
//   //                                                       color: Colors.black),
//   //                                                 ),
//   //                                               )),
//   //                                         ],
//   //                                       ),
//   //                                     )
//   //                                   ],
//   //                                 ),
//   //                               ),
//   //                             ),
//   //                             Expanded(
//   //                               child: SizedBox(
//   //                                 // color: Colors.green,
//   //                                 height: 107,
//   //                                 width: 100,
//   //                                 child: Column(
//   //                                   children: [
//   //                                     Expanded(
//   //                                       child: ListView.builder(
//   //                                           itemCount: snapshot
//   //                                               .data
//   //                                               ?.data[index]
//   //                                               .orderdetails
//   //                                               .length,
//   //                                           itemBuilder: (BuildContext context,
//   //                                               int index) {
//   //                                             return Column(
//   //                                               children: [
//   //                                                 Row(
//   //                                                   mainAxisAlignment:
//   //                                                   MainAxisAlignment
//   //                                                       .spaceAround,
//   //                                                   children: [
//   //                                                     Expanded(
//   //                                                         child: SizedBox(
//   //                                                             child: Text(
//   //                                                               snapshot
//   //                                                                   .data
//   //                                                                   ?.data
//   //                                                                   .first
//   //                                                                   .orderdetails[
//   //                                                               index]
//   //                                                                   .categoryname
//   //                                                                   .name ??
//   //                                                                   "",
//   //                                                               textAlign:
//   //                                                               TextAlign.start,
//   //                                                             ))),
//   //                                                     Expanded(
//   //                                                         child: SizedBox(
//   //                                                             child: Text(
//   //                                                               snapshot
//   //                                                                   .data
//   //                                                                   ?.data
//   //                                                                   .first
//   //                                                                   .orderdetails[
//   //                                                               index]
//   //                                                                   .itemname
//   //                                                                   .name
//   //                                                                   .toString() ??
//   //                                                                   "",
//   //                                                               textAlign:
//   //                                                               TextAlign.start,
//   //                                                             ))),
//   //                                                     Expanded(
//   //                                                         child: SizedBox(
//   //                                                             child: Text(
//   //                                                               "x${snapshot.data?.data.first.orderdetails[index].qty.toString() ?? ""}",
//   //                                                               textAlign:
//   //                                                               TextAlign.center,
//   //                                                             ))),
//   //                                                   ],
//   //                                                 ),
//   //                                                 const SizedBox(
//   //                                                   height: 5,
//   //                                                 )
//   //                                               ],
//   //                                             );
//   //                                           }),
//   //                                     )
//   //                                   ],
//   //                                 ),
//   //                               ),
//   //                             )
//   //                           ],
//   //                         ),
//   //                         const SizedBox(
//   //                           height: 20,
//   //                         ),
//   //                         Row(
//   //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //                           children: [
//   //                             ElevatedButton(
//   //                               onPressed: () {
//   //                                 String orderId = snapshot
//   //                                     .data!.data[index].orderid
//   //                                     .toString()  ?? "";
//   //                                 String statusOrderId = "4";
//   //                                 String modifiedBy = "33";
//   //                                 // changeStatusOfTheOrder(context, orderId,
//   //                                 //     statusOrderId, modifiedBy);
//   //                                 alertbox(context,orderId,statusOrderId,modifiedBy);
//   //                               },
//   //                               style: ButtonStyle(
//   //                                 backgroundColor:
//   //                                 const MaterialStatePropertyAll(
//   //                                     Color(0xff303030)),
//   //                                 shape: MaterialStateProperty.all<
//   //                                     RoundedRectangleBorder>(
//   //                                   RoundedRectangleBorder(
//   //                                       borderRadius:
//   //                                       BorderRadius.circular(5.0),
//   //                                       side: const BorderSide(
//   //                                           color: Color(
//   //                                               0xffE97979)) // Replace with your desired border color
//   //                                   ),
//   //                                 ),
//   //                               ),
//   //                               child: const Padding(
//   //                                 padding: EdgeInsets.all(8.0),
//   //                                 child: AutoSizeText(
//   //                                   "Cancel",
//   //                                   style: TextStyle(fontSize: 20),
//   //                                 ),
//   //                               ),
//   //                             ),
//   //                             ElevatedButton(
//   //                               onPressed: () {
//   //                                 String orderId = snapshot
//   //                                     .data!.data[index].orderid
//   //                                     .toString();
//   //                                 String statusOrderId = "3";
//   //                                 String modifiedBy = "33";
//   //                                 // changeStatusOfTheOrder(context, orderId,
//   //                                 //     statusOrderId, modifiedBy);
//   //                                 alertbox(context,orderId,statusOrderId,modifiedBy);
//   //                               },
//   //                               style: ButtonStyle(
//   //                                 backgroundColor:
//   //                                 const MaterialStatePropertyAll(
//   //                                     Colors.transparent),
//   //                                 shape: MaterialStateProperty.all<
//   //                                     RoundedRectangleBorder>(
//   //                                   RoundedRectangleBorder(
//   //                                       borderRadius:
//   //                                       BorderRadius.circular(5.0),
//   //                                       side: const BorderSide(
//   //                                           color: Color(
//   //                                               0xff69C86D)) // Replace with your desired border color
//   //                                   ),
//   //                                 ),
//   //                               ),
//   //                               child: const Padding(
//   //                                 padding: EdgeInsets.all(8.0),
//   //                                 child: AutoSizeText(
//   //                                   "Completed",
//   //                                   style: TextStyle(fontSize: 20),
//   //                                 ),
//   //                               ),
//   //                             ),
//   //                           ],
//   //                         ),
//   //                         const SizedBox(
//   //                           height: 15,
//   //                         ),
//   //                       ],
//   //                     ),
//   //                   ),
//   //                 );
//   //               });
//   //         }
//   //         return Container();
//   //       });
//   // }

//   // =================================================pending=======================================================

//   // pantryViewOrderPendingList(BuildContext context) {
//   //   return FutureBuilder(
//   //       future: client.pendingOrderForPantry(),
//   //       builder: (context, snapshot) {
//   //         if (snapshot.connectionState == ConnectionState.waiting) {
//   //           return AlertDialog(
//   //             content: Container(
//   //               height: 80.0,
//   //               child: Center(
//   //                 child: CircularProgressIndicator(),
//   //               ),
//   //             ),
//   //           );
//   //         } else if (snapshot.hasError) {
//   //           print(snapshot.error);
//   //         } else if (snapshot.hasData) {
//   //           if (snapshot.data!.data.length == 0) {
//   //             return Text("Please Check Pending Orders");
//   //           } else {
//   //             return ListView.builder(
//   //                 padding: EdgeInsets.only(
//   //                     left: MediaQuery.of(context).size.width * 0.09,
//   //                     right: MediaQuery.of(context).size.width * 0.09),
//   //                 itemCount: snapshot.data!.data.length,
//   //                 itemBuilder: (BuildContext context, int index) {
//   //                   return Padding(
//   //                     padding: const EdgeInsets.only(bottom: 18.0),
//   //                     child: Container(
//   //                       decoration: BoxDecoration(
//   //                         color: index % 2 == 0
//   //                             ? const Color(0XFF424242)
//   //                             : const Color(0XFF5A5858),
//   //                         borderRadius: BorderRadius.circular(5.0),
//   //                       ),
//   //                       child: Column(
//   //                         children: [
//   //                           const SizedBox(
//   //                             height: 15,
//   //                           ),
//   //                           Row(
//   //                             children: [
//   //                               Expanded(
//   //                                 child: Container(
//   //                                   // color:Colors.blue,
//   //                                   child: Column(
//   //                                     children: [
//   //                                       Row(
//   //                                         mainAxisAlignment:
//   //                                         MainAxisAlignment.spaceBetween,
//   //                                         children: [
//   //                                           Expanded(
//   //                                               child: SizedBox(
//   //                                                   child: Text(
//   //                                                     DateFormat('HH:mm').format(
//   //                                                         snapshot.data!.data[index]
//   //                                                             .createdAt) ?? "",
//   //                                                     textAlign: TextAlign.center,
//   //                                                   ))),
//   //                                           Expanded(
//   //                                               child: SizedBox(
//   //                                                   child: Text(
//   //                                                     snapshot
//   //                                                         .data!.data[index].officename  ?? "",
//   //                                                     textAlign: TextAlign.left,
//   //                                                   ))),
//   //                                         ],
//   //                                       ),
//   //                                       const SizedBox(
//   //                                         height: 5,
//   //                                       ),
//   //                                       Row(
//   //                                         mainAxisAlignment:
//   //                                         MainAxisAlignment.spaceAround,
//   //                                         children: [
//   //                                           Expanded(
//   //                                               child: SizedBox(
//   //                                                   child: Text(
//   //                                                     DateFormat('dd-MM-yyyy').format(
//   //                                                         snapshot.data!.data[index]
//   //                                                             .createdAt)  ?? "",
//   //                                                     textAlign: TextAlign.center,
//   //                                                   ))),
//   //                                           Expanded(
//   //                                               child: SizedBox(
//   //                                                   child: Text(
//   //                                                     "np${snapshot.data!.data[index].orderid  ?? ""}",
//   //                                                     textAlign: TextAlign.center,
//   //                                                   ))),
//   //                                         ],
//   //                                       ),
//   //                                       Align(
//   //                                           alignment: Alignment.topLeft,
//   //                                           child: Row(
//   //                                             children: const [
//   //                                               SizedBox(
//   //                                                 width: 20,
//   //                                               ),
//   //                                               Text("Notes:"),
//   //                                             ],
//   //                                           )),
//   //                                       Align(
//   //                                         alignment:
//   //                                         FractionalOffset.bottomLeft,
//   //                                         child: Row(
//   //                                           children: [
//   //                                             const SizedBox(
//   //                                               width: 20,
//   //                                             ),
//   //                                             Container(
//   //                                                 height: 52,
//   //                                                 decoration: BoxDecoration(
//   //                                                   borderRadius:
//   //                                                   BorderRadius.circular(
//   //                                                       5.0),
//   //                                                   color: Colors.white,
//   //                                                 ),
//   //                                                 width: MediaQuery.of(context)
//   //                                                     .size
//   //                                                     .width *
//   //                                                     0.3,
//   //                                                 child: Padding(
//   //                                                   padding:
//   //                                                   const EdgeInsets.only(
//   //                                                       top: 8.0,
//   //                                                       bottom: 8,
//   //                                                       left: 18),
//   //                                                   child: Text(
//   //                                                     snapshot.data!.data[index]
//   //                                                         .remark  ?? "",
//   //                                                     style: const TextStyle(
//   //                                                         color: Colors.black),
//   //                                                   ),
//   //                                                 )),
//   //                                           ],
//   //                                         ),
//   //                                       )
//   //                                     ],
//   //                                   ),
//   //                                 ),
//   //                               ),
//   //                               Expanded(
//   //                                 child: SizedBox(
//   //                                   // color: Colors.green,
//   //                                   height: 107,
//   //                                   width: 100,
//   //                                   child: Column(
//   //                                     children: [
//   //                                       Expanded(
//   //                                         child: ListView.builder(
//   //                                             itemCount: snapshot
//   //                                                 .data
//   //                                                 ?.data[index]
//   //                                                 .orderdetails
//   //                                                 .length,
//   //                                             itemBuilder:
//   //                                                 (BuildContext context,
//   //                                                 int index) {
//   //                                               return Column(
//   //                                                 children: [
//   //                                                   Row(
//   //                                                     mainAxisAlignment:
//   //                                                     MainAxisAlignment
//   //                                                         .spaceAround,
//   //                                                     children: [
//   //                                                       Expanded(
//   //                                                           child: SizedBox(
//   //                                                               child: Text(
//   //                                                                 snapshot
//   //                                                                     .data
//   //                                                                     ?.data
//   //                                                                     .first
//   //                                                                     .orderdetails[
//   //                                                                 index]
//   //                                                                     .categoryname
//   //                                                                     .name ??
//   //                                                                     "",
//   //                                                                 textAlign:
//   //                                                                 TextAlign.start,
//   //                                                               ))),
//   //                                                       Expanded(
//   //                                                           child: SizedBox(
//   //                                                               child: Text(
//   //                                                                 snapshot
//   //                                                                     .data
//   //                                                                     ?.data
//   //                                                                     .first
//   //                                                                     .orderdetails[
//   //                                                                 index]
//   //                                                                     .itemname
//   //                                                                     .name
//   //                                                                     .toString() ??
//   //                                                                     "",
//   //                                                                 textAlign:
//   //                                                                 TextAlign.start,
//   //                                                               ))),
//   //                                                       Expanded(
//   //                                                           child: SizedBox(
//   //                                                               child: Text(
//   //                                                                 "x${snapshot.data?.data.first.orderdetails[index].qty.toString() ?? ""}",
//   //                                                                 textAlign:
//   //                                                                 TextAlign.center,
//   //                                                               ))),
//   //                                                     ],
//   //                                                   ),
//   //                                                   const SizedBox(
//   //                                                     height: 5,
//   //                                                   )
//   //                                                 ],
//   //                                               );
//   //                                             }),
//   //                                       )
//   //                                     ],
//   //                                   ),
//   //                                 ),
//   //                               )
//   //                             ],
//   //                           ),
//   //                           const SizedBox(
//   //                             height: 20,
//   //                           ),
//   //                           Row(
//   //                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //                             children: [
//   //                               ElevatedButton(
//   //                                 onPressed: () {
//   //                                   String orderId = snapshot
//   //                                       .data!.data[index].orderid
//   //                                       .toString()  ?? "" ;
//   //                                   String statusOrderId = "4";
//   //                                   String modifiedBy = "33";
//   //                                   // changeStatusOfTheOrder(
//   //                                   //     context, orderId, statusOrderId,
//   //                                   //     modifiedBy);
//   //                                   alertbox(context, orderId, statusOrderId,
//   //                                       modifiedBy);
//   //                                 },
//   //                                 style: ButtonStyle(
//   //                                   backgroundColor:
//   //                                   const MaterialStatePropertyAll(
//   //                                       Color(0xff303030)),
//   //                                   shape: MaterialStateProperty.all<
//   //                                       RoundedRectangleBorder>(
//   //                                     RoundedRectangleBorder(
//   //                                         borderRadius:
//   //                                         BorderRadius.circular(5.0),
//   //                                         side: const BorderSide(
//   //                                             color: Color(
//   //                                                 0xffE97979)) // Replace with your desired border color
//   //                                     ),
//   //                                   ),
//   //                                 ),
//   //                                 child: const Padding(
//   //                                   padding: EdgeInsets.all(8.0),
//   //                                   child: AutoSizeText(
//   //                                     "Cancel",
//   //                                     style: TextStyle(fontSize: 20),
//   //                                   ),
//   //                                 ),
//   //                               ),
//   //                               ElevatedButton(
//   //                                 onPressed: () {
//   //                                   String orderId = snapshot
//   //                                       .data!.data[index].orderid
//   //                                       .toString();
//   //                                   String statusOrderId = "2";
//   //                                   String modifiedBy = "33";
//   //                                   alertbox(context, orderId, statusOrderId,
//   //                                       modifiedBy);
//   //                                 },
//   //                                 style: ButtonStyle(
//   //                                   backgroundColor:
//   //                                   const MaterialStatePropertyAll(
//   //                                       Colors.transparent),
//   //                                   shape: MaterialStateProperty.all<
//   //                                       RoundedRectangleBorder>(
//   //                                     RoundedRectangleBorder(
//   //                                         borderRadius:
//   //                                         BorderRadius.circular(5.0),
//   //                                         side: const BorderSide(
//   //                                             color: Color(
//   //                                                 0xff69C86D)) // Replace with your desired border color
//   //                                     ),
//   //                                   ),
//   //                                 ),
//   //                                 child: const Padding(
//   //                                   padding: EdgeInsets.all(8.0),
//   //                                   child: AutoSizeText(
//   //                                     "Accept",
//   //                                     style: TextStyle(fontSize: 20),
//   //                                   ),
//   //                                 ),
//   //                               ),
//   //                             ],
//   //                           ),
//   //                           const SizedBox(
//   //                             height: 15,
//   //                           ),
//   //                         ],
//   //                       ),
//   //                     ),
//   //                   );
//   //                 });
//   //           }
//   //         }
//   //         return Container();
//   //       });
//   // }

//   // ===================================================================change orderstatus=====================

//   alertbox(context, orderId, statusOrderId, modifiedBy) {
//     return  showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('AlertDialog Title'),
//           content:  SingleChildScrollView(
//               child: FutureBuilder(
//                   future: client.changeOrderStatus(orderId, statusOrderId, modifiedBy),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       print("running");
//                       return const Center(child: CircularProgressIndicator());
//                     } else if (snapshot.hasError) {
//                       print(snapshot.error);
//                     } else if (snapshot.hasData) {
//                       if (snapshot.data!.messagecode == "1001") {
//                         WidgetsBinding.instance!.addPostFrameCallback((_) {
//                           setState(() {});
//                           Navigator.pop(context);
//                         });
//                       }
//                     }
//                     return Container();
//                   })
//           ),
//         );
//       },
//     );
//   }

// }

// // pantryViewOrderList(BuildContext context,catGory,catItem,itemQuantity){
// //   return ListView.builder(
// //       padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03,right: MediaQuery.of(context).size.width*0.03),
// //       itemCount: 3,
// //       itemBuilder: (BuildContext context, int index){
// //         return Padding(
// //           padding: const EdgeInsets.only(bottom: 18.0),
// //           child: Container(
// //             decoration: BoxDecoration(
// //               color: index%2==0? const Color(0XFF424242):const Color(0XFF5A5858),
// //               borderRadius: BorderRadius.circular(5.0),
// //             ),
// //             child: Column(
// //               children: [
// //                 const SizedBox(height: 15,),
// //                 Row(
// //                   children: [
// //                     Expanded(
// //                       child: Column(
// //                         children: [
// //                           Row(
// //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                             children: const [
// //                               Expanded(child: SizedBox(child: Text("09:00 AM",textAlign: TextAlign.center,))),
// //                               Expanded(child: SizedBox(child: Text("123",textAlign: TextAlign.center,))),
// //                             ],
// //                           ),
// //                           const SizedBox(height: 5,),
// //                           Row(
// //                             mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                             children: const [
// //                               Expanded(child: SizedBox(child: Text("03-03-23",textAlign: TextAlign.center,))),
// //                               Expanded(child: SizedBox(child: Text("123",textAlign: TextAlign.center,))),
// //                             ],
// //                           ),
// //                           const SizedBox(height:10 ,),
// //                           Align(
// //                               alignment: Alignment.topLeft,
// //                               child: Row(
// //                                 children: const [
// //                                   SizedBox(width: 20,),
// //                                   Text("Notes:"),
// //                                 ],
// //                               )),
// //                           Align(
// //                             alignment: FractionalOffset.bottomLeft,
// //                             child: Row(
// //                               children: [
// //                                 const SizedBox(width: 20,),
// //                                 Container(
// //                                     height:60,
// //                                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0),color: Colors.white, ),
// //                                     width:MediaQuery.of(context).size.width*0.4,
// //                                     child: const Padding(
// //                                       padding: EdgeInsets.only(top: 8.0,bottom: 8,left: 18),
// //                                       child: SingleChildScrollView(
// //                                           scrollDirection: Axis.vertical,
// //                                           child: Text("No sugar in coffee",style: TextStyle(color: Colors.black),)),
// //                                     )),
// //                               ],
// //                             ),
// //                           )
// //                         ],
// //                       ),
// //                     ),
// //                     Expanded(
// //                       child: Container(
// //                         // color: Colors.green,
// //                         height:107,
// //                         width:100,
// //                         child: Column(
// //                           children: [
// //                             Expanded(
// //                               child: ListView.builder( itemCount: 3,
// //                                   itemBuilder: (BuildContext context, int index){
// //                                     return Column(
// //                                       children: [
// //                                         Row(
// //                                           mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                                           children: [
// //                                             Expanded(child: SizedBox(child: AutoSizeText(catGory[index],textAlign: TextAlign.start,maxLines: 1,))),
// //                                             Expanded(child: SizedBox(child: AutoSizeText(catItem[index],textAlign: TextAlign.start,maxLines: 1,))),
// //                                             Expanded(child: SizedBox(child: AutoSizeText("x ${itemQuantity[index]}",textAlign: TextAlign.center,maxLines: 1,))),
// //                                           ],
// //                                         ),
// //                                         const SizedBox(height: 5,)
// //                                       ],
// //                                     );
// //                                   }),
// //                             )
// //                           ],
// //                         ),
// //                       ),
// //                     )
// //                   ],
// //                 ),
// //                 const SizedBox(height: 20,),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                   children: [
// //                     ElevatedButton(
// //                       onPressed: () {
// //
// //                       },
// //                       child: const Padding(
// //                         padding: EdgeInsets.all(8.0),
// //                         child: AutoSizeText("Cancel",style: TextStyle(fontSize: 20),),
// //                       ),
// //                       style: ButtonStyle(
// //                         backgroundColor:
// //                         const MaterialStatePropertyAll(Color(0xff303030)),
// //                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
// //                           RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(5.0),
// //                               side: const BorderSide(color: Color(0xffE97979)) // Replace with your desired border color
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     ElevatedButton(
// //                       onPressed: () {
// //                       },
// //                       child: const Padding(
// //                         padding: EdgeInsets.all(8.0),
// //                         child: AutoSizeText("Completed",style: TextStyle(fontSize: 20),),
// //                       ),
// //                       style: ButtonStyle(
// //                         backgroundColor:
// //                         const MaterialStatePropertyAll(Colors.transparent),
// //                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
// //                           RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(5.0),
// //                               side: const BorderSide(color: Color(0xff69C86D)) // Replace with your desired border color
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 15,),
// //               ],
// //             ),
// //           ),
// //         );
// //       });
// // }

//   // pantryViewOrderPendingList(BuildContext context,catGory,catItem,itemQuantity){
//   //   return ListView.builder(
//   //       padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03,right: MediaQuery.of(context).size.width*0.03),
//   //       itemCount: 3,
//   //       itemBuilder: (BuildContext context, int index){
//   //         return Padding(
//   //           padding: const EdgeInsets.only(bottom: 18.0),
//   //           child: Container(
//   //             decoration: BoxDecoration(
//   //               color: index%2==0? const Color(0XFF424242):const Color(0XFF5A5858),
//   //               borderRadius: BorderRadius.circular(5.0),
//   //             ),
//   //             child: Column(
//   //               children: [
//   //                 const SizedBox(height: 15,),
//   //                 Row(
//   //                   children: [
//   //                     Expanded(
//   //                       child: Container(
//   //                         // color:Colors.blue,
//   //                         child: Column(
//   //                           children: [
//   //                             Row(
//   //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //                               children: const [
//   //                                 Expanded(child: SizedBox(child: Text("09:00 AM",textAlign: TextAlign.center,))),
//   //                                 Expanded(child: SizedBox(child: Text("123",textAlign: TextAlign.center,))),
//   //                               ],
//   //                             ),
//   //                             const SizedBox(height: 5,),
//   //                             Row(
//   //                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //                               children: const [
//   //                                 Expanded(child: SizedBox(child: Text("03-03-23",textAlign: TextAlign.center,))),
//   //                                 Expanded(child: SizedBox(child: Text("123",textAlign: TextAlign.center,))),
//   //                               ],
//   //                             ),
//   //                             const SizedBox(height:10 ,),
//   //                             Align(
//   //                                 alignment: Alignment.topLeft,
//   //                                 child: Row(
//   //                                   children: const [
//   //                                     SizedBox(width: 20,),
//   //                                     Text("Notes:"),
//   //                                   ],
//   //                                 )),
//   //                             Align(
//   //                               alignment: FractionalOffset.bottomLeft,
//   //                               child: Row(
//   //                                 children: [
//   //                                   const SizedBox(width: 20,),
//   //                                   Container(
//   //                                       height:60,
//   //                                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0),color: Colors.white, ),
//   //                                       width:MediaQuery.of(context).size.width*0.4,
//   //                                       child: const Padding(
//   //                                         padding: EdgeInsets.only(top: 8.0,bottom: 8,left: 18),
//   //                                         child: SingleChildScrollView(
//   //                                             scrollDirection: Axis.vertical,
//   //                                             child: Text("No sugar in coffee",style: TextStyle(color: Colors.black),)),
//   //                                       )),
//   //                                 ],
//   //                               ),
//   //                             )
//   //                           ],
//   //                         ),
//   //                       ),
//   //                     ),
//   //                     Expanded(
//   //                       child: Container(
//   //                         // color: Colors.green,
//   //                         height:107,
//   //                         width:100,
//   //                         child: Column(
//   //                           children: [
//   //                             Expanded(
//   //                               child: ListView.builder( itemCount: 3,
//   //                                   itemBuilder: (BuildContext context, int index){
//   //                                     return Column(
//   //                                       children: [
//   //                                         Row(
//   //                                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //                                           children: [
//   //                                             Expanded(child: SizedBox(child: AutoSizeText(catGory[index],textAlign: TextAlign.start,maxLines: 1,))),
//   //                                             Expanded(child: SizedBox(child: AutoSizeText(catItem[index],textAlign: TextAlign.start,maxLines: 1,))),
//   //                                             Expanded(child: SizedBox(child: AutoSizeText("x ${itemQuantity[index]}",textAlign: TextAlign.center,maxLines: 1,))),
//   //                                           ],
//   //                                         ),
//   //                                         const SizedBox(height: 5,)
//   //                                       ],
//   //                                     );
//   //                                   }),
//   //                             )
//   //                           ],
//   //                         ),
//   //                       ),
//   //                     )
//   //                   ],
//   //                 ),
//   //                 const SizedBox(height: 20,),
//   //                 Row(
//   //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //                   children: [
//   //                     ElevatedButton(
//   //                       onPressed: () {
//   //
//   //                       },
//   //                       child: const Padding(
//   //                         padding: EdgeInsets.all(8.0),
//   //                         child: AutoSizeText("Cancel",style: TextStyle(fontSize: 20),),
//   //                       ),
//   //                       style: ButtonStyle(
//   //                         backgroundColor:
//   //                         const MaterialStatePropertyAll(Color(0xff303030)),
//   //                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//   //                           RoundedRectangleBorder(
//   //                               borderRadius: BorderRadius.circular(5.0),
//   //                               side: const BorderSide(color: Color(0xffE97979)) // Replace with your desired border color
//   //                           ),
//   //                         ),
//   //                       ),
//   //                     ),
//   //                     ElevatedButton(
//   //                       onPressed: () {
//   //                       },
//   //                       child: const Padding(
//   //                         padding: EdgeInsets.all(8.0),
//   //                         child: AutoSizeText("Accept",style: TextStyle(fontSize: 20),),
//   //                       ),
//   //                       style: ButtonStyle(
//   //                         backgroundColor:
//   //                         const MaterialStatePropertyAll(Colors.transparent),
//   //                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//   //                           RoundedRectangleBorder(
//   //                               borderRadius: BorderRadius.circular(5.0),
//   //                               side: const BorderSide(color: Color(0xff69C86D)) // Replace with your desired border color
//   //                           ),
//   //                         ),
//   //                       ),
//   //                     ),
//   //                   ],
//   //                 ),
//   //                 const SizedBox(height: 15,),
//   //               ],
//   //             ),
//   //           ),
//   //         );
//   //       });
//   // }