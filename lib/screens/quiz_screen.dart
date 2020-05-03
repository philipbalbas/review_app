import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  static String routeName = '/quiz';

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentPage = 0;

  final List<List<String>> _choices = [
    ['produced', 'produces', 'produce', 'producing'],
    ['red', 'green', 'blue', 'yellow'],
    ['dog', 'cat', 'hedgehog', 'ferret'],
    ['produced', 'produces', 'produce', 'producing'],
  ];

  List<String> _answers = ['produces', 'produces', 'produces', 'produces'];
  List<String> _selectedChoice = ['', '', '', ''];

  void _selectChoice(String choice) {
    setState(() {
      _selectedChoice[_currentPage] = choice;
    });
  }

  void _decrementPage() {
    setState(() {
      _currentPage -= 1;
    });
  }

  void _incrementPage() {
    setState(() {
      _currentPage += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kinetics and Chemical Equilibrium'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${_currentPage + 1} / ${_selectedChoice.length}'),
            Text(
              'Waste incineration _____ highly  polluting subtances.',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Center(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 35,
                    );
                  },
                  shrinkWrap: true,
                  itemBuilder: (ctx, i) => RaisedButton(
                    color: _selectedChoice[_currentPage] ==
                            _choices[_currentPage][i]
                        ? Colors.indigo
                        : Colors.white,
                    onPressed: () => _selectChoice(_choices[_currentPage][i]),
                    child: Text(
                      _choices[_currentPage][i],
                      style: TextStyle(
                        color: _selectedChoice[_currentPage] ==
                                _choices[_currentPage][i]
                            ? Colors.white
                            : Colors.indigo,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  itemCount: _choices.length,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _currentPage >= 1
                    ? RaisedButton(
                        elevation: 1,
                        color: Colors.indigo,
                        onPressed: _decrementPage,
                        child: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        ),
                      )
                    : Container(),
                if (_currentPage < _answers.length - 1)
                  RaisedButton(
                    elevation: 1,
                    color: Colors.indigo,
                    onPressed: _incrementPage,
                    child: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
