import DataStructures
using DataStructures

A = rand(Int16, 70, 80) #just a random array here. Will be replaced by the image pixel intensity values

n,m = size(A)
sz = 0.05 * (n * m)
println(sz)
pq_max = PriorityQueue()
pq_min = PriorityQueue()
convert(Int,sz)
cntr=0
for i in eachindex(A)
        global cntr
        cntr+=1
           if cntr<=sz
               enqueue!(pq_max, i, A[i])
           else
               enqueue!(pq_max, i, A[i])
               dequeue!(pq_max)
           end
           if cntr<=sz
               enqueue!(pq_min, i, -A[i])
           else
               enqueue!(pq_min, i, -A[i])
               dequeue!(pq_min)
           end
       end
contrast = 0
cntr=sz
while cntr>0
    global cntr
    global contrast
    cntr-=1
    contrast +=peek(pq_max).second
    contrast +=peek(pq_min).second
    dequeue!(pq_max)
    dequeue!(pq_min)
end

contrast /= sz

println(contrast)
