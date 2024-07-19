import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfileV1 extends StatefulWidget {
  @override
  _MyProfileV1State createState() => _MyProfileV1State();
}

class _MyProfileV1State extends State<MyProfileV1> {
  final _formKey = GlobalKey<FormState>();
  final _fullnameController = TextEditingController();
  final _dobController = TextEditingController();
  final _genderController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();

  String _gender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 26),
                child: Stack(
                  children: [
                    Positioned(
                      left: -27,
                      right: -23,
                      top: -26,
                      bottom: -23,
                      child: SizedBox(
                        width: 375,
                        height: 220,
                        child: SvgPicture.asset(
                          'assets/vectors/background_x2.svg',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(27, 26, 23, 23),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 17, 0, 0),
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/image.jpeg'),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 53),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                            0, 2.1, 16.7, 2),
                                        width: 24,
                                        height: 24,
                                        child: SvgPicture.asset(
                                          'assets/vectors/union_11_x2.svg',
                                        ),
                                      ),
                                      SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: SvgPicture.asset(
                                          'assets/vectors/icon_setting_3_x2.svg',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(1, 0, 1, 34),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Orlando Diggs',
                                      style: GoogleFonts.getFont(
                                        'DM Sans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        height: 2,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(1, 0, 1, 0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: -6.5,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            child: Opacity(
                                              opacity: 0.1,
                                              child: SizedBox(
                                                width: 120,
                                                height: 30,
                                                child: SvgPicture.asset(
                                                  'assets/vectors/rectangle_1611_x2.svg',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                              15, 6.5, 15, 7.5),
                                          child: Text(
                                            'Change image',
                                            style: GoogleFonts.getFont(
                                              'DM Sans',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 0,
                            bottom: 50,
                            child: SizedBox(
                              height: 16,
                              child: Text(
                                'California, USA',
                                style: GoogleFonts.getFont(
                                  'DM Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Fullname
                      _buildTextField(
                        controller: _fullnameController,
                        label: 'Fullname',
                        validator: (value) => value!.isEmpty
                            ? 'Please enter your fullname'
                            : null,
                      ),
                      // Date of Birth
                      _buildDatePicker(
                        controller: _dobController,
                        label: 'Date of birth',
                      ),
                      // Gender
                      _buildGenderSelector(),
                      // Email
                      _buildTextField(
                        controller: _emailController,
                        label: 'Email address',
                        validator: (value) => value!.isEmpty
                            ? 'Please enter your email address'
                            : null,
                      ),
                      // Phone Number
                      _buildTextField(
                        controller: _phoneController,
                        label: 'Phone number',
                        validator: (value) => value!.isEmpty
                            ? 'Please enter your phone number'
                            : null,
                        keyboardType: TextInputType.phone,
                      ),
                      // Location
                      _buildTextField(
                        controller: _locationController,
                        label: 'Location',
                        validator: (value) => value!.isEmpty
                            ? 'Please enter your location'
                            : null,
                      ),
                      // Save Button
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xFF130160),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x2E99ABC6),
                              offset: Offset(0, 4),
                              blurRadius: 31,
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              // Simply show a confirmation message
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Form submitted successfully'),
                              ));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF130160),
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Text(
                            'SAVE',
                            style: GoogleFonts.getFont(
                              'DM Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              letterSpacing: 0.8,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Stack(
        children: [
          Positioned(
            top: 26,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 335,
                height: 40,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x2E99ABC6),
                      offset: Offset(0, 4),
                      blurRadius: 31,
                    ),
                  ],
                ),
                child: SvgPicture.asset(
                  'assets/vectors/rectangle_5937_x2.svg',
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 22),
                  child: Text(
                    label,
                    style: GoogleFonts.getFont(
                      'DM Sans',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xFF150A33),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextFormField(
                    controller: controller,
                    validator: validator,
                    keyboardType: keyboardType,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your $label',
                      hintStyle: GoogleFonts.getFont(
                        'DM Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF524B6B),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDatePicker({
    required TextEditingController controller,
    required String label,
  }) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Stack(
        children: [
          Positioned(
            top: 26,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 335,
                height: 40,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x2E99ABC6),
                      offset: Offset(0, 4),
                      blurRadius: 31,
                    ),
                  ],
                ),
                child: SvgPicture.asset(
                  'assets/vectors/rectangle_5937_x2.svg',
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 22),
                  child: Text(
                    label,
                    style: GoogleFonts.getFont(
                      'DM Sans',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xFF150A33),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: controller,
                        validator: (value) => value!.isEmpty
                            ? 'Please enter your date of birth'
                            : null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Select your $label',
                          hintStyle: GoogleFonts.getFont(
                            'DM Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xFF524B6B),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderSelector() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Stack(
        children: [
          Positioned(
            top: 26,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 335,
                height: 40,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x2E99ABC6),
                      offset: Offset(0, 4),
                      blurRadius: 31,
                    ),
                  ],
                ),
                child: SvgPicture.asset(
                  'assets/vectors/rectangle_5937_x2.svg',
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 22),
                  child: Text(
                    'Gender',
                    style: GoogleFonts.getFont(
                      'DM Sans',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xFF150A33),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            'Male',
                            style: GoogleFonts.getFont(
                              'DM Sans',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFF524B6B),
                            ),
                          ),
                          leading: Radio<String>(
                            value: 'Male',
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            'Female',
                            style: GoogleFonts.getFont(
                              'DM Sans',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFF524B6B),
                            ),
                          ),
                          leading: Radio<String>(
                            value: 'Female',
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (selectedDate != null && selectedDate != now) {
      setState(() {
        _dobController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }
}
