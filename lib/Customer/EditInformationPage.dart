import 'package:flutter/material.dart';

class EditInformationPage extends StatefulWidget {
  final String fieldType;
  final String currentValue;

  const EditInformationPage({
    super.key,
    required this.fieldType,
    required this.currentValue,
  });

  @override
  State<EditInformationPage> createState() => _EditInformationPageState();
}

class _EditInformationPageState extends State<EditInformationPage> {
  late TextEditingController _controller;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.currentValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _getPageTitle() {
    switch (widget.fieldType.toLowerCase()) {
      case 'first name':
        return 'Edit First Name';
      case 'last name':
        return 'Edit Last Name';
      case 'email':
        return 'Edit Email';
      case 'phone number':
        return 'Edit Phone Number';
      case 'address':
        return 'Edit Address';
      case 'password':
        return 'Edit Password';
      default:
        return 'Edit Information';
    }
  }

  String _getFieldLabel() {
    return widget.fieldType;
  }

  TextInputType _getKeyboardType() {
    switch (widget.fieldType.toLowerCase()) {
      case 'email':
        return TextInputType.emailAddress;
      case 'phone number':
        return TextInputType.phone;
      case 'password':
        return TextInputType.visiblePassword;
      default:
        return TextInputType.text;
    }
  }

  bool _isPasswordField() {
    return widget.fieldType.toLowerCase() == 'password';
  }

  void _handleSaveChanges() async {
    if (_controller.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a value'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isLoading = false;
    });

    // TODO: Implement actual save functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.fieldType} updated successfully!'),
        duration: const Duration(seconds: 2),
      ),
    );

    // Navigate back to profile page
    Navigator.pop(context, _controller.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF141414),
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          _getPageTitle(),
          style: const TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xFF141414),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Input Field Section
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getFieldLabel(),
                          style: const TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xFF141414),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFEDEDED),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextField(
                            controller: _controller,
                            keyboardType: _getKeyboardType(),
                            obscureText: _isPasswordField(),
                            decoration: InputDecoration(
                              hintText:
                                  'Enter ${_getFieldLabel().toLowerCase()}',
                              hintStyle: const TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xFF737373),
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(16),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xFF141414),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Bottom spacing
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // Save Changes Button
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFFFAFAFA),
              border: Border(
                top: BorderSide(color: Color(0xFFEDEDED), width: 1),
              ),
            ),
            child: SafeArea(
              child: GestureDetector(
                onTap: _isLoading ? null : _handleSaveChanges,
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: _isLoading
                        ? const Color(0xFF000000).withOpacity(0.5)
                        : const Color(0xFF000000),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Center(
                    child: _isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFFFAFAFA),
                              ),
                            ),
                          )
                        : const Text(
                            'Save Changes',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Color(0xFFFAFAFA),
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

