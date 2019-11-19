import 'package:flutter/material.dart';

import './home.dart';

class AccountSetup extends StatefulWidget {
  @override
  _AccountSetupState createState() => _AccountSetupState();
}

class _AccountSetupState extends State<AccountSetup> {
  final Color primaryColor = Color(0xff2e3c55);
  // List pages = new List<Widget>();
  Widget currentPage;
  bool firstPage;

  @override
  void initState() {
    super.initState();
    currentPage = buildStartPage();
    firstPage = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !firstPage ? Center(
          child: Image.asset(
            'assets/images/3gen_logo_white.png',
            fit: BoxFit.contain,
            height: 32,
          ),
        ): null,
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

  Widget buildStartPage() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: Image.asset('assets/images/3gen_stacked.png'),
          ),
          flex: 3,
        ),
        Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Powered by'),
                Container(
                  child: Image.asset(
                    'assets/images/elastos_horizontal.jpg',
                    fit: BoxFit.contain,
                    height: 24,
                  ),
                  padding: EdgeInsets.all(12),
                )
              ],
            ),
            flex: 2),
        Column(
          children: <Widget>[
            RaisedButton(
              child: Text(
                'Create',
                style: TextStyle(color: Colors.white),
              ),
              color: primaryColor,
              onPressed: () => setPage(buildCreateAccountMsg()),
            ),
            FlatButton(
              child: Text(
                'Recover',
                style: TextStyle(color: primaryColor),
              ),
              onPressed: () {},
            )
          ],
        )
      ],
    );
  }

  Widget buildCreateAccountMsg() {
    firstPage = false;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Recovery Phrase',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              'assets/images/passphrase_logo.png',
              fit: BoxFit.contain,
              height: 256,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 20, 12, 15),
              child: Text(
                'Your recovery phrase is the only way to restore your 3GEN account if your phone is lost, stolen, broken, or upgraded.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Text(
              'We will show you a list of words, this is your passphrase. Write it down and keep it safe.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
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
            onPressed: () => setPage(buildPassphraseWords()),
            color: primaryColor,
          ),
        )
      ],
    );
  }

  Widget phraseHighlighter(String orderNumber, String phrase,) {
    Paint paint = Paint();
    paint.color = primaryColor;

    return Container(
      margin: EdgeInsets.only(top: 18),
      child: Stack(
      alignment: Alignment(0, -5),
      children: <Widget>[
        Container(
          color: primaryColor,
          padding: EdgeInsets.all(12),
          child: Text(
            phrase,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        CircleAvatar(
          maxRadius: 14,
          child: Text(
            orderNumber,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Color(0xff5e8787),
        )
      ],
    ),
    );
  }

  Widget buildPassphraseWords() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 15, bottom: 20),
                child: Text(
                  'Write Down',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 20, 12, 50),
              child: Text(
                'Please write down each word in order and store it in a safe place.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                phraseHighlighter('1', 'inject'),
                phraseHighlighter('2', 'stereo'),
                phraseHighlighter('3', 'setup')
              ],
            ),
            Padding(padding: EdgeInsets.all(15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                phraseHighlighter('4', 'pistol'),
                phraseHighlighter('5', 'blossom'),
                phraseHighlighter('6', 'pioneer')
              ],
            ),
            Padding(padding: EdgeInsets.all(15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                phraseHighlighter('7', 'armor'),
                phraseHighlighter('8', 'faculty'),
                phraseHighlighter('9', 'trap')
              ],
            ),
            Padding(padding: EdgeInsets.all(15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                phraseHighlighter('10', 'buyer'),
                phraseHighlighter('11', 'blue'),
                phraseHighlighter('12', 'earn')
              ],
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
            onPressed: () => setPage(buildVerifyPassphrase()),
            color: primaryColor,
          ),
        )
      ],
    );
  }

  Widget buildVerifyPassphrase() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 15, bottom: 20),
                child: Text(
                  'Write Down',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 20, 12, 50),
              child: Text(
                'To make sure everything was written down correctly, please enter the following words from your recovery phrase.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide: BorderSide(color: primaryColor, width: 2)),
                  labelText: 'Word #5',
                  fillColor: primaryColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide: BorderSide(color: primaryColor, width: 2)),
                  labelText: 'Word #11',
                  fillColor: primaryColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            child: Text(
              'Verify',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              setPage(buildVerified());

              Future.delayed(const Duration(milliseconds: 3000), () {
                Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
                // Navigator.push(this.context, MaterialPageRoute(builder: (context) => Home()));
              });
            },
            color: primaryColor,
          ),
        )
      ],
    );
  }

  Widget buildVerified() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.check_circle,
          color: primaryColor,
          size: 128,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(12, 20, 12, 50),
          child: Text(
            'Your passphrase has been verified',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
            ),
          ),
        ),
      ],
    );
  }
}
