import 'package:ceylontrailapp/screen/home_screen.dart';
import 'package:ceylontrailapp/widgets/custom_info_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/app_theme.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  bool isEditMode = false;

  // Controllers for the text fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the controllers with initial values
    _firstNameController.text = 'Leonardo';
    _lastNameController.text = 'DiCaprio';
    _usernameController.text = '@leonardox';
    _emailController.text = 'thiran@gmail.com';
    _passwordController.text = 'Thiran123';
  }

  @override
  void dispose() {
    // Dispose of the controllers
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void toggleEditMode() {
    setState(() {
      isEditMode = !isEditMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomInfoAppbar(
      isEditMode: isEditMode,
      onEditModeToggle: toggleEditMode,
      content: SingleChildScrollView(
        child: Column(
          children: [
            // General Information
            _buildSectionTitle("General Information"),
            _buildInfoContainer(
              children: [
                _buildTextFormField("First Name", _firstNameController, isEditable: isEditMode),
                _buildTextFormField("Last Name", _lastNameController, isEditable: isEditMode),
                _buildTextFormField("Username", _usernameController, isEditable: isEditMode),
                const SizedBox(height: 10), // Add this line
              ],
            ),
            // Security Information
            _buildSectionTitle("Security Information"),
            _buildInfoContainer(
              children: [
                _buildTextFormField("E-mail", _emailController, isEditable: false),
                _buildTextFormField("Password", _passwordController, isEditable: false, obscureText: true),
                _buildChangePasswordLink(),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppTheme.colors.primary_dark_3,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoContainer({required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.colors.secondary_light_1,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: children),
      ),
    );
  }

  Widget _buildTextFormField(String label, TextEditingController controller, {bool isEditable = true, bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppTheme.colors.primary_dark_3,
              ),
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller,
            enabled: isEditable,
            obscureText: obscureText,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppTheme.colors.white,
              hintStyle: TextStyle(color: AppTheme.colors.secondary_light_2),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: AppTheme.colors.secondary_light_3, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: AppTheme.colors.primary_dark_3, width: 2),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: AppTheme.colors.primary_dark_3, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChangePasswordLink() {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => HomeScreen());
            },
            child: Text(
              'Change Password',
              style: TextStyle(
                color: AppTheme.colors.primary,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
