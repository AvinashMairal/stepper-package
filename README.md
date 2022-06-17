# Horizontal Stepper

Horizontal Stepper package that gives simple customized stepper with progress to your app.

## Installation

1. Add the latest version of package to your pubspec.yaml (and rundart pub get):

dependencies:
  horizontal_stepper: ^0.0.1

2. Import the package and use it in your Flutter App.

import 'package:horizontal_stepper/horizontal_stepper.dart';


## Example

There are a number of properties that you can modify:

- current stepper | completed stepper | uncompleted stepper - color
- size of stepper
- text style of stepper title

<hr>

<table>
    <tr>
        <td>
           ''' @override
            Widget build(BuildContext context) {
                return Center(
                    child:HorizontalStepper(
                        stepsData:["step1","step2","step3],
                        onTap:(page){
                            print("navigate to selected page/step : $page")
                        }
                        ),
                    ); 
            }'''
        </td>
    </tr>
</table>

![1655471561034_100](https://user-images.githubusercontent.com/63536458/174306477-289d50de-8330-447d-a002-91f95a56add2.PNG)




# Next Goals

- [] more features in stepper like change stepper icon.
- [] customization of stepper divider. 


