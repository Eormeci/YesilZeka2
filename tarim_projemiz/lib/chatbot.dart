import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:local_events/colors.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key, required Null Function() onBackButtonPressed});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  String responseText = '';
  TextEditingController promptController = TextEditingController();

  @override
  void dispose() {
    promptController.dispose();
    super.dispose();
  }

  Future<void> fetchData(String prompt) async {
    final String apiUrl =
        'https://api-inference.huggingface.co/models/distilbert/distilgpt2';
    final String apiToken = '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'; // Replace with your actual API token

    final Map<String, String> headers = {
      'Authorization': 'Bearer $apiToken',
      'Content-Type': 'application/json'
    };

    final Map<String, dynamic> payload = {
      'inputs': prompt,
      'parameters': {
        'max_new_tokens': 200, // Try different values here
      },
    };

    final http.Response response =
    await http.post(Uri.parse(apiUrl), headers: headers, body: jsonEncode(payload));

    if (response.statusCode == 200) {
      final dynamic responseData = jsonDecode(response.body);

      if (responseData is List) {
        // Handle list response
        if (responseData.isNotEmpty) {
          setState(() {
            responseText = responseData.first['generated_text'];
          });
        } else {
          throw Exception('Invalid response format: empty list');
        }
      } else if (responseData is Map<String, dynamic>) {
        // Handle map response
        if (responseData.containsKey('generated_text')) {
          setState(() {
            responseText = responseData['generated_text'];
          });
        } else {
          throw Exception('Invalid response format: missing generated_text field');
        }
      } else {
        throw Exception('Invalid response format: unexpected type');
      }
    } else {
      throw Exception('Failed to fetch data: ${response.reasonPhrase}');
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hugging Face API Example'),
          backgroundColor: bg,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: promptController,
                  decoration: InputDecoration(
                    labelText: 'Enter your prompt',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String prompt = promptController.text;
                    if (prompt.isNotEmpty) {
                      fetchData(prompt);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please enter a prompt.'),
                        ),
                      );
                    }
                  },
                  child: Text('Generate Text'),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      responseText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
