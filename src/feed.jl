using VideoIO, Images, DifferentialEquations, DataStructures, ImageTransformations
include("control.jl")
include("cal_contr.jl")

"""
    _start()

Main function which starts the video feed
    and calls subsequent functions
"""
function _start(display, arsol)
    cam = VideoIO.opencamera()

    # set the previous brightness to 1
    prevBrightness = 1.0
    _setBrightness(display, prevBrightness)

    n = 0
    while true
        n = (n+1)%10
        rgbImg = read(cam)
        if n != 0
            continue
        end
        rgbImg = imresize(rgbImg, ratio=1/8)
        singleChannel = processImage(rgbImg, "HSL")
        toBeBrightness = min(1.0, sum(singleChannel)/length(singleChannel))
        startIndex = searchsortedfirst(arsol, toBeBrightness*10)
        endIndex = searchsortedfirst(arsol, prevBrightness*10)
        
        # println(searchsortedfirst(arsol,brightness*10))
        # _setBrightness(display, brightness)
        # println(size(singleChannel))
    end
end


"""
    processImage()

Handles the image processing part which will
be taken by contrast finder
pType: Eithe gray or HSL with default value gray
returns: A single channel matrix
"""
function processImage(img, pType="gray")
    if pType == "gray"
        return Gray.(img)
    elseif pType == "HSL"
        hslImg = HSL.(img)
        channels = channelview(float.(hslImg))
        return channels[3,:,:]
    end
end

# display = _getDisplay()
# _start(display)