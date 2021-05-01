import 'dart:math';

import 'package:flutter/cupertino.dart';

class StampDutyCalculatorResultModel extends ChangeNotifier {
  double propertyValue = 0;
  String state;
  int propertyChoice = 0;
  int buildingChoice = 0;
  int isFirstHomeBuyer = 0;

  double get result => getResult(propertyValue, state, propertyChoice, buildingChoice, isFirstHomeBuyer);

  StampDutyCalculatorResultModel(this.propertyValue, this.state, this.propertyChoice, this.buildingChoice, this.isFirstHomeBuyer);
}

double getResult(double propertyValue, String state, int propertyChoice, int buildingChoice, int isFirstHomeBuyer) {
  var stampDutyResult = 0.0;
  if (state == "South Australia") {
    if (propertyValue <= 12000) {
      stampDutyResult = propertyValue / 100;
    } else {
      if (propertyValue > 12000 && propertyValue <= 30000) {
        stampDutyResult = 120 + 2 * (propertyValue - 12000) / 100;
      } else {
        if (propertyValue > 30000 && propertyValue <= 50000) {
          stampDutyResult = 480 + 3 * (propertyValue - 30000) / 100;
        } else {
          if (propertyValue > 50000 && propertyValue <= 100000) {
            stampDutyResult = 2830 + 4 * (propertyValue - 100000) / 100;
          } else {
            if (propertyValue > 100000 && propertyValue <= 200000) {
              stampDutyResult = 2830 + 4 * (propertyValue - 100000) / 100;
            } else {
              if (propertyValue > 200000 && propertyValue <= 250000) {
                stampDutyResult = 6830 + 4.25 * (propertyValue - 200000) / 100;
              } else {
                if (propertyValue > 250000 && propertyValue <= 300000) {
                  stampDutyResult = 8955 + 4.75 * (propertyValue - 250000) / 100;
                } else {
                  if (propertyValue > 300000 && propertyValue <= 500000) {
                    stampDutyResult = 11330 + 5 * (propertyValue - 300000) / 100;
                  } else {
                    if (propertyValue > 500000) {
                      stampDutyResult = 21330 + 5.5 * (propertyValue - 500000) / 100;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (state == "Australian Capitol Territory") {
    if (propertyValue <= 200000) {
      stampDutyResult = max(20, 1.2 * propertyValue / 100);
    } else {
      if (propertyValue > 200000 && propertyValue <= 300000) {
        stampDutyResult = 4600 + 3.4 * (propertyValue - 300000) / 100;
      } else {
        if (propertyValue > 300000 && propertyValue <= 500000) {
          stampDutyResult = 480 + 3 * (propertyValue - 30000) / 100;
        } else {
          if (propertyValue > 500000 && propertyValue <= 750000) {
            stampDutyResult = 11400 + 4.32 * (propertyValue - 500000) / 100;
          } else {
            if (propertyValue > 750000 && propertyValue <= 1000000) {
              stampDutyResult = 22200 + 5.9 * (propertyValue - 750000) / 100;
            } else {
              if (propertyValue > 1000000 && propertyValue <= 1455000) {
                stampDutyResult = 36950 + 6.4 * (propertyValue - 1000000) / 100;
              } else {
                if (propertyValue > 1455000) {
                  stampDutyResult = 4.54 * propertyValue / 100;
                }
              }
            }
          }
        }
      }
    }
  }

  if (state == "Northern Territory") {
    if (propertyValue <= 500000 && isFirstHomeBuyer == 0 && propertyChoice == 0) {
      stampDutyResult = 0;
    } else if (propertyValue <= 525000) {
      stampDutyResult = (0.06571441 * propertyValue * 1 / 1000 * propertyValue * 1 / 1000) + 15 * propertyValue / 1000;
    } else {
      if (propertyValue > 525000 && propertyValue <= 3000000) {
        stampDutyResult = 4.95 * propertyValue / 100;
      } else {
        if (propertyValue > 3000000 && propertyValue <= 5000000) {
          stampDutyResult = 5.75 * propertyValue / 100;
        } else {
          if (propertyValue > 5000000) {
            stampDutyResult = 5.95 * propertyValue / 100;
          }
        }
      }
    }
    if (propertyValue > 500000 && propertyValue < 650000 && isFirstHomeBuyer == 0 && propertyChoice == 0) {
      stampDutyResult = stampDutyResult - 23928.60;
    }
  }

  if (state == "Tasmania") {
    if (propertyValue <= 3000) {
      stampDutyResult = 50;
    } else if (propertyValue >= 3000 && propertyValue <= 25000) {
      stampDutyResult = 50 + 1.75 * (propertyValue - 3000) / 100;
    } else {
      if (propertyValue > 25000 && propertyValue <= 75000) {
        stampDutyResult = 435 + 2.25 * (propertyValue - 25000) / 100;
      } else {
        if (propertyValue > 75000 && propertyValue <= 200000) {
          stampDutyResult = 1560 + 3.5 * (propertyValue - 75000) / 100;
        } else {
          if (propertyValue > 200000 && propertyValue <= 375000) {
            stampDutyResult = 5935 + 4 * (propertyValue - 200000) / 100;
          } else {
            if (propertyValue > 375000 && propertyValue <= 725000) {
              stampDutyResult = 12395 + 4.25 * (propertyValue - 375000) / 100;
            } else {
              if (propertyValue > 725000) {
                stampDutyResult = 27810 + 4.5 * (propertyValue - 725000) / 100;
              }
            }
          }
        }
      }
    }
    if (propertyValue <= 400000 && isFirstHomeBuyer == 0 && propertyChoice == 0) {
      stampDutyResult = stampDutyResult / 2;
    }
  }

  if (state == "Victoria") {
    if (propertyValue <= 25000) {
      stampDutyResult = 1.4 * propertyValue / 100;
    } else if (propertyValue >= 25000 && propertyValue <= 130000) {
      stampDutyResult = 350 + 2.4 * (propertyValue - 25000) / 100;
    } else {
      if (propertyValue > 130000 && propertyValue <= 960000) {
        stampDutyResult = 2870 + 6 * (propertyValue - 130000) / 100;
      } else {
        if (propertyValue > 960000) {
          stampDutyResult = 5.5 * (propertyValue) / 100;
        }
      }
    }
    if (propertyValue <= 600000 && isFirstHomeBuyer == 0 && propertyChoice == 0) {
      stampDutyResult = 0;
    }

    if (propertyValue >= 130000 && propertyValue <= 440000 && isFirstHomeBuyer == 1 && propertyChoice == 0) {
      stampDutyResult = stampDutyResult - (stampDutyResult * 14.2 / 100);
    }
    if (propertyValue >= 440000 && propertyValue <= 500000 && isFirstHomeBuyer == 1 && propertyChoice == 0) {
      stampDutyResult = stampDutyResult - 3100;
    }
  }

  return stampDutyResult;
}
