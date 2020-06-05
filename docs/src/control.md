## Idea used

Here, we are using xrandr to get the brightness of the image frame. The brightness range should be (0, 1]. The corresponding primary display device is also returned at the same time.

**This doesn't change brightness of image frame through hardware.**

## _setBrightness() function

The brightness of the image frames is fetched using ``xrandr``. The value is set between (0, 1]. Respective error messages are shown if the criteria is not fulfilled.

## _getDisplay() function

The current display device is searched using the regex criteria and is returned simultaneously. Respective error messages are shown if the criteria is not fulfilled.

## Usage
include("control.jl")
