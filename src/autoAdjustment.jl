using ImageCore, StatsBase
include("b_idx.jl")

function map_contrast_to_brightness(img)

    #= assigning an image to a matrix object for now. I will be using
    high and low contrast values later. =#

    #= Compute the laplacian of the gray scale of the image. obtain
    the max value using minMacLoc. call it maxval. Estimate your 
    sharpness/brightness index as - (maxval * average V channel values)
    / (average of the hist values from 0th channel), as said above. This
    would give certain values. Low bright images are usually below 30. 
    30 - 50 can b taken as ok images. and above 50 as bright images.
    After that, a standardize function is called to keep the range from 0.5
    to 10.0. =#

    t = size(img)
    rows = t[1]
    columns = t[2]
    h, v = br_ind(img)
    h_avg = h/(rows*columns)
    v_avg = v/(rows*columns)

    ahigh, alow = compute_contr(img)

    brightness = (ahigh * v_avg)/h_avg

    min = 0.5
    max = 10

    std_bright = min + ((brightness-min)/((max-min)/2))*(max-min)
    return std_bright
end
