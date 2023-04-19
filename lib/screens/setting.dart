import "package:flutter/material.dart";

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Name",
                hintText: "Enter your name",
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Confirm Password",
                hintText: "Enter your confirm password",
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
