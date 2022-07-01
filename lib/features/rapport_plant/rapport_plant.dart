
import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:happytree/features/connection_setting/connection_setting.dart';
import 'package:happytree/features/menu/menu.dart';
import 'package:happytree/features/rapport_plant/api.dart';
import 'package:happytree/response/planthistoriesresponse.dart';
import 'package:happytree/response/planthistoryresponse.dart';
import 'package:happytree/response/plantresponse.dart';
import 'package:happytree/response/plantsresponse.dart';
import 'package:happytree/util/util.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../components/design/custom_slider.dart';
import '../../components/design/design.dart';
import '../create/create.dart';

class RapportPlant extends StatefulWidget {

  final routeName = '/rapportplant';
  final String plantName;
  final String plantLocation;
  final String plantUserId;
  final String plantId;
  const RapportPlant({Key? key, this.plantName = "",this.plantLocation = "", this.plantUserId ="", this.plantId =""}) : super(key: key);
  const RapportPlant.withName({Key? key, required this.plantName,  required this.plantLocation, required this.plantUserId, required this.plantId}) : super(key: key);

  @override
  RapportPlantState createState() => RapportPlantState();
}

class RapportPlantState extends State<RapportPlant> {


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  String dropdownValue = "Chambre";
  double tempValue = 15.0;
  late PlantsHistoriesResponse response;
  @override
  void initState() {
    super.initState();
  }

