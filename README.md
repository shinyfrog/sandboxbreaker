# sandboxbreaker
A simple project that shows the Apple Sandbox file limit bug on macOS.
[Open Radar link](http://openradar.appspot.com/13006144)

## How to reproduce the bug
Open more than 4k files with the sample app using the open panel or by dragging in the blue view, the app will try to read all those file and will update a counter. The counter should be equal to the number of files dropped, if not you’ve just reproduced the bug.

You can download a zip containing more than 5k files here: [5k files zip](https://sf-applications.s3.us-east-1.amazonaws.com/5162_icons.zip)

## Updates
* **03 August 2021**: the bug still exist in macOS 11.4
* **30 October 2019**: the bug still exist in macOS 10.14.5 and 10.15.1
