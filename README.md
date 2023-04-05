# Animated App with Rive and Flutter
## Onboarding controller
This is a Flutter code for a screen that displays an onboarding animation and a call-to-action button to create a custom xylophone. Here's a brief breakdown of the code:
The code defines a stateful widget OnbodingScreen that has a single required parameter key. It overrides the createState method to return a _OnbodingScreenState object.
_OnbodingScreenState is the state object for the OnbodingScreen widget. It contains a RiveAnimationController object _btnAnimationController for controlling the animation of the call-to-action button, and a boolean flag isShowSignInDialog to track whether a sign-in dialog is currently displayed.
In the initState method, the _btnAnimationController is initialized with an animation named "active" and autoplay set to false.
The build method returns a Scaffold widget that contains a Stack widget with several Positioned and AnimatedPositioned widgets for laying out the different components of the screen. The components include an image background, a blurred backdrop, a Rive animation, and the call-to-action button. The button is implemented using a custom AnimatedBtn widget that takes a title, a btnAnimationController, and a press callback function as parameters.
When the button is pressed, it navigates to a new screen EntryPoint, and the _btnAnimationController is activated to play the animation.
Note that some code is commented out, indicating that it might have been used for implementing a sign-in dialog but has been disabled.

## Entry point controller
This is a Flutter code for an app's entry point screen. The app has a sidebar menu that slides in and out from the left side of the screen when a button is pressed, and a main content area that transforms when the sidebar opens and closes. The main content area has a rounded rectangular shape, and its contents are displayed in a HomePage widget.

The EntryPoint widget is a stateful widget that holds the app's state. It has a bool property isSideBarOpen that tracks whether the sidebar is open or not, and two objects selectedBottonNav and selectedSideMenu that represent the currently selected items in the bottom navigation and the sidebar menu, respectively. It also has an animation controller _animationController and two animation objects scalAnimation and animation that control the transformation of the main content area.

The initState method initializes the animation controller and the animations, while the dispose method disposes of them when the widget is removed from the tree. The build method creates a Scaffold widget that contains a Stack widget. The Stack widget contains three children: the sidebar menu (SideBar widget), the main content area (a HomePage widget wrapped in a ClipRRect widget with a rounded rectangle border), and a menu button (MenuBtn widget) that toggles the sidebar.

The position and visibility of the sidebar and the main content area are controlled using the AnimatedPositioned and Transform widgets, which are animated using the animation controller and animations. The menu button is also animated using a Rive animation.

## Piano Widget controller
This code defines a widget called piano that returns an InkWell widget with a container that contains a row with some children. The widget takes three optional parameters: letter, color, and soundNumber.

When the user taps on the InkWell, the playSound function is called with the soundNumber argument, and the 'tapped' message is printed to the console using the debugPrint function. The InkWell widget also has its splashColor and highlightColor properties set to Colors.transparent to remove any default splash and highlight colors.

The Container widget has some padding and margin, and a BoxDecoration with a background color that defaults to a purple color defined by const Color(0xFF7553F6). The Row widget contains an Expanded widget that has a Column child, which displays the letter parameter passed to the widget in uppercase. The Row widget also contains a SizedBox widget with a VerticalDivider child, an Icon widget, and another SizedBox widget.

The VerticalDivider has a height of 40 and a color of Colors.white70, and the Icon has the Icons.numbers icon with a color of backgroundColorLight. The SizedBox widgets provide some spacing between the other widgets in the Row. The BuildContext object is not defined in this code and it's likely that it needs to be defined somewhere else in the code to use Theme.of(context) in the Text widget.

**Add widget for xylophone**
This is a Flutter code that builds a screen for a xylophone app with available courses and melodies. The screen consists of a column of widgets that are organized using a SingleChildScrollView and several Containers. The first Container displays the available courses using CourseCard widgets. The second Container displays the xylophone melodies, which are created using the piano function. At the bottom of the screen, there is a floating action button that opens a new screen when pressed.

The code also contains a List of AddWidgetForXylophone widgets, which is used to dynamically add new widgets to the screen. These widgets are displayed in a ListView at the bottom of the screen using the ListView.builder function. The addWidget() function adds a new widget to the list when called.

Overall, the code creates a visually appealing screen for a xylophone app with the ability to add new widgets dynamically.

## Home page controller
This is a Flutter code for a simple Piano app homepage. The HomePage widget is a StatefulWidget that has a single State, _HomePageState. The _HomePageState class has several methods that are responsible for playing sounds and generating random colors and sounds.

The listView() method returns a ListView.builder() widget that generates a list of sounds as a column of ListTile widgets. Each ListTile has a colored background and a title. Tapping on a ListTile will play a sound, and tapping on the music note icon will open a bottom sheet with a button to set a random sound. However, the onLongPress function to open the bottom sheet is commented out.

The code also contains a variable offset of type Offset, which is not used in the code provided.

## MyWidet
This code defines a StatefulWidget called MyWidget which displays a custom piano widget. It has a playSound method that plays a sound corresponding to a given number. The build method returns a Container widget that wraps the piano method. The piano method returns another Container widget with a custom design for the piano and a Row widget with a text label and an icon for the piano. When the user taps the piano, a random sound is played using the AudioCache class.


## Add custom widget
This is a Flutter widget that represents a custom controller that allows the user to add and remove a list of MyWidget widgets. The CustomController class extends StatefulWidget and its corresponding state class _CustomControllerState extends State<CustomController>.

The CustomController widget contains a ListView.builder that shows a list of MyWidget widgets. The list is managed by the _addDice() and _deleteDice() methods that add and remove widgets from the list instance variable respectively. These methods are called by the "Add" and "Delete" FloatingActionButtons respectively.
The widget also contains a FloatingActionButton that navigates the user back to the HomePage.
Note that backgroundColorDark is a color variable defined somewhere in the code that is used as the background color for the FloatingActionButtons. Also, MyWidget is a custom widget class that is not included in this code snippet

## output
<table>
  <tr>
    <td>      
      <video width="400" controls>
  <source src="[https://github.com/TariqMehmood1004/xylophone-app/blob/main/output/output.mp4](https://github.com/TariqMehmood1004/xylophone-app/blob/main/output/output.mp4)" type="video/mp4">
  Your browser does not support HTML video.
</video>
      
    </td>
  </tr>
 </table>



