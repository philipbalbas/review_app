import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:intervalprogressbar/intervalprogressbar.dart';
import 'package:review_app/screens/result_screen.dart';

class QuizScreen extends StatefulWidget {
  static String routeName = '/quiz';

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentPage = 0;

  final List<String> _questions = [
    "Which of the following official compounds of iron is less irritating to GIT?",
    'Which of the following is useful in the treatment of Vincent’s stomatitis?',
    r"""
\( \ce{ Mn02^-2 } \)
   """,
    'Corrosive Sumblite'
  ];

  final List<List<String>> _choices = [
    [
      'Ferrous Fumarate',
      'Ferrous Gluconate',
      'Ferrous Sulfate',
      'Na₂CO₃ + H₂SO₄ -> Na₂SO₄ +  H₂O + CO₂'
    ],
    [
      'Zinc Chloride',
      'Zinc Oxide',
      'Zinc Peroxide',
      'Zinc Sulfate',
    ],
    ['Manganous', 'Manganic', 'Manganite', 'Manganate'],
    [
      r"""
\( \ce{ HgCl2 } \)
   """,
      r"""
\( \ce{ HgO } \)
   """,
      r"""
\( \ce{ Hg2Cl2 } \)
   """,
      r"""
\( \ce{ HgNH2Cl } \)
   """
    ],
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

  Widget buildHorizontal() => IntervalProgressBar(
        direction: IntervalProgressDirection.horizontal,
        max: _choices.length,
        progress: 1,
        intervalSize: 2,
        size: Size(220, 10),
        highlightColor: Theme.of(context).primaryColor,
        defaultColor: Colors.grey,
        intervalColor: Colors.transparent,
        intervalHighlightColor: Colors.transparent,
        radius: 20,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ResultScreen.routeName);
            },
            child: Text(
              'Finish',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 8, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Kinetics and Chemical Equilibrium",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    )),
                Text('${_currentPage + 1} / ${_selectedChoice.length}'),
              ],
            ),
          ),
          Expanded(
            child: TeXView(
              onTap: (childId) {
                _selectChoice(childId);
              },
              keepAlive: true,
              style: TeXViewStyle(
                padding: TeXViewPadding.all(20),
              ),
              renderingEngine: TeXViewRenderingEngine.katex(),
              children: [
                TeXViewContainer(children: [
                  TeXViewTeX(
                    // title: r"<h1>Quadratic Equation</h1>",
                    _questions[_currentPage],
                    style: TeXViewStyle(margin: TeXViewMargin.only(bottom: 24)),
                  ),
                ]),
                TeXViewContainer(children: [
                  ..._choices[_currentPage]
                      .map((choice) => TeXViewTeX(
                            choice,
                            id: choice,
                            style: TeXViewStyle(
                              textAlign: TeXViewTextAlign.Center,
                              contentColor:
                                  _selectedChoice[_currentPage] == choice
                                      ? Colors.white
                                      : Theme.of(context).primaryColor,
                              backgroundColor:
                                  _selectedChoice[_currentPage] == choice
                                      ? Theme.of(context).primaryColor
                                      : Colors.white,
                              margin: TeXViewMargin.only(
                                bottom: 16,
                                top: 16,
                              ),
                              padding: TeXViewPadding.all(15),
                              borderRadius: TeXViewBorderRadius.all(
                                15,
                              ),
                              border: TeXViewBorder.all(
                                TeXViewBorderDecoration(
                                  borderColor: Colors.indigo,
                                  borderWidth: 1,
                                  borderStyle: TeXViewBorderStyle.Solid,
                                ),
                              ),
                              // bodyStyle: TeXViewStyle(
                              //   textAlign: TeXViewTextAlign.Center,
                            ),
                          ))
                      .toList(),
                ])
              ],
            ),
          ),

          // Expanded(
          //   child: Center(
          //     child: ListView.separated(
          //       separatorBuilder: (BuildContext context, int index) {
          //         return SizedBox(
          //           height: 35,
          //         );
          //       },
          //       shrinkWrap: true,
          //       itemBuilder: (ctx, i) => RaisedButton(
          //         color:
          //             _selectedChoice[_currentPage] == _choices[_currentPage][i]
          //                 ? Colors.indigo
          //                 : Colors.white,
          //         onPressed: () => _selectChoice(_choices[_currentPage][i]),
          //         child: Text(
          //           _choices[_currentPage][i],
          //           style: TextStyle(
          //             color: _selectedChoice[_currentPage] ==
          //                     _choices[_currentPage][i]
          //                 ? Colors.white
          //                 : Colors.indigo,
          //             fontSize: 18,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ),
          //       itemCount: _choices.length,
          //     ),
          //   ),
          // ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RawMaterialButton(
                  onPressed: _currentPage >= 1 ? _decrementPage : null,
                  elevation: 3.0,
                  fillColor: _currentPage >= 1 ? Colors.indigo : Colors.grey,
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
                buildHorizontal(),
                RawMaterialButton(
                  onPressed: _currentPage < _answers.length - 1
                      ? _incrementPage
                      : null,
                  elevation: 3.0,
                  fillColor: _currentPage < _answers.length - 1
                      ? Colors.indigo
                      : Colors.grey,
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
