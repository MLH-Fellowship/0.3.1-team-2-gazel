
"""
    br_ind()

Gives the sum of values of H and V channel
"""
function br_ind(x::AbstractArray{<:Number, 3})
    sum1=0
    sum2=0
    for i in x[:,:,1]
        sum1+=i
    end
    for i in x[:,:,3]
        sum2+=i
    end
    return sum1,sum2
end
