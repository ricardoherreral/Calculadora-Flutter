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
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

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
              _ingresedNumberText("1234", context),
              _rowDelete('C', '<'),
              _rowNumbers('1', '2', '3', '+'),
              _rowNumbers('4', '5', '6', '-'),
              _rowNumbers('7', '8', '9', '*'),
              _rowNumbers('.', '0', '=', '/'),
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

  Widget _rowDelete(_var1, _var2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _numberButton(_var1),
        _numberButton(_var2),
      ],
    );
  }

  Widget _numberButton(var _number) {
    return Container(
      margin: _number == 'C' || _number == '<'
          ? const EdgeInsets.only(left: 40)
          : const EdgeInsets.all(0),
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
        onPressed: () {},
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
