module AutoAdjustments
export autoAdjustments()

using ImageCore

img_n0f16_raw = rawview(img_n0f8)
float.(img_n016_raw)

alow = img.min()
ahigh = img.max()
amax = 255
amin = 0

function autoAdjustments_with_convertScaleAbs(img):
    # calculate alpha, beta
    alpha = ((amax - amin) / (ahigh - alow))
    beta = amin - alow * alpha
    # perform the operation g(x,y)= α * f(x,y)+ β
    new_img = cv2.convertScaleAbs(img, alpha=alpha, beta=beta)

    return [new_img, alpha, beta]
end

function autoAdjustments(img):
    # create new image with the same size and type as the original image
    new_img = zeros(img.shape, img.dtype)

    # calculate stats
    alow = img.min()
    ahigh = img.max()
    amax = 255
    amin = 0

    # access each pixel, and auto adjust
    for x in range(img.shape[1]):
        for y in range(img.shape[0]):
            a = img[x, y]
            new_img[x, y] = amin + (a - alow) * ((amax - amin) / (ahigh - alow))

    return new_img
        end
    end
end

