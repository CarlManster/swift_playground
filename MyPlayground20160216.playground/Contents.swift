//: Playground - noun: a place where people can play

import UIKit

var str : NSString = "Hello, playground"

var labelTmp0 : UILabel = UILabel(frame: CGRectMake(0, 0, 200, 20));
labelTmp0.textColor = UIColor(white: 1.0, alpha: 1.0);
labelTmp0.textAlignment = NSTextAlignment.Center;
labelTmp0.text = str as String;