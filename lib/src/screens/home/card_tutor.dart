import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardTutor extends StatelessWidget {
  const CardTutor({Key? key, required String name, required String sourceImage, required String intro})
      : _name = name,
        _sourceImage = sourceImage,
        _intro = intro,
        super(key: key);

  final String _name;
  final String _sourceImage;
  final String _intro;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 8,
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
          constraints: const BoxConstraints(maxHeight: 190),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(_sourceImage)),
                          color: Colors.blue,
                          borderRadius: const BorderRadius.all(Radius.circular(100)),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              _name,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "asset/svg/ic_star.svg",
                                width: 20,
                                height: 20,
                                color: Colors.yellow[700],
                              ),
                              SvgPicture.asset(
                                "asset/svg/ic_star.svg",
                                width: 20,
                                height: 20,
                                color: Colors.yellow[700],
                              ),
                              SvgPicture.asset(
                                "asset/svg/ic_star.svg",
                                width: 20,
                                height: 20,
                                color: Colors.yellow[700],
                              ),
                              SvgPicture.asset(
                                "asset/svg/ic_star.svg",
                                width: 20,
                                height: 20,
                                color: Colors.yellow[700],
                              ),
                              SvgPicture.asset(
                                "asset/svg/ic_star.svg",
                                width: 20,
                                height: 20,
                                color: Colors.yellow[700],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 5, right: 8),
                                padding: const EdgeInsets.all(5),
                                child: const Text(
                                  "English",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                decoration: BoxDecoration(color: Colors.blue[50], borderRadius: const BorderRadius.all(Radius.circular(20)), border: Border.all(color: Colors.blue)),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5, right: 8),
                                padding: const EdgeInsets.all(5),
                                child: const Text(
                                  "Tagalog",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                decoration: BoxDecoration(color: Colors.blue[50], borderRadius: const BorderRadius.all(Radius.circular(20)), border: Border.all(color: Colors.blue)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    "asset/svg/ic_heart.svg",
                    width: 30,
                    height: 30,
                    color: Colors.blue,
                  )
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    _intro,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
