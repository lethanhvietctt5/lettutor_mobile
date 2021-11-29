import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor_mobile/src/data/tutors_sample.dart';
import 'package:lettutor_mobile/src/models/tutor/feedback.dart';
import 'package:lettutor_mobile/src/models/tutor/tutor.dart';
import 'package:lettutor_mobile/src/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key, required this.tutor}) : super(key: key);
  final Tutor tutor;

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _controller = TextEditingController();
  int rating = 5;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: 20,
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey[800]),
          title: Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              "Give feedback",
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _controller,
                onChanged: (value) {},
                autofocus: true,
                maxLines: 3,
                style: const TextStyle(fontSize: 15),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                    hintText: "Enter todo here..."),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBar.builder(
                      initialRating: 5,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemSize: 30,
                      onRatingUpdate: (rating) {
                        setState(() {
                          this.rating = rating.toInt();
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_controller.text.isEmpty) {
                          showTopSnackBar(
                            context,
                            const CustomSnackBar.error(message: "Please enter feedback content..."),
                            showOutAnimationDuration: const Duration(milliseconds: 1000),
                            displayDuration: const Duration(microseconds: 1000),
                          );
                        } else if (_controller.text.split(" ").length < 5) {
                          showTopSnackBar(
                            context,
                            const CustomSnackBar.error(message: "Feedback content must has 5 words at least."),
                            showOutAnimationDuration: const Duration(milliseconds: 1000),
                            displayDuration: const Duration(microseconds: 1000),
                          );
                        } else {
                          FeedbackRate newFeedback = FeedbackRate(
                            userId: user.id,
                            id: uuid.v4(),
                            content: _controller.text,
                            rating: rating,
                            createdAt: DateTime.now(),
                          );

                          for (int index = 0; index < TutorsSample.tutors.length; index++) {
                            if (TutorsSample.tutors[index].id == widget.tutor.id) {
                              TutorsSample.tutors[index].feedbacks.add(newFeedback);
                              break;
                            }
                          }

                          // TutorsSample.tutors
                          //     .where((element) => element.id == widget.tutor.id)
                          //     .first
                          //     .feedbacks
                          //     .add(newFeedback);

                          Navigator.pop(context);
                        }
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "asset/svg/ic_feedback.svg",
                            width: 20,
                            height: 20,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Feedback",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
