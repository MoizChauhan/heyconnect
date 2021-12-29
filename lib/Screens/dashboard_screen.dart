import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_ui/Model/countModel.dart';
import 'package:login_ui/utils/color.dart';
import 'package:login_ui/utils/images.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int curindex = 0;
  List<String> tabList = ["Information", "People", "Timeline", "Resources", "Project ideas"];
  List<CountModel> countList = [
    CountModel(name: "Members", icon: Icons.people_alt_outlined, count: "5"),
    CountModel(name: "Activity", icon: Icons.bar_chart, count: "-"),
    CountModel(name: "Score", icon: Icons.speed, count: "0"),
    CountModel(name: "Contributors", icon: Icons.work_outline_outlined, count: "0"),
    CountModel(name: "Risk Factors", icon: Icons.pie_chart_outline, count: "100%"),
    CountModel(name: "Budget", icon: Icons.account_balance_wallet_outlined, count: "-"),
    CountModel(name: "Resources", icon: Icons.monetization_on_outlined, count: "-"),
    CountModel(name: "Posting", icon: Icons.question_answer_outlined, count: "-"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        child: Stack(
          children: <Widget>[
            backContainer(
              v: 0.0,
              h: 0.0,
              child: FadeInImage.assetNetwork(
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    Images.BACKGROUND,
                    fit: BoxFit.cover,
                    height: Get.height * 0.27,
                    width: Get.width,
                    // height: Get.height * 0.129,
                    // width: Get.width * 0.33,
                  );
                },
                placeholder: Images.BACKGROUND,
                image:
                    "https://static3.depositphotos.com/1000528/109/i/600/depositphotos_1093454-stock-photo-assorted-nuts-almonds-filberts-walnut.jpg",
                fit: BoxFit.fitWidth,
                // width: 60.0,
                height: Get.height * 0.27,
                width: Get.width,
                // height: 60.0,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: Get.height * 0.27,
                  ),
                  SizedBox(height: 6),
                  descContainer(),
                  SizedBox(height: 6),
                  AnimatedSwitcher(
                    duration: Duration(seconds: 1),
                    child: [
                      infoDailog(),
                      emptyContainer(),
                      emptyContainer(),
                      emptyContainer(),
                      emptyContainer(),
                      emptyContainer(),
                      emptyContainer(),
                      emptyContainer(),
                    ][curindex],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  emptyContainer() {
    return backContainer(
        child: Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Center(
        child: Text("Coming Soon...."),
      ),
    ));
  }

  Widget infoDailog() {
    return Column(
      children: [
        startEndWidget(),
        SizedBox(height: 6),
        countWidget(),
        SizedBox(height: 6),
        descriptionWidget(),
      ],
    );
  }

  Widget backContainer({child, double? v, double? h}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: v != null ? v : 10, horizontal: h != null ? h : 20),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: child,
    );
  }

  Widget descContainer() {
    return backContainer(
      child: Column(
        children: [
          SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 5),
              CircleAvatar(
                backgroundColor: backgroundColor,
                child: Icon(
                  Icons.lightbulb_outline,
                  color: Colors.purpleAccent,
                ),
              ),
              SizedBox(width: 15),
              itemWidget(),
              Spacer(),
              joinButton(),
            ],
          ),
          SizedBox(height: 20),
          listViewTab(),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget startEndWidget() {
    return backContainer(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 15,
                  ),
                  Expanded(
                      child: Divider(
                    color: Colors.blue,
                    thickness: 1.5,
                  )),
                  CircleAvatar(
                    radius: 15,
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Start",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    Text(
                      "02-Sep-2020",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      "End",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    Text(
                      "09-Sep-2020",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      v: 20,
    );
  }

  Widget descriptionWidget() {
    return backContainer(
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.11,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Description",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 25),
            ),
            SizedBox(height: 5),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 18),
            ),
          ],
        ),
      ),
      v: 10,
    );
  }

  Widget countWidget() {
    return backContainer(
      child: Container(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: countList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
                child: Column(
              children: <Widget>[
                Icon(
                  countList[index].icon,
                  color: Colors.blue,
                  size: 30,
                ),
                SizedBox(height: 2),
                Text(
                  "${countList[index].name}",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                SizedBox(height: 1),
                Text(
                  "${countList[index].count}",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
                ),
              ],
            ));
          },
        ),
      ),
      v: 0,
    );
  }

  Widget listViewTab() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.04,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: tabList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  curindex = index;
                });
              },
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: index == curindex ? tabColor : Colors.white,
                ),
                duration: Duration(seconds: 1),
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                    "${tabList[index]}",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget joinButton() {
    return Container(
      alignment: Alignment.topRight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Text(
          "Join",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }

  Widget itemWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Nuts in Armenia",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.check_circle, color: Colors.green.shade800),
            SizedBox(width: 5),
            Text(
              "In progress",
              style: TextStyle(color: Colors.green.shade800),
            ),
          ],
        ),
        Text(
          "Public created 02-Sep-2020 12:00 Am",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
