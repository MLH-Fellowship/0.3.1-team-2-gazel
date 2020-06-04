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
        
        # decrease the image size by a factor of 8 to
        # decrease the load of computation
        rgbImg = imresize(rgbImg, ratio=1/8)

        # convet rgb to hsl color space
        singleChannel = _processImage(rgbImg, "HSL")

        # Find what brightness should have been at this stage
        toBeBrightness = max(0.05, min(1.0, sum(singleChannel)/length(singleChannel)))

        # find the start and end from solution
        endIndex = searchsortedfirst(arsol, toBeBrightness*10)
        startIndex = searchsortedfirst(arsol, prevBrightness*10)

        # Change the brightness gradually 
        if startIndex < endIndex
            for i in startIndex:endIndex
                _setBrightness(display, min(arsol[i]/10 + 0.3, 1.0))
            end
        else
            for i in endIndex:startIndex
                _setBrightness(display, min(arsol[i]/10 + 0.3, 1.0))
            end
        end
        # _setBrightness(display, brightness)
        prevBrightness = toBeBrightness
    end
end


"""
    _processImage()

Handles the image processing part which will
be taken by contrast finder
pType: Eithe gray or HSL with default value gray
returns: A single channel matrix
"""
function _processImage(img, pType="gray")
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