random_chi
Generates random numbers using a chi-squared distribution.
#使用方分布生成随机数
Prototype #模板
	function random_chi (
		df [1] : numeric,                       
		N  [*] : byte, short, integer or long   
	)

	return_val [dimsizes(N)] :  float or double
Arguments #参数
df
A scalar representing the degrees of freedom of the chi-square distribution (0, +infinity). #表示卡方分布(0,+无穷)的标量

N
Dimensions of the multi-dimensional array to be generated.
#生成的多维数组的维数
As of version 6.0.0, N can be of type long, allowing dimension sizes greater than or equal to 2 gigabytes (GB) on 64-bit systems.
#从6.0.0版本开始，N可以是long类型，在64位系统上允许大于或等于2GB的维度大小
Return value
Returns an array of random numbers dimensioned the same as N.
#返回值为和N维度相等的随机数组
The return type is floating point if the input is floating point, and double if the input is of type double.
#如果输入是浮点类型，则返回类型为浮点，如果输入是doule类型，则返回类型为doule
Description #描述
This function generates an array of random numbers using a chi-squared distribution. If the user does not explicitly set initial values for seeds via random_setallseed, those initial seeds will be set to default values. It is recommended that the user specify these seeds.
#该函数使用卡方分布生成随机数组。如果用户没有通过random_setallseed函数为seeds设置初值，那么这些初始seeds将会被设置为默认值。建议用户制定这些seeds。

The source of this random number generator is from the random section at Netlib. The authors were Brian Brown and James Lovato. The official reference is:
#这个随机数生成器的源代码来自Netlib的random部分，作者是Brian Brown and James Lovato.官方参考资料如下
Authors: P. L'Ecuyer and S. Cote'
Title: Implementing a Random Number Package with Splitting Facilities
Journal: ACM Transactions on Mathematical Software 17:1, pp 98-111.

See Also
random_gamma, random_normal, random_uniform, random_setallseed

Examples
Example 1

Generate random deviates:  #生成随机偏差

begin
  random_setallseed(36484749, 9494848)        ; Set seeds (suggested, NOT required)
  df    = 2.0
  chi   = random_chi(df, 1)                  ; chi is a scalar
end