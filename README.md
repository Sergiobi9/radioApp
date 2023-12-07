# Radio App

To fetch the radio stations list you need to run this [project](https://github.com/Sergiobi9/radioApi) first. Follow the instructions to clone and install the dependencies.

Once you have the Radio Api project running, you must get your IP address and change the BASE_URL variable in the Radio App project. It is in the environment.dart class.

  ```
  static String BASE_URL = "{yourIpAddress}:3001";
  ```

Some functionalities to take into account:

  - Fetch the radio stations given a country, the initial country is Spain
  - Search for a radio station
  - Press a radio station from the list to start reproducing
  - Once a radio station is pressed, a bottom panel will show with the radio station playing and some options as:
      - Swipe right the panel it reproduces the next radio station from the list
      - Swipe left the panel it reproduces the previous radio station from the list
      - Press the panel it goes to the radio station detail page
      - Press the shuffle button to reproduce a random radio station when you swipe left or right
      - Press the play or pause button to stop or play the audio from the radio station stream
   
  - In the radio station detail, if you press the image it stops or plays the radio station stream
  - The shuffle button is also there, to reproduce a random radio station when pressing the skip previous or skip next buttons
  - Press the skip buttons to go to the previous or next buttons (if shuffle is not enabled)
  - Press the share button to share the stream link
  - Change the volume with the bottom slider

And thats it!

Here is a [demo](https://www.youtube.com/watch?v=eW7COeAszZo&ab_channel=SergiObiols) of what the app does


