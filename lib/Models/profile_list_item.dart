import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final StatelessWidget page;

  final bool hasNavigation;

  const ProfileListItem(
      {Key? key,
      required this.icon,
      required this.text,
      this.hasNavigation = true,
      required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 8,
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 20,
      ).copyWith(
        bottom: MediaQuery.of(context).size.width / 50,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 26,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black38, width: 1),
      ),
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            )),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 172, 120, 9),
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                icon: Icon(
                  color: Colors.white,
                  this.icon,
                  size: MediaQuery.of(context).size.width / 20,
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width / 20),
            Text(
              this.text,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            if (this.hasNavigation)
              Icon(
                LineAwesomeIcons.angle_right,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
