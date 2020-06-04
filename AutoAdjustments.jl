module AutoAdjustments
export autoAdjustments()
import b_idx(), compute_contr()
using ImageCore, StatsBase

function map_contrast_to_brightness():
    img_n0f16_raw = rawview(img_n0f8)
    img = float.(img_n016_raw)  
#= assigning an image to a matrix object for now. I will be using
high and low contrast values later. =#

#= Compute the laplacian of the gray scale of the image. obtain
the max value using minMacLoc. call it maxval. Estimate your 
sharpness/brightness index as - (maxval * average V channel values)
/ (average of the hist values from 0th channel), as said above. This
would give certain values. Low bright images are usually below 30. 
30 - 50 can b taken as ok images. and above 50 as bright images.
After that, a standardize function is called to keep the range from 0.5
to 1.0. =#

    t = size(img)
    rows = t[0]
    columns = t[1]
    h, v = b_idx(img)
    h_avg = h/(rows*columns)
    v_avg = v/(rows*columns)

    ahigh, alow = compute_contr(img)

    brightness = (ahigh * v_avg)/h_avg

    std_bright = standardize(UnitRangeTransform, brightness)
    return std_bright
    end


end


