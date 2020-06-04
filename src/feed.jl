using VideoIO, Images
include("control.jl")
include("cal_contr.jl")


"""
    _start()

Main function which starts the video feed
    and calls subsequent functions
"""
function _start(display)
    cam = VideoIO.opencamera()
    n = 0
    while true
        n += 1
        if n%10 != 0
            continue
        end
        rgbImg = read(cam)
        singleChannel = processImage(rgbImg, "HSL")
        brightness = min(1.0, sum(singleChannel)/length(singleChannel)+0.3)
        _setBrightness(display, brightness)
        println(size(singleChannel))
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

display = _getDisplay()
_start(display)
