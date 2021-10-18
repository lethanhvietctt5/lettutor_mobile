import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({Key? key, required String icon, required String title})
      : _icon = icon,
        _title = title,
        super(key: key);

  final String _icon, _title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        onPressed: () {},
        child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    _icon,
                    width: 25,
                    color: Colors.grey[700],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Text(
                      _title,
                      style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w400, fontSize: 13),
                    ),
                  )
                ],
              ),
              SvgPicture.asset(
                "asset/svg/ic_next.svg",
                color: Colors.grey[700],
              )
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1000))),
        ),
      ),
    );
  }
}
