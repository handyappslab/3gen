import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Color primaryColor = Color(0xff2e3c55);
  Widget currentPage;

  @override
  void initState() {
    super.initState();
    currentPage = buildHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/images/3gen_logo_white.png',
            fit: BoxFit.contain,
            height: 32,
          ),
        ),
        elevation: 0.0,
      ),
      body: currentPage,
    );
  }

  setPage(Widget page) {
    setState(() {
      currentPage = page;
    });
  }

  Widget buildHome() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              color: primaryColor,
              child: ListTile(
                contentPadding: EdgeInsets.only(top: 5, bottom: 5),
                title: Text(
                  'Elastos DID',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54),
                ),
                subtitle: Text(
                  'iePLX6NoMZnbztCbAQy6c9GjgezqHznSYg',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 180),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Icon(
                        Icons.fingerprint,
                        size: 150,
                        color: primaryColor,
                      ),
                    ),
                    Text(
                      'No accounts currently enabled with 3GEN.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ))
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            child: Text(
              'Add New Account',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => setPage(buildSetupMsg()),
            color: primaryColor,
          ),
        )
      ],
    );
  }

  Widget buildSetupMsg() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 200, bottom: 30),
              child: Image.asset(
                'assets/images/computer_setting.jpg',
                height: 128,
              ),
            ),
            Text(
              'First, go to one of our partner websites to enable 3GEN.',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            child: Text(
              'Continue',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => setPage(buildScanQR()),
            color: primaryColor,
          ),
        )
      ],
    );
  }

  Widget buildScanQR() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 200, bottom: 30),
                child: Image.asset(
                  'assets/images/qrcode_scan.jpg',
                  height: 128,
                )),
            Text(
              'Scan QR Code to add new account.',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            child: Text(
              'Scan',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => setPage(buildEnterCode()),
            color: primaryColor,
          ),
        )
      ],
    );
  }

  Widget buildEnterCode() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 30),
                  child: Image.asset(
                    'assets/images/passcode.jpg',
                    height: 128,
                  )),
              Text(
                'Enter the security code from',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54, fontSize: 18),
              ),
              Text(
                '[WEBSITE NAME]',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'below.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54, fontSize: 18),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50, left: 30, right: 30),
                child: TextFormField(
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide(color: primaryColor, width: 2)),
                    fillColor: primaryColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            child: Text(
              'Send',
              style: TextStyle(color: Colors.white),
            ),
            // onPressed: () => setPage(buildCodeSent()),
            onPressed: () {
              setPage(buildCodeSent());
              Future.delayed(const Duration(milliseconds: 3000), () {
                setPage(buildTempHome());
              });
            },
            color: primaryColor,
          ),
        )
      ],
    );
  }

  Widget buildCodeSent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/sent.jpg',
          height: 64,
        ),
        Container(
          margin: EdgeInsets.only(top: 40, bottom: 50),
          child: Text('Security Code Sent',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            'Please authenticate on the WEBSITE NAME site to confirm.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

// TEMPORARY HOME - delete after backend
  Widget buildTempHome() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              color: primaryColor,
              child: ListTile(
                contentPadding: EdgeInsets.only(top: 5, bottom: 5),
                title: Text(
                  'Elastos DID',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54),
                ),
                subtitle: Text(
                  'iePLX6NoMZnbztCbAQy6c9GjgezqHznSYg',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: primaryColor,
                    ),
                    bottom: BorderSide(
                      color: primaryColor,
                    ),
                  ),
                  color: Color(0xffece9e9)),
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'WEBSITE NAME',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.link, color: Colors.green),
                      Text(' Linked', style: TextStyle(color: Colors.green))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            child: Text(
              'Add New Account',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => setPage(buildSetupMsg()),
            color: primaryColor,
          ),
        )
      ],
    );
  }
}
