import 'package:flutter/material.dart';
import 'config/style/icon_broken.dart';

class ProfileScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Edit Profile'),
        titleSpacing: 3,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //const LinearProgressIndicator(),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Card(
                      elevation: 5,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          const Image(
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 160,
                            image: NetworkImage(
                                'https://scontent.fcai18-1.fna.fbcdn.net/v/t39.30808-6/330428924_765142874533408_8094820109682825282_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=4nYZbhbQTHMAX8q-27G&_nc_ht=scontent.fcai18-1.fna&oh=00_AfDODRSUd5Ii1lTQSNAqdGExCn4fDTLSzXfd3VcFpihK6g&oe=65BF0318'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 18,
                              child: IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  // Add functionality for the camera button
                                },
                                icon: const Icon(
                                  IconBroken.Camera,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        radius: 51,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 47,
                          backgroundImage: NetworkImage(
                              'https://scontent.fcai18-1.fna.fbcdn.net/v/t39.30808-6/330428924_765142874533408_8094820109682825282_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=4nYZbhbQTHMAX8q-27G&_nc_ht=scontent.fcai18-1.fna&oh=00_AfDODRSUd5Ii1lTQSNAqdGExCn4fDTLSzXfd3VcFpihK6g&oe=65BF0318'),
                        ),
                      ),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.black,
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            // Add functionality for the camera button
                          },
                          icon: const Icon(
                            IconBroken.Camera,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              // Add functionality for Edit Profile button
                            },
                            child: const Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        // const LinearProgressIndicator(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              // Add functionality for Edit Cover button
                            },
                            child: const Text(
                              'Edit Cover',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name must be required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(
                    IconBroken.User,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email must be required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black), // Color when focused
                  ),
                  labelText: 'Email',
                  labelStyle:
                      TextStyle(color: Colors.black), // Color when focused
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.black, // Color when focused
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Phone must be required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black), // Color when focused
                  ),
                  labelText: 'Phone',
                  labelStyle:
                      TextStyle(color: Colors.black), // Color when focused
                  prefixIcon: Icon(
                    IconBroken.Call,
                    color: Colors.black, // Color when focused
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
