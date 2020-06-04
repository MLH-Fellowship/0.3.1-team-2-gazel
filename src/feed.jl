using VideoIO, Images


"""
    start()

Main function which starts the video feed
    and calls subsequent functions
"""
function start()
    cam = VideoIO.opencamera()
    n = 0
    while true
        n += 1
        if n%10 != 0
            continue
        end
        rgbImg = read(cam)
        singleChannel = processImage(rgbImg)
        println(length(singleChannel))
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
