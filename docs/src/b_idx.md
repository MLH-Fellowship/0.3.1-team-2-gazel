## HSV channels

HSV is cylindrical geometry, with hue, the angular dimension, starting at the red primary at 0°, passing through the green primary at 120° and the blue primary at 240°, and then wrapping back to red at 360°. In each geometry, the central vertical axis comprises the neutral, achromatic, or gray colors ranging, from top to bottom, white at lightness 1 (value 1) to black at lightness 0 (value 0). 

## Idea used 

We need to find the average of the H and V values which is further used in ``autoAdjustments.jl``to calculate the mapping of brightness using bright pixels. 

## br_ind() function

This function returns the summation of the values of H channel and V channel.

## Usage

include("b_idx.jl")