  Widget cardElem(child, String title){

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
          children: [
      Padding(padding: EdgeInsets.only(top : 10,left: 10,bottom: 10), child:  Align(child: Text(title, style: TextStyle(color: APPCOLOR, fontSize: 25),textAlign: TextAlign.start), alignment: Alignment.centerLeft),),
            child,
            SizedBox(height: 20,)
    ]),);

  }


  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff72719b),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = Text(
            DateTime.fromMillisecondsSinceEpoch(int.parse(response.histories![0].sample_time!)).day.toString()
                +"/"+
                DateTime.fromMillisecondsSinceEpoch(int.parse(response.histories![0].sample_time!)).month.toString()+" "+
            DateTime.fromMillisecondsSinceEpoch(int.parse(response.histories![0].sample_time!)).hour.toString()
            +":"+
            DateTime.fromMillisecondsSinceEpoch(int.parse(response.histories![0].sample_time!)).minute.toString(),
            style: style);
        break;

      case 6:
        text = Text(
            DateTime.fromMillisecondsSinceEpoch(int.parse(response.histories![2].sample_time!)).day.toString()
                +"/"+
                DateTime.fromMillisecondsSinceEpoch(int.parse(response.histories![2].sample_time!)).month.toString()+" "+
                DateTime.fromMillisecondsSinceEpoch(int.parse(response.histories![2].sample_time!)).hour.toString()
                +":"+
                DateTime.fromMillisecondsSinceEpoch(int.parse(response.histories![2].sample_time!)).minute.toString(),
            style: style);
        break;

      case 10:
        text = Text(
            DateTime.fromMillisecondsSinceEpoch(int.parse(response.histories![4].sample_time!)).day.toString()
                +"/"+
                DateTime.fromMillisecondsSinceEpoch(int.parse(response.histories![4].sample_time!)).month.toString()+" "+
                DateTime.fromMillisecondsSinceEpoch(int.parse(response.histories![4].sample_time!)).hour.toString()
                +":"+
                DateTime.fromMillisecondsSinceEpoch(int.parse(response.histories![4].sample_time!)).minute.toString(),
            style: style);
        break;


      case 14:
        text = Text(
            DateTime.fromMillisecondsSinceEpoch(int.parse(response.histories![6].sample_time!)).day.toString()
                +"/"+
                DateTime.fromMillisecondsSinceEpoch(int.parse(response.histories![6].sample_time!)).month.toString()+" "+
                DateTime.fromMillisecondsSinceEpoch(int.parse(response.histories![6].sample_time!)).hour.toString()
                +":"+
                DateTime.fromMillisecondsSinceEpoch(int.parse(response.histories![6].sample_time!)).minute.toString(),
            style: style);
        break;

      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }
  Widget graph(PlantsHistoriesResponse response){
    // log(data.code.toString());
    return Column(children: [
      Container( width : 400, height : 400, child:  LineChart(
        LineChartData(
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 32,
                  interval: 1,
                  getTitlesWidget: bottomTitleWidgets,
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              leftTitles: AxisTitles(
                  sideTitles:  SideTitles(
                    // getTitlesWidget: leftTitleWidgets,
                    showTitles: false,
                    interval: 1,
                    reservedSize: 40,
                  )
              ),
            ),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(
              show: true,
              border: const Border(
                bottom: BorderSide(color: Color(0xff4e4965), width: 4),
                left: BorderSide(color: Colors.transparent),
                right: BorderSide(color: Colors.transparent),
                top: BorderSide(color: Colors.transparent),
              ),
            ),
            lineTouchData: LineTouchData(
              handleBuiltInTouches: true,
              touchTooltipData: LineTouchTooltipData(
                tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
              ),
            ),
            minX: 0,
            maxX: 16,
            maxY: 90,
            minY: 10,
            lineBarsData: <LineChartBarData>[
              LineChartBarData(  isCurved: true,
                color: Colors.redAccent,
                barWidth: 8,
                isStrokeCapRound: true,
                dotData: FlDotData(show: true),
                belowBarData: BarAreaData(show: false),
                spots: [
                  FlSpot(1, double.parse(response.histories![0].device_data!.temperature! )),
                  FlSpot(4, double.parse(response.histories![1].device_data!.temperature! )),
                  FlSpot(6, double.parse(response.histories![2].device_data!.temperature! )),
                  FlSpot(8, double.parse(response.histories![3].device_data!.temperature! )),
                  FlSpot(10, double.parse(response.histories![4].device_data!.temperature! )),
                  FlSpot(12, double.parse(response.histories![5].device_data!.temperature! )),
                  FlSpot(15, double.parse(response.histories![6].device_data!.temperature! )),
                ],),
              LineChartBarData(  isCurved: true,
                color: Colors.blueAccent,
                barWidth: 8,
                isStrokeCapRound: true,
                dotData: FlDotData(show: true),
                belowBarData: BarAreaData(show: false),
                spots: [
                  FlSpot(1, double.parse(response.histories![0].device_data!.humidity! )),
                  FlSpot(4, double.parse(response.histories![1].device_data!.humidity! )),
                  FlSpot(6, double.parse(response.histories![2].device_data!.humidity! )),
                  FlSpot(8, double.parse(response.histories![3].device_data!.humidity! )),
                  FlSpot(10, double.parse(response.histories![4].device_data!.humidity! )),
                  FlSpot(12, double.parse(response.histories![5].device_data!.humidity! )),
                  FlSpot(15, double.parse(response.histories![6].device_data!.humidity! )),
                ],),
              LineChartBarData(
                isCurved: true,
                color:  Colors.yellowAccent,
                barWidth: 8,
                isStrokeCapRound: true,
                dotData: FlDotData(show: true),
                belowBarData: BarAreaData(show: false),
                spots: [
                  FlSpot(1, double.parse(response.histories![0].device_data!.luminosity! )),
                  FlSpot(4, double.parse(response.histories![1].device_data!.luminosity! )),
                  FlSpot(6, double.parse(response.histories![2].device_data!.luminosity! )),
                  FlSpot(8, double.parse(response.histories![3].device_data!.luminosity! )),
                  FlSpot(10, double.parse(response.histories![4].device_data!.luminosity! )),
                  FlSpot(12, double.parse(response.histories![5].device_data!.luminosity! )),
                  FlSpot(15, double.parse(response.histories![6].device_data!.luminosity! )),
                ],),



            ]
          // read about it in the LineChartData section
        ),
        swapAnimationDuration: Duration(milliseconds: 150), // Optional
        swapAnimationCurve: Curves.linear, // Optional
      ),),
    ],);
  }
  Widget content() {
    return FutureBuilder(
      future: getPlantById(widget.plantId),
      builder: (context, AsyncSnapshot<PlantResponse>snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          return  ListView(
            children: [
              Padding(padding: EdgeInsets.only(top: 0, bottom: 40),

                  child: Image.asset("asset/icons/logo-plant.png",width: 600,height: 200,fit: BoxFit.fitHeight)),

              Padding(padding: EdgeInsets.only(top: 0, bottom: 0), child:           Text(widget.plantName, textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),)),

              Padding(padding: EdgeInsets.only(top: 40, bottom: 0), child:     cardElem(
                  FutureBuilder(
                    future: getPlantHistoryById("1") ,
                    builder: (context, AsyncSnapshot<PlantHistoryResponse> snapshot) {
                      // log(snapshot.data?.payload.sample_time ?? "test");
                      return   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(children: [
                            Image.asset("asset/icons/luminosity.png", width: 40, height: 40,),
                            Text(double.parse(snapshot.data?.payload.device_data?.luminosity?? "0").toStringAsFixed(2)+" mmol", style: TextStyle(color: Colors.yellowAccent),)
                          ],),
                          Column(children: [
                            Image.asset("asset/icons/temp.png", width: 40, height: 40,),
                            Text(double.parse(snapshot.data?.payload.device_data?.temperature?? "0").toStringAsFixed(2)+" °C",style: TextStyle(color: Colors.redAccent))

                          ],),
                          Column(children: [
                            Image.asset("asset/icons/humidity.png", width: 40, height: 40,),
                            Text(double.parse(snapshot.data?.payload.device_data?.humidity?? "0").toStringAsFixed(2)+" %",style: TextStyle(color: Colors.blueAccent))

                          ],)
                        ],
                      );

                    },
                  )
                  ,"Etat actuel")),
              // Padding(padding: EdgeInsets.only(top: 40, bottom: 0), child:     cardElem(
              //    ,
              //     "Historique")),
              FutureBuilder(
                future: getPlantHistoriesById("1"),
                builder: (context, AsyncSnapshot<PlantsHistoriesResponse> snapshop2) {
                  if(snapshop2.connectionState == ConnectionState.done){
                    response = snapshop2.data!;

                    // setState(() {
                    //
                    // });
                    return graph(snapshop2.data!);
                  }
                  else{
                    return Center(child: CircularProgressIndicator(color: APPCOLOR,));
                  }

                },
              ),

              Padding(padding: EdgeInsets.only(top: 40, bottom: 0), child:     cardElem(
                  ListTile(leading: Container(child: Icon(Icons.wb_sunny)), title: Text(snapshot.data?.payload.luminosite ?? ""), subtitle: Text("Luminosité idéale"),),
                  "Luminosité")),

              Padding(padding: EdgeInsets.only(top: 40, bottom: 0),
                  child:     cardElem(
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(children: [
                            Image.asset("asset/icons/hot-temp.png", width: 40, height: 40,),
                            Text(snapshot.data!.payload.max_temp!.toString() + " °C")
                          ],),
                          Column(children: [
                            Image.asset("asset/icons/cold-temp.png", width: 40, height: 40,),
                            Text(snapshot.data!.payload.min_temp!.toString() + " °C")

                          ],)
                        ],
                      ),
                      "Température idéale")),


              // Padding(padding: EdgeInsets.only(top: 40, bottom: 0), child:     cardElem(
              //     ListTile(leading: Container(child: Image.asset("asset/icons/degree.png",width: 40, height: 40,)), title: Text("5°C"), subtitle: Text("Température de survie la plus faible en pot"),),
              //     "Zone de rusticité")),

              Padding(padding: EdgeInsets.only(top: 40, bottom: 10),
                  child:     cardElem(
                      Padding(padding: EdgeInsets.only(left: 10,right: 10),
                        child:   Column(

                          children:  [
                            // Padding(padding: EdgeInsets.only(top: 10, bottom: 10), child: Align(child: Text("Intérieur"),alignment: Alignment.centerLeft,),),

                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text("Jan"),Text("Jui"),Text("Dec"),],),
                            // ElevatedButton(
                            //
                            //     style: BaseButtonRoundedColorBorder(600, 30, APPCOLOR3, 25.0),
                            //     onPressed: ()  {
                            //
                            //     }, child: Text("Année compl.", style: TextStyle(color: Colors.black),)),
                            // Padding(padding: EdgeInsets.only(top: 10, bottom: 10), child: Align(child: Text("Extérieur"),alignment: Alignment.centerLeft,),),
                            // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text("Jan"),Text("Jui"),Text("Dec"),],),
                            SfSliderTheme(
                              data:  SfSliderThemeData(
                                activeDividerColor: Colors.red,
                                activeDividerStrokeColor: Colors.red,
                                activeDividerStrokeWidth: 1,
                                activeDividerRadius: 6,
                                activeTrackColor: Colors.transparent,

                                disabledActiveDividerColor: Colors.red,
                                inactiveDividerColor: Colors.red,
                                inactiveDividerStrokeColor: Colors.red,
                                inactiveDividerStrokeWidth: 1,
                                inactiveDividerRadius: 6,
                                inactiveTrackColor: Colors.transparent,
                                thumbColor: Colors.transparent,
                                thumbRadius: 50,
                                overlayRadius: 0,


                              ),
                              child : SfSlider(
                                // enableTooltip: true,
                                  showDividers: true,


                                  // thumbShape: SfThumbShapeCustom(),
                                  thumbIcon: Align( child : Container( width: 250, height : 30,decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: APPCOLOR3),child : Center(child: Text(snapshot.data?.payload.periode??"",style :TextStyle(color:  Colors.black),textAlign: TextAlign.center,)))),
                                  // dividerShape:  DividerShapeCustom(),
                                  // activeColor: Colors.red,
                                  value: 15,
                                  onChanged: (value){
                                  }, interval: 5, min : 0, max : 30),
                            ),



                          ],
                        ),),
                      "Période adaptées")),
              ElevatedButton(

                  style: BaseButtonRoundedColorBorder(200, 50, Colors.pink, 25.0),
                  onPressed: ()  async {

                    final result = await killPlantById(widget.plantUserId);
                    if(result.code == SUCCESS_CODE){
                      navigateWithNamePop(context, Menu().routeName);
                      showSnackBar(context, "Plante tuée");
                    }
                    else{
                      showSnackBar(context, "Une erreur est survenue");

                    }

                  }, child: Text("Plante Morte", style: TextStyle(fontSize: 20),)),


            ],);
        }
        else{
          return Center(child: CircularProgressIndicator(color: APPCOLOR,));
        }
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(),

        body: Center(
            child: content()
        )
    );
  }
}
