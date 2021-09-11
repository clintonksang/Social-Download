import 'package:flutter/material.dart';

class ReelsW extends StatefulWidget {
  const ReelsW({ Key? key }) : super(key: key);

  @override
  _ReelsWState createState() => _ReelsWState();
}

class _ReelsWState extends State<ReelsW> {
TextEditingController textEditingController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return                   Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: Alignment(-0.05, 0),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 40, 180, 0),
                          child: Text(
                            'Instagram',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.grey[900],
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 200, 0),
                        child: Text(
                          'Search for IG Profile and paste it here',
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.grey[900],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 80, 20, 0),
                        child: TextFormField(
                          controller: textEditingController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'IG Profile Link',
                            labelStyle: TextStyle(
                              fontFamily: 'Lexend Deca',
                            ),
                            hintText: 'Link...',
                            hintStyle: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0x9AFFFFFF),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x9AFFFFFF),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x9AFFFFFF),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.grey[900],
                            prefixIcon: Icon(
                              Icons.content_copy,
                              color: Colors.white,
                            ),
                          ),
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                          ),
                          keyboardType: TextInputType.url,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please fill in a valid email address...';
                            }

                            return null;
                          },
                        ),
                      )
                    ],
                  );
  }
}