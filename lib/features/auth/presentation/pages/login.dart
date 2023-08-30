import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workspace/core/data/model/drop_down_data.dart';
import 'package:workspace/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:workspace/features/auth/presentation/components/google_sign_in_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PopupMenuButton(
              offset: const Offset(0, 25),
              itemBuilder: (context) {
                return _countries.map((e) {
                  return PopupMenuItem(
                    child: Text(e.name ?? ""),
                  );
                }).toList();
              },
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none),
              child: const Icon(Icons.filter_list_alt),
            ),
            const Text("Sign In"),
            ElevatedButton(
              onPressed: () {
                context
                    .read<AuthBloc>()
                    .add(RequestSignin(email: "email", password: "password"));
              },
              child: const Text("Login"),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(Logout());
              },
              child: const Text("UnAuthenticate"),
            ),
            GoogleSignInButton(),
            MyDropDownButton(
              dropDownItems: _countries,
              onChanged: (value) {
                print(value?.name);
              },
            ),
          ],
        ),
      ),
    );
  }

  final List<DropDownData> _countries = List.generate(
    3,
    (index) => DropDownData(name: "Item $index", id: index),
  );

  void _onDropDownSelected(DropDownData? value) {}
}

class MyDropDownButton extends StatefulWidget {
  const MyDropDownButton({
    super.key,
    required this.dropDownItems,
    required this.onChanged,
  });

  final List<DropDownData> dropDownItems;

  final ValueChanged<DropDownData?> onChanged;

  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  @override
  void initState() {
    widget.dropDownItems
        .insert(0, const DropDownData(name: "Select country", id: -1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<DropDownData>(
      icon: const Icon(Icons.factory),
      padding: const EdgeInsets.all(8),
      isExpanded: false,
      borderRadius: BorderRadius.circular(16),

      alignment: Alignment.centerLeft,
      //Adding this property, does the magic
      validator: (value) {
        return null;
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      items: widget.dropDownItems.map((e) {
        return DropdownMenuItem<DropDownData>(
          value: e,
          enabled: e.id != -1,
          child: Text(
            e.name.toString(),
            style: e.id == -1 ? const TextStyle(color: Colors.grey) : null,
          ),
        );
      }).toList(),
      onChanged: widget.onChanged,
      hint: const Align(
        alignment: Alignment.centerLeft,
        child: Text("Hint"),
      ),
      menuMaxHeight: 350,
    );
  }
}
