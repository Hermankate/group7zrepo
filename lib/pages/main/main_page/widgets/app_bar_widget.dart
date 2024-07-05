import 'package:flutter/material.dart';
import 'package:cjb/theme/styles.dart';

PreferredSizeWidget appBarWidget(BuildContext context,
    {VoidCallback? onLeadingTapClickListener, String? title, bool? isJobsTab}) {
  return AppBar(
    backgroundColor: cjbWhiteFFFFFF,
    elevation: 0,
    leading: GestureDetector(
      onTap: onLeadingTapClickListener,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              "assets/profile_1.jpeg",
            )),
      ),
    ),
    title: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: cjbLightGreyCACCCE.withOpacity(.5),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "$title",
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search)),
      ),
    ),
    actions: [
      isJobsTab == false
          ? GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.message_outlined,
                size: 35,
                color: cjbMediumGrey86888A,
              ),
            )
          : const Row(
              children: [
                Icon(
                  Icons.more_vert,
                  size: 35,
                  color: cjbMediumGrey86888A,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.message_outlined,
                  size: 35,
                  color: cjbMediumGrey86888A,
                )
              ],
            ),
      const SizedBox(
        width: 10,
      )
    ],
  );
}
