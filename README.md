ButtonStepperDemo
=================

This is a simple project to visualize the attributes of a custom UIButton subclass:

	- font color
	- border color
	- background color
	- shadow color

It also serves to demonstrate use of UIStepper buttons and a UIScrollView, and a 
simple implementation of NSUserDefaults.

In no particular order, here are some of the features and techniques used:

1. Use tags on UIStepper instances in Interface Builder to handle taps in a single selector.
2. Track UIStepper buttons with StepperID enum values.
3. Set reasonable default values for all button settings using #define constants.
4. Use NSUserDefaults to read/set existing preferences.
5. Create scrollable content in a UIScrollView.
6. Scroll image behind button to see how it behaves with plain or photo background.
