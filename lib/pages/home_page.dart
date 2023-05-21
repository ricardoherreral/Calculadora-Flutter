import 'package:flutter/material.dart';

late double _deviceHeight, _deviceWidth;

class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<StatefulWidget> createState() {
    return _HomePageStateClass();
  }
}

class _HomePageStateClass extends State<HomePage> {
  String _newNumbersContent = '';
  var _valueX = "Hola Calculadora!";
  double? _firstNumber;
  String _op = 'No';
  double? _res;

  _HomePageStateClass();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration:
              const BoxDecoration(color: Color.fromRGBO(30, 30, 30, 1.0)),
          height: _deviceHeight,
          width: _deviceWidth,
          padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth * 0.05,
            vertical: _deviceHeight * 0.1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _ingresedNumberText(
                  _newNumbersContent == '' ? _valueX : _newNumbersContent,
                  context),
              _rowDelete('C'),
              _rowNumbers('1', '2', '3', '+'),
              _rowNumbers('4', '5', '6', '-'),
              _rowNumbers('7', '8', '9', '*'),
              _rowNumbers('<', '0', '=', '/'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rowNumbers(_num1, _num2, _num3, _num4) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _numberButton(_num1),
        _numberButton(_num2),
        _numberButton(_num3),
        _numberButton(_num4),
      ],
    );
  }

  Widget _rowDelete(_var1) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _numberButton(_var1),
      ],
    );
  }

  Widget _numberButton(var _number) {
    return Container(
      height: _deviceHeight * 0.075,
      width: _deviceWidth * 0.15,
      decoration: BoxDecoration(
        color: _number == '=' ||
                _number == '+' ||
                _number == '-' ||
                _number == '*' ||
                _number == '/' ||
                _number == 'C' ||
                _number == '<'
            ? const Color.fromRGBO(142, 205, 238, 1.0)
            : const Color.fromRGBO(229, 224, 223, 1.0),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: MaterialButton(
        onPressed: () {
          setState(() {
            if (_number == '1' ||
                _number == '2' ||
                _number == '3' ||
                _number == '4' ||
                _number == '5' ||
                _number == '6' ||
                _number == '1' ||
                _number == '7' ||
                _number == '8' ||
                _number == '9' ||
                _number == '0') {
              if (_newNumbersContent == _firstNumber.toString()) {
                _newNumbersContent = '';
              }
              if (_newNumbersContent == _res.toString() && _res != 0) {
                _newNumbersContent = '';
                _res = 0;
              } else {
                _newNumbersContent = '$_newNumbersContent$_number';
              }
            } else if (_number == 'C') {
              _newNumbersContent = '';
              _firstNumber = 0;
              _op = 'No';
            } else if (_number == '.') {
              _newNumbersContent = '$_newNumbersContent.';
            } else if (_number == '<') {
              if (_newNumbersContent.isNotEmpty) {
                _newNumbersContent = _newNumbersContent.substring(
                    0, _newNumbersContent.length - 1);
              }
            } else if (_number == '+') {
              if (_op == 'No') {
                var _ingresedNum = int.parse(_newNumbersContent);
                _firstNumber = _ingresedNum.toDouble();
                _newNumbersContent = _firstNumber!.toString();
                _op = '+';
                print('_firstNumber: $_firstNumber \n _op: $_op');
              }
            } else if (_number == '-') {
              if (_op == 'No') {
                _firstNumber = int.parse(_newNumbersContent).toDouble();
                _newNumbersContent = _firstNumber!.toString();
                _op = '-';
                print('_firstNumber: $_firstNumber \n _op: $_op');
              }
            } else if (_number == '*') {
              if (_op == 'No') {
                _firstNumber = int.parse(_newNumbersContent).toDouble();
                _newNumbersContent = _firstNumber!.toString();
                _op = '*';
                print('_firstNumber: $_firstNumber \n _op: $_op');
              }
            } else if (_number == '/') {
              if (_op == 'No') {
                _firstNumber = int.parse(_newNumbersContent).toDouble();
                _newNumbersContent = _firstNumber!.toString();
                _op = '/';
                print('_firstNumber: $_firstNumber \n _op: $_op');
              }
            } else if (_number == '=') {
              if (_op == '+') {
                _res = _firstNumber! + int.parse(_newNumbersContent).toDouble();
                _newNumbersContent = _res!.toString();
                _op == 'No';
                _firstNumber = 0;
              } else if (_op == '-') {
                _res = _firstNumber! - int.parse(_newNumbersContent).toDouble();
                _newNumbersContent = _res!.toString();
                _op == 'No';
                _firstNumber = 0;
              } else if (_op == '*') {
                _res = _firstNumber! * int.parse(_newNumbersContent).toDouble();
                _newNumbersContent = _res!.toString();
                _op == 'No';
                _firstNumber = 0;
              } else if (_op == '/') {
                _res = _firstNumber!.toDouble() /
                    int.parse(_newNumbersContent).toDouble();
                _newNumbersContent = _res!.toString();
                _op == 'No';
                _firstNumber = 0;
              }
            }
          });
        },
        child: Text(
          _number,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}

Widget _ingresedNumberText(var _numbers, var _context) {
  _deviceHeight = MediaQuery.of(_context).size.height;
  _deviceWidth = MediaQuery.of(_context).size.width;
  return Container(
    decoration: BoxDecoration(
      color: const Color.fromRGBO(53, 53, 53, 1.0),
      borderRadius: BorderRadius.circular(
        10,
      ),
    ),
    alignment: AlignmentDirectional.center,
    height: _deviceHeight * 0.075,
    child: Text(
      "$_numbers",
      style: const TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
