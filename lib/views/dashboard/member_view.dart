import 'package:barcode_widget/barcode_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/user_model.dart';
import 'package:mobile_flutter/shared/buttons.dart';
import 'package:mobile_flutter/shared/custom_appbar.dart';
import 'package:mobile_flutter/shared/headers.dart';
import 'package:mobile_flutter/shared/snack_bar.dart';
import 'package:mobile_flutter/views/auth/auth_provider.dart';
import 'package:provider/provider.dart';

class MemberView extends StatelessWidget {
  const MemberView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel? user = Provider.of<AuthProvider>(context).user;

    return Scaffold(
      appBar: customAppBar(context, title: 'Informasi Member', isElevated: false),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  profileHeader(
                    context,
                    name: user?.name,
                    imgUrl: user?.image,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Upload new profile picture?'),
                            actions: [
                              TextButton(
                                onPressed: () async {
                                  await uploadPicture(context);
                                  if (context.mounted) {
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text('Yes')
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('No', style: TextStyle(color: Colors.redAccent))
                              )
                            ],
                          );
                        },
                      );
                    },
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: user != null
                    ? IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/user_setting');
                      },
                      icon: const Icon(Icons.manage_accounts_outlined, size: 32, color: Colors.white),
                    )
                    : IconButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
                      },
                      icon: const Icon(Icons.login_outlined, size: 32, color: Colors.white),
                    )
                  )
                ],
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const Text(
                      'Silahkan mendaftar sebagai member dan nikmati diskon 30% untuk setiap transaksi serta dapatkan keuntungan lainnya',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 60),
                    BarcodeWidget(
                      color: user == null || user.memberCode.isEmpty ? Colors.grey : Colors.black,
                      height: 100,
                      barcode: Barcode.code128(),
                      data: user == null || user.memberCode.isEmpty ? '00000 000000' : user.memberCode,
                      style: TextStyle(
                        color: user == null || user.memberCode.isEmpty ? Colors.grey : Colors.black
                      ),
                    ),
                    const SizedBox(height: 70),
                    user != null && user.memberCode.isEmpty
                    ? fullWidthButton(label: 'Daftar Member', onPressed: () async {
                      await Provider.of<AuthProvider>(context, listen: false).registerMember();
                    })
                    : fullWidthButton(label: 'Cetak Member', onPressed: () {
                      Navigator.pushNamed(context, '/cetak_member');
                    })
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> uploadPicture(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      if(context.mounted) {
        Provider.of<AuthProvider>(context, listen: false).uploadPicture(imagePath: result.files.first.path!);
      }
    } else {
      if (context.mounted) {
        snackBar(context, 'Upload image canceled');
      }
    }
  }

}