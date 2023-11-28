const List<ProfileMenu> profiMenuList = [
  ProfileMenu(
    name: "Attendance",
    imgUrl: "",
    route: "/attendanceList",
    type: 1,
  ),
  ProfileMenu(
    name: "Leave",
    imgUrl: "assets/images/png&jpg/leaveSpeand.png",
    route: "/leave",
    type: 1,
  ),
  // ProfileMenu(
  //   name: "Check in/out", // vital_signs_&_BMI
  //   imgUrl: "assets/images/png&jpg/absent.png",
  //   route: "/allVitalSign",

  //   type: 1,
  // ),
  // ProfileMenu(
  //   name: "Claim (Upcoming)",
  //   imgUrl: "assets/images/png&jpg/absent.png",
  //   route: "/history",
  //   type: 1,
  // ),
  // ProfileMenu(
  //   name: "task",
  //   imgUrl: "assets/images/png&jpg/absent.png",
  //   route: "/complain",
  //   type: 1,
  // ),
  ProfileMenu(
    name: "Salary (Upcoming)",
    imgUrl: "assets/images/png&jpg/salary.png",
    route: "/prescription",
    type: 1,
  ),
  ProfileMenu(
    name: "ETF (Upcoming)",
    imgUrl: "assets/images/png&jpg/providentfund.png",
    route: "/report",
    type: 1,
  ),

  // ProfileMenu(
  //   name: "running_Appointment",
  //   imgUrl: "assets/icons/appointment.png",
  //   route: "/nearestPharmacy",
  //   role: [4],
  //   type: 1,
  // ),
];

class ProfileMenu {
  final String name;
  final String imgUrl;
  final String route;

  final int type;

  const ProfileMenu({
    required this.name,
    required this.imgUrl,
    required this.route,
    required this.type,
  });
}
