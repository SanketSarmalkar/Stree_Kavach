import "package:flutter/material.dart";

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text("Helper 1",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Name",
                            hintText: "Enter your name",
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Email",
                            hintText: "Enter your email",
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Phone Number",
                            hintText: "Enter your phone number",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text("Helper 2",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Name",
                            hintText: "Enter your name",
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Email",
                            hintText: "Enter your email",
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Phone Number",
                            hintText: "Enter your phone number",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Save"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
