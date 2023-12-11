# FlutterStepIndicator (0.1.7)

[![pub package](https://img.shields.io/pub/v/flutter_stepindicator.svg)](https://pub.dev/packages/flutter_stepindicator)
[![pub points](https://img.shields.io/pub/points/flutter_stepindicator?color=2E8B57&label=pub%20points)](https://pub.dev/packages/flutter_stepindicator/score)


**FlutterStepIndicator** is a versatile Flutter widget designed for creating step indicators to visualize multi-step processes. It offers extensive customization options and features to enhance the user experience.

<img src="https://github.com/PuzzleTakX/flutter_stepindicator/blob/master/demo/4.gif?raw=true" alt="image_demo" width="260" height="600">

## Features update version (0.1.7)


1. **OnClick Functionality for Step Indicator:**
    - Description of the onClick feature and its significance.

2. **Padding for Bulbs (PaddingBubble):**
    - Explanation of the padding added to the bulbs in the step indicator.

3. **Padding for Line in Step Indicator (PaddingLine):**
    - Details about the added padding for the line in the step indicator.

4. **Automatic Scrolling Enhancement (Auto Scroller):**
    - Explanation of improvements made to the automatic scrolling feature.

5. **Customizable Item Display (Show Items):**
    - Information on how users can customize the number of displayed items in the step indicator.

6. **Bug Fix for Counter Display (Fix Bug):**
    - Description of the bug related to the counter display and how it has been addressed.



## Features


- **Step Display**: Easily visualize a list of steps or stages in an appealing format.

- **Current Step Highlight**: Highlight the current step for easy progress tracking.

- **Customization**: Customize the appearance of active and inactive steps, including color choices.

- **Custom Checkmarks**: Option to use custom widgets, such as checkmarks, for success indicators.

- **Animations**: Configure animation durations for smooth step transitions and custom animations.

- **Personalization**: Tailor step colors, sizes, and shapes to match your app's design.

- **Step Change Notifications**: Implement custom actions on step changes using the `onChange` callback.

- **Selectability and Validation**: Control step selectability to guide user interactions.

**FlutterStepIndicator** is suitable for various applications, including registration flows, user tutorials, and task progress tracking.


## Demo new

<img src="https://github.com/PuzzleTakX/flutter_stepindicator/blob/master/demo/1.jpg?raw=true" alt="image_demo" width="260" height="600">

<img src="https://github.com/PuzzleTakX/flutter_stepindicator/blob/master/demo/2.jpg?raw=true" alt="image_demo" width="260" height="600">

<img src="https://github.com/PuzzleTakX/flutter_stepindicator/blob/master/demo/3.gif?raw=true" alt="image_demo" width="260" height="600">

## Installation ☺

To use the FlutterStepIndicator package, add the following dependency to your `pubspec.yaml`
file:

[![pub package](https://img.shields.io/pub/v/flutter_stepindicator.svg)](https://pub.dev/packages/flutter_stepindicator)
```yaml
dependencies:
flutter_stepindicator: ^0.0.2
```
Then, run `flutter pub get` to fetch the package.

## Usage

Import the package in your Dart file:

```dart
import 'package:flutter_step_indicator/flutter_step_indicator.dart';
```

Create a `FlutterStepIndicator` widget and provide the necessary parameters:

```dart
FlutterStepIndicator(
height: 20, // Set the height of the step indicator.
disableAutoScroll: false, // Enable or disable automatic scrolling.
list: yourStepList, // Provide a list of steps or stages to display.
onChange: (int index) {
// Define a callback function that triggers when the active step changes.
// You can perform actions based on the selected step here.
},
page: yourCurrentStep, // Specify the current step or page.
positiveCheck: yourCustomCheckmarkWidget, // Optionally, use a custom checkmark widget.
positiveColor: yourColor, // Customize the color of positive (active) steps.
negativeColor: yourColor, // Customize the color of negative (disabled) steps.
progressColor: yourColor, // Customize the color of the progress indicator.
durationScroller: yourDuration, // Set the duration for scrolling animations.
durationCheckBulb: yourDuration, // Set the duration for checkmark bulb animations.
division: yourDivision, // Specify the number of divisions for rendering steps.
),
```
Used this example

```dart
      FlutterStepIndicator(
                height: 20,
                disableAutoScroll: false,
                list: list,
                onChange: (i){},
                page: page,),
            ), 
```
 #Parameters

``
height: The height of the step indicator.
disableAutoScroll: A boolean flag to enable or disable automatic scrolling.
list: A list of steps or stages to be displayed.
onChange: A callback function invoked when the active step changes.
page: The current step or page in the process.
positiveCheck: An optional custom widget for displaying checkmarks.
positiveColor: Customize the color of positive (active) steps.
negativeColor: Customize the color of negative (disabled) steps.
progressColor: Customize the color of the progress indicator.
durationScroller: Set the duration for scrolling animations.
durationCheckBulb: Set the duration for checkmark bulb animations.
division: The number of divisions for rendering steps.
``
Feel free to modify and expand upon this example and description in your GitHub README to provide more context and usage instructions for your FlutterStepIndicator class.

## Tags
- Flutter
- Step Indicator
- Widget

## Example

For a complete example of using the NavigationView package, refer to
the [example](https://github.com/PuzzleTakX/flutter_stepindicator/tree/master/example) provided.

## License

This package is released under the MIT License. See the [LICENSE](https://github.com/PuzzleTakX/flutter_stepindicator/blob/master/LICENSE)
file for more details.

## Credits

NavigationView is developed and maintained by [puzzleTak](https://github.com/PuzzleTakX).