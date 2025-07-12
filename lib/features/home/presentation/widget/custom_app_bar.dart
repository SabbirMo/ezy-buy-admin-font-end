import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 6),
      decoration: BoxDecoration(
        color: Color(0xff070B1D),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/icons/logo.png"),
          Container(
            width: 500,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(4),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 7),
                prefixIcon: Icon(Icons.search_outlined),
                prefixIconColor: Colors.white,
                hintText: "Search...",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: "Inter",
                ),
              ),
              cursorHeight: 16.0,
              cursorColor: Colors.white,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.message_outlined,
                color: Colors.white,
              ),
              const SizedBox(width: 20),
              Icon(
                Icons.notifications_outlined,
                color: Colors.white,
              ),
              const SizedBox(width: 20),
              CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xff1FD286),
                foregroundColor: Color(0xffffffff),
                child: Text("R"),
              ),
              const SizedBox(width: 10),
              Text(
                "Randhir kumar",
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 14,
                  fontFamily: "Inter",
                ),
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.arrow_drop_down_sharp,
                color: Colors.white,
              )
            ],
          ),
        ],
      ),
    );
  }
}
