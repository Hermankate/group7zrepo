import 'package:cjb/pages/auth/identity.dart';
import 'package:flutter/material.dart';
import 'package:cjb/theme/styles.dart';

PreferredSizeWidget appBarWidget(BuildContext context,
    {VoidCallback? onLeadingTapClickListener,
    String? title,
    bool? isJobsTab,
    Function(String)? onSearch}) {
  final TextEditingController _searchController = TextEditingController();

  return AppBar(
    backgroundColor: cjbWhiteFFFFFF,
    elevation: 0,
    leading: GestureDetector(
      onTap: onLeadingTapClickListener,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: GlobalVariables().profileImageUrl.isNotEmpty
                ? Image.network(
                    GlobalVariables().profileImageUrl,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/holder.jpeg',
                    fit: BoxFit.cover,
                  ),
          )),
    ),
    title: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: cjbLightGreyCACCCE.withOpacity(.5),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: _searchController,
        decoration: InputDecoration(
            hintText: "$title",
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search)),
        onFieldSubmitted: (query) {
          if (onSearch != null) {
            onSearch(query);
          }
        },
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
