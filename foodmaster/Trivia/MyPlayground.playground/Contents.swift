var nums:[Int] = [1,2,7,6,100,56,999,45,300]

var ma1 = -100000
var mi1 = 100000
var ma2 = -100000

for i in nums{
    if i>ma1{
        ma1=i
    }
    if i<mi1{mi1=i}
    if i<ma1 && i>ma2{
        ma2=i
    }
}
print(ma1, ma2, mi1)
