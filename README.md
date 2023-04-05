# Animated App with Rive and Flutter

##Onboarding controller
This is a Flutter code for a screen that displays an onboarding animation and a call-to-action button to create a custom xylophone. Here's a brief breakdown of the code:
The code defines a stateful widget OnbodingScreen that has a single required parameter key. It overrides the createState method to return a _OnbodingScreenState object.
_OnbodingScreenState is the state object for the OnbodingScreen widget. It contains a RiveAnimationController object _btnAnimationController for controlling the animation of the call-to-action button, and a boolean flag isShowSignInDialog to track whether a sign-in dialog is currently displayed.
In the initState method, the _btnAnimationController is initialized with an animation named "active" and autoplay set to false.
The build method returns a Scaffold widget that contains a Stack widget with several Positioned and AnimatedPositioned widgets for laying out the different components of the screen. The components include an image background, a blurred backdrop, a Rive animation, and the call-to-action button. The button is implemented using a custom AnimatedBtn widget that takes a title, a btnAnimationController, and a press callback function as parameters.
When the button is pressed, it navigates to a new screen EntryPoint, and the _btnAnimationController is activated to play the animation.
Note that some code is commented out, indicating that it might have been used for implementing a sign-in dialog but has been disabled.

##Entry point controller
This is a Flutter code for an app's entry point screen. The app has a sidebar menu that slides in and out from the left side of the screen when a button is pressed, and a main content area that transforms when the sidebar opens and closes. The main content area has a rounded rectangular shape, and its contents are displayed in a HomePage widget.

The EntryPoint widget is a stateful widget that holds the app's state. It has a bool property isSideBarOpen that tracks whether the sidebar is open or not, and two objects selectedBottonNav and selectedSideMenu that represent the currently selected items in the bottom navigation and the sidebar menu, respectively. It also has an animation controller _animationController and two animation objects scalAnimation and animation that control the transformation of the main content area.

The initState method initializes the animation controller and the animations, while the dispose method disposes of them when the widget is removed from the tree. The build method creates a Scaffold widget that contains a Stack widget. The Stack widget contains three children: the sidebar menu (SideBar widget), the main content area (a HomePage widget wrapped in a ClipRRect widget with a rounded rectangle border), and a menu button (MenuBtn widget) that toggles the sidebar.

The position and visibility of the sidebar and the main content area are controlled using the AnimatedPositioned and Transform widgets, which are animated using the animation controller and animations. The menu button is also animated using a Rive animation.

##Piano Widget controller
This code defines a widget called piano that returns an InkWell widget with a container that contains a row with some children. The widget takes three optional parameters: letter, color, and soundNumber.

When the user taps on the InkWell, the playSound function is called with the soundNumber argument, and the 'tapped' message is printed to the console using the debugPrint function. The InkWell widget also has its splashColor and highlightColor properties set to Colors.transparent to remove any default splash and highlight colors.

The Container widget has some padding and margin, and a BoxDecoration with a background color that defaults to a purple color defined by const Color(0xFF7553F6). The Row widget contains an Expanded widget that has a Column child, which displays the letter parameter passed to the widget in uppercase. The Row widget also contains a SizedBox widget with a VerticalDivider child, an Icon widget, and another SizedBox widget.

The VerticalDivider has a height of 40 and a color of Colors.white70, and the Icon has the Icons.numbers icon with a color of backgroundColorLight. The SizedBox widgets provide some spacing between the other widgets in the Row. The BuildContext object is not defined in this code and it's likely that it needs to be defined somewhere else in the code to use Theme.of(context) in the Text widget.



