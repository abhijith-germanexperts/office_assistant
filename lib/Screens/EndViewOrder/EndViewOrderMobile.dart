import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class EndViewOrderMobile extends StatelessWidget {
  const EndViewOrderMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List test=[1,2,3,4,5,6,7];
    List pantryItems = [
      "Espresso",
      "Cappuccino",
      "Americano",
      "Cappuccino with chocolate",
      "Hot Chocolate",
      "Mochaccino",
      "Cardomom tea",
      "Espresso Macchiato",
    ];
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black87,
          // backgroundColor: Colors.white,
          // appBar: AppBar(
          //   title: Text('image/end user directory banner.jpg'),
          // ),
          body: Column(
            children: [
              Container(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                        AssetImage("image/end user pantry banner darkened.jpg"),
                        fit: BoxFit.fill,
                      )),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.05,
                              // color: Colors.red,
                              child: Image(
                                  image: AssetImage(
                                      "image/GE office assistant white.png"))),
                          Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.03),
                            child: Icon(
                              Icons.menu,
                              color: Colors.white,
                              size:
                              MediaQuery.of(context).size.shortestSide * 0.04,
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .15,
                        // color: Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                // color: Colors.yellow,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      "Pantry Service",
                                      style: GoogleFonts.inriaSerif(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40,
                                          color: Colors.white),
                                      minFontSize: 5,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.006,
              ),
              Container(
                // color: Colors.yellow,
                height: MediaQuery.of(context).size.height * 0.04,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 1,),
                    Align(
                      alignment: Alignment.topCenter,
                      child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_rounded,color: Colors.white,)),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Spacer(),
                    AutoSizeText("View Orders",style: TextStyle(color: Colors.white,fontSize: 20),),
                    Spacer(flex: 1,),
                    SizedBox(width: 20,)

                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.0268,right: MediaQuery.of(context).size.width*0.0268,),
                  child: ListView.builder(
                      itemCount: test.last,
                      itemBuilder: (cntxt,index){
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.15,
                            decoration: BoxDecoration(
                              color: Color(0xff3E3E3E),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // width: MediaQuery.of(context).size.width*0.05,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Image(image: AssetImage("image/20002124-d-classic_collection_espresso-cup-expressod.png")),
                                  Expanded(child: AutoSizeText(pantryItems[index],style: TextStyle(color: Colors.white),)),
                                  const Spacer(),
                                  Row(children: [
                                    InkWell(
                                        onTap: () {
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.055,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white, // Replace with your desired border color
                                            width: 2, // Replace with your desired border width
                                          ),
                                        ),
                                        child: CircleAvatar(
                                          radius: MediaQuery.of(context).size.width*0.04,
                                          backgroundColor: Colors.transparent,
                                          child: AutoSizeText(test[index].toString(),style: TextStyle(color: Colors.white),),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {

                                        },
                                        child: Icon(
                                          Icons.add,
                                          opticalSize: 48,
                                          weight: 200,
                                          color: Colors.white,
                                          size: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.055,
                                        )),
                                  ],),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(Icons.close,color: Colors.white,size: MediaQuery.of(context).size.width*0.05,))
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.01,
              // ),
              // Spacer(),
              const SizedBox(height: 5,),
              SizedBox(
                child:  Container(
                    height: MediaQuery.of(context).size.height*0.05,
                    width: MediaQuery.of(context).size.width*0.95,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border:  InputBorder.none,
                          hintText: "Add Note....",
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          focusColor: Colors.white
                      ),
                    )),),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child:  const CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.transparent,
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Image(image: AssetImage("image/iconmonstr-headphones-4.png")),
                          ),
                        ),
                      ),
                      SizedBox(
                        // height: MediaQuery.of(context).size.width,
                        child: const AutoSizeText(
                          "Need Assistance?",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),

                  Spacer(),
                  Container(
                    height: MediaQuery.of(context).size.height*0.05,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context, MaterialPageRoute(builder: (context) => const EndViewOrderBasePage()));
                      },
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.white)),
                      child: const Text(
                        "Place Order",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                ],
              ),
// Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Align(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      "Copyright 2023 © German Experts. All Rights Reserved",
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(color: Color(0xffFFFFFF)),
                      ),
                      maxLines: 1,
                      minFontSize: 2,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
