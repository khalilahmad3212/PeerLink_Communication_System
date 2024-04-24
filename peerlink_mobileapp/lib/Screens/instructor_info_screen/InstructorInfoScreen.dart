import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peerlink_mobileapp/res/colors/app_color.dart';

class InstructorInfoScreen extends StatefulWidget {
  const InstructorInfoScreen({super.key});

  static const String screen_id = 'InstructorInfoScreen';

  @override
  State<InstructorInfoScreen> createState() => _InstructorInfoScreenState();
}

class _InstructorInfoScreenState extends State<InstructorInfoScreen> {
  List<ConsultationDetailsModel> consultationsList = [];

  @override
  Widget build(BuildContext context) {
    // ConsultationDetailsModel consultations = ConsultationDetailsModel(time: '10:00 to 11.30', office: 'Room#203 AB1');
    // consultationsList.add(consultations);

    consultationsList.add(ConsultationDetailsModel(
        time: '10:00 to 11.30', office: 'Room#203 AB1'));
    consultationsList.add(
        ConsultationDetailsModel(time: '2:00 to 3:00', office: 'Room#503 AB3'));
    consultationsList.add(
        ConsultationDetailsModel(time: '4:00 to 5:00', office: 'Room#502 AB4'));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.3),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InstructorInfoCard(
              id: '023-19-1234',
              designation: 'Instructor',
              department: 'Computer Science',
            ),
            // ConsultationHoursCard(),
            ConsultationHoursCard(consultationsList: consultationsList),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class ConsultationHoursCard extends StatelessWidget {
  // const ConsultationHoursCard({
  //   super.key,
  // });

  final List<ConsultationDetailsModel> consultationsList;

  const ConsultationHoursCard({Key? key, required this.consultationsList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        padding: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 30),
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(
          color: AppColor.appbarColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            AppColor.cardShadow,
          ],
        ),
        child: DefaultTextStyle(
          style: TextStyle(
            color: AppColor.secondaryColor,
            fontSize: 24,
            fontWeight: FontWeight.w400,
            fontFamily: 'Itim',
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'CONSULTANT HOURS',
                  style: TextStyle(
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                // itemCount: 3,
                itemCount: consultationsList.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(consultationsList[index].time),
                      Text(consultationsList[index].office),
                      Icon(
                        Icons.send_rounded,
                        color: AppColor.primaryColor,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InstructorInfoCard extends StatelessWidget {
  final String id, designation, department;

  const InstructorInfoCard(
      {Key? key,
      required this.id,
      required this.designation,
      required this.department});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        padding: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 30),
        // height: 200,
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(
          color: AppColor.appbarColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            AppColor.cardShadow,
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'INFORMATION',
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            DefaultTextStyle(
              style: TextStyle(
                color: AppColor.secondaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w400,
                fontFamily: 'Itim',
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ID: '),
                      Text('Designation: '),
                      Text('Department: '),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(id),
                      Text(designation),
                      Text(department),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.appbarColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        boxShadow: [
          AppColor.cardShadow,
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColor.secondaryColor,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                    radius: 85, // Set the radius as needed
                  ),
                  Text(
                    "Muhammad Ali",
                    style: TextStyle(
                      color: AppColor.secondaryColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuButton(
              icon: Icon(
                Icons.more_vert_outlined,
                color: AppColor.secondaryColor,
              ),
              itemBuilder: (context) => const [
                PopupMenuItem(
                  value: '1',
                  child: Text('option 1'),
                ),
                PopupMenuItem(
                  value: '2',
                  child: Text('option 2'),
                ),
                PopupMenuItem(
                  value: '2',
                  child: Text('option 3'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ConsultationDetailsModel {
  String time, office;
  ConsultationDetailsModel({
    required this.time,
    required this.office,
  });
}
