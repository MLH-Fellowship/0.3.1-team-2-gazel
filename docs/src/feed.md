## Idea used

Here, we are using VideoIO.jl package to start the webcamera and get the feed as image frames. Function calls occur to get the brightness of the image frame. Image processing is done to get the default single channel matrix.

## _start() function

This function starts the video feed and gets the real time brightness value of the image frames.

## _processImage() function

Image pre-processing is handled which checks if it is ``HSL`` or ``Gray`` and converts it into a single channel matrix using ``channelview()`` function. This function is further used in ``cal_contr.jl``.

## Usage
include("feed.jl")
