import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  List<RadioModel> radioList = List<RadioModel>();

  @override
  void initState() {
    super.initState();
    radioList
        .add(RadioModel(isSelected: false, buttonText: "1", text: "Mounth"));
    radioList
        .add(RadioModel(isSelected: false, buttonText: "2", text: "Mounth"));
    radioList
        .add(RadioModel(isSelected: false, buttonText: "3", text: "Mounth"));
    radioList
        .add(RadioModel(isSelected: false, buttonText: "6", text: "Mounth"));
    radioList.add(RadioModel(isSelected: false, buttonText: "1", text: "Year"));
    radioList
        .add(RadioModel(isSelected: false, buttonText: "0", text: "Life time"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Page",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: radioList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            highlightColor: Color.fromARGB(255, 77, 255, 255),
            splashColor: Colors.blueAccent,
            onTap: () {
              setState(() {
                radioList.forEach((element) => element.isSelected = false);
                radioList[index].isSelected = true;
              });
            },
            child: RadioCustomButton(radioList[index]),
          );
        },
      ),
    );
  }
}

class RadioCustomButton extends StatelessWidget {
  final RadioModel _item;
  RadioCustomButton(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 50.0,
            width: 50.0,
            child: Center(
              child: Text(
                _item.buttonText,
                style: TextStyle(
                  color: _item.isSelected ? Colors.white : Colors.black,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: _item.isSelected ? Color.fromARGB(255, 77, 255, 255) : Colors.transparent,
              border: Border.all(
                width: 1.0,
                color: _item.isSelected ? Colors.black : Colors.grey,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text(
              _item.text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String text;

  RadioModel({this.buttonText, this.isSelected, this.text});
}
