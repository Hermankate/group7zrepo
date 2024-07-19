import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAjob extends StatelessWidget {
  final TextEditingController workplaceController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController employmentTypeController =
      TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/vectors/remove_29_x2.svg',
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Text(
                  'Post',
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: Color(0xFFFF9228),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(
              'Add a job',
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Color(0xFF150B3D),
              ),
            ),
            SizedBox(height: 20),
            buildInputField(context, 'Type of workplace',
                'rectangle_16223_x2.svg', workplaceController),
            SizedBox(height: 20),
            buildInputField(context, 'Job location', 'rectangle_16229_x2.svg',
                locationController),
            SizedBox(height: 20),
            buildInputField(context, 'Company', 'rectangle_16224_x2.svg',
                companyController),
            SizedBox(height: 20),
            buildInputField(context, 'Employment type', 'rectangle_1626_x2.svg',
                employmentTypeController),
            SizedBox(height: 20),
            buildInputField(context, 'Description', 'rectangle_5928_x2.svg',
                descriptionController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Collect all user inputs
                final workplace = workplaceController.text;
                final location = locationController.text;
                final company = companyController.text;
                final employmentType = employmentTypeController.text;
                final description = descriptionController.text;

                // Handle job posting with collected inputs
                print('Workplace: $workplace');
                print('Location: $location');
                print('Company: $company');
                print('Employment Type: $employmentType');
                print('Description: $description');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 42, 14, 202),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              ),
              child: Text(
                'Post Job',
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildInputField(BuildContext context, String labelText,
      String svgAsset, TextEditingController controller) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SvgPicture.asset(
              'assets/vectors/$svgAsset',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                labelText,
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Color(0xFF150B3D),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Enter $labelText',
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Color(0xFF150B3D),
                                  ),
                                ),
                                SizedBox(height: 20),
                                buildGrowingTextField(labelText, controller),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Cancel'),
                                    ),
                                    SizedBox(width: 8),
                                    TextButton(
                                      onPressed: () {
                                        // Save the input data and close the dialog
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Save'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: SvgPicture.asset(
                  'assets/vectors/add_9_x2.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildGrowingTextField(
      String hintText, TextEditingController controller) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 200, // Adjust the max height as needed
      ),
      child: SingleChildScrollView(
        child: TextField(
          controller: controller,
          maxLines: null,
          decoration: InputDecoration(
            hintText: 'Enter $hintText here',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
