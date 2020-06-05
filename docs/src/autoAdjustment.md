## Idea used

Here, we are mapping the expected brightness of the image frame according to the surroundings. the top 5% bright pixels values is computed and used as ``ahigh``. Then estimation of the sharpness/brightness index is calculated as - (ahigh * average V channel values)/ (average of the hist values from 0th channel), as said above. This would give certain values. Low bright images are usually below 30. 30 - 50 can be taken as medium bright images and above 50 as bright images. After that, a standardize function is created to keep the range from 0.5 to 10.0. This returns the standarize brightness values.

## map_contrast_to_brightness() function

This returns the standarize brightness values.

## Usage
include("autoAdjustment.jl")
