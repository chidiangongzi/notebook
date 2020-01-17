###stat_dispersion
Computes a number of robust statistics.
#计算大量的鲁棒统计数据
#(鲁棒性：指系统在扰动或不确定的情况下仍能保持它们的特征行为。)
Prototype #模板
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"  ; This library is automatically loaded #这个库是自动加载的
                                                             ; from NCL V6.2.0 onward. #需要6.2.0以上版本的ncl
                                                             ; No need for user to explicitly load.  #没有额外明确需要加载的

	function stat_dispersion (
		x    : numeric,  
		opt  : logical   
	)

	return_val  :  [30]
Arguments  #参数
x
An array of any numeric type. #任何数字类型的数组
opt  #option 选项
Setting opt=True and opt@PrintStat=True means that the function will print the calculated statistics.
# 设置opt=True和opt@PrintStat=True意味着 函数将输出计算的统计数据
Return value
The results are returned in a one dimensional array of size [30]. Double if x is type "double"; otherwise, "float".
#结果将返还一维的大小为30的数组，如果x的类型是"doule"则双倍，否则,"float"
Description #描述
This function is intended for large dataset sizes. It sorts the non-missing data values and uses the index values to extract the dectile, octile, sextile, quartile, tritile values. It does not do anything special with replicated values. It does not perform linear interpolation like "Minitab".
#此函数适用于大型数据集，对未丢失的数据进行排序，并使用索引值提取十分位数、八分位数、六分位数、四分位数、三分位数的值。对复制的值不做任何特殊的处理，它不像"Minitab"执行线性插值

Currently the returned statistics (here, STATX) include:
#当前返回的统计信息（此处为STAX)包括

               Mean="+STATX(0)      ; average of all values" #均值
             StdDev="+STATX(1)      ; standard deviation" #标准偏差
                Min="+STATX(2)      ; minimum" #最小值
             LowDec="+STATX(3)      ; lower dectile" #下十分位数
             LowOct="+STATX(4)      ; lower octile" #下八分位数
             LowSex="+STATX(5)      ; lower sextile" #下六分位数
        LowQuartile="+STATX(6)      ; lower quartile" #下四分位数
             LowTri="+STATX(7)      ; lower tritile" #下三分位数
             Median="+STATX(8)      ; median" #中位数数
            HighTri="+STATX(9)      ; upper tritilei" #上三分位数
       HighQuartile="+STATX(10)     ; upper quartile" #上四分位数
            HighSex="+STATX(11)     ; upper sextile" #上六分位数
            HighOct="+STATX(12)     ; upper octile" #上八分位数
            HighDec="+STATX(13)     ; upper dectile" #上十分位数
                Max="+STATX(14)     ; maximum" #最大值
              Range="+STATX(15)     ; Max(x) - Min(x)" #最大值-最小值的
         Dispersion="+STATX(16)     ; Range/STATX(1)" # 离散
        RMS Anomaly="+STATX(17)     ; sqrt( (x-xAvg)^2/N ) where N=# non-missing values"
        #均方根异常
          #   Total="+STATX(18)     ; Total number of input values
          #    Used="+STATX(19)     ; Number of input values used for statistics
          # Missing="+STATX(20)     ; Number of missing values
          % Missing="+STATX(21)     ; percent of missing values" #缺失值所占比重

                                    ; STATX(22 to 29) added for v6.1.0
                                    ; STATX(22 to 27) require more than 1000 observations
                                    ; Otherwise, they are set to _FillValue

         Lower 0.1%="+STATX(22)     ; lower 0.1%   => 0.1th percentile
         Lower 1.0%="+STATX(23)     ; lower 1.0%   => 1th
         Lower 5.0%="+STATX(24)     ; lower 5.0%   => 5th
         Upper 5.0%="+STATX(25)     ; upper 5.0%   => 95th percentile
         Upper 1.0%="+STATX(26)     ; upper 1.0%   => 99th 
         Upper 0.1%="+STATX(27)     ; Upper 0.1%   => 99.9th 

           Skewness="+STATX(28)     ; Skewness    
           Kurtosis="+STATX(29)     ; Kurtosis    

See Also
avg, stddev, dim_stat4, dim_stat4_n, dim_avg, dim_avg_n, dim_stddev, dim_stddev_n, dim_median, dim_median_n

Examples
The following require that contributed.ncl be loaded prior to invoking the function.
# 以下例子均要求在调用函数前加载contributed.ncl的库
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
Example 1

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

  b   = random_chi    (2   , (/1000/))

  opt = True
  opt@PrintStat = True
  statb = stat_dispersion(b, opt )
will yield
See http://www.ncl.ucar.edu/ for more details.
(0)      
(0)        ===> Robust Dispersion Statistics <===
(0)      [0]            Mean=1.96763
(0)      [1]          StdDev=1.94921
(0)      [2]             Min=0.00386701
(0)      [3]          LowDec=0.217212
(0)      [4]          LowOct=0.284452
(0)      [5]          LowSex=0.383918
(0)      [6]     LowQuartile=0.592704
(0)      [7]          LowTri=0.783372
(0)      [8]          Median=1.34768
(0)      [9]         HighTri=2.21197
(0)      [10]   HighQuartile=2.75091
(0)      [11]        HighSex=3.55215
(0)      [12]        HighOct=4.0649
(0)      [13]        HighDec=4.39585
(0)      [14]            Max=12.4941
(0)      [15]          Range=12.4903
(0)      [16]     Dispersion=6.40786
(0)      [17]    RMS Anomaly=1.94824
(0)      [18]      #   Total=1000
(0)      [19]      #    Used=1000
(0)      [20]      # Missing=0
(0)      [21]      % Missing=0
(0)	 [22]     Lower 0.1%=0.00386701
(0)	 [23]     Lower 1.0%=0.0306022
(0)	 [24]     Lower 5.0%=0.112683
(0)	 [25]     Upper 5.0%=5.76009
(0)	 [26]     Upper 1.0%=9.32739
(0)	 [27]     Upper 0.1%=12.0497
(0)      [28]       Skewness=1.85963
(0)      [29]       Kurtosis=4.42162

  
Example 2: Very similar but the user prints the values.

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"


  a   = random_normal (0,50, (/64,128/))
  b   = random_chi    (2   , (/1000/))
  c   = random_gamma  (75,2, (/50,100/))

  opt   = False
  stata = stat_dispersion(a, opt )
  statb = stat_dispersion(b, opt )
  statc = stat_dispersion(c, opt )

  nStat = num(.not.ismissing(stata))
  statLabel = new ( nStat, "string")

  statLabel = (/ "    mean", "  stddev", "     min" \
               , "  lowDec", "  LowOct", "  LowSex" \
               , "LowQuart", "  LowTri" \
               , "  Median" \
               , "   HiTri", " HiQuart","   HiSex","   HiOct", "   HiDec" \
               , "     Max", "   Range","  Disper","     RMS" \
               , "    nTot", "    nUse","    nMsg","    %Msg" /)


	print(statLabel+"	 " \
			+sprintf("%9.5f", stata(0:nStat-1))+"	 " \
			+sprintf("%9.5f", statb(0:nStat-1))+"	 " \
			+sprintf("%9.5f", statc(0:nStat-1)) )
	The print yields (titles added):
		Normal				 Chi			Gamma
		(0)			mean		-0.50953		 2.06056		 0.02719
		(1)		stddev		49.86744		 2.01248		 0.01904
		(2)			 min	-202.86754		 0.00221		 0.00012
		(3)		lowDec	 -64.91030		 0.24242		 0.00730
		(4)		LowOct	 -58.03373		 0.29952		 0.00834
		(5)		LowSex	 -48.72330		 0.39296		 0.01013
		(6)	LowQuart	 -33.34077		 0.61729		 0.01310
		(7)		LowTri	 -21.46025		 0.87286		 0.01633
		(8)		Median		-0.80563		 1.39053		 0.02284
		(9)		 HiTri		21.11183		 2.31731		 0.03127
		(10)	 HiQuart		33.43311		 2.90952		 0.03675
		(11)		 HiSex		47.70136		 3.63185		 0.04362
		(12)		 HiOct		56.36256		 4.26664		 0.04851
		(13)		 HiDec		62.17917		 4.70950		 0.05222
		(14)			 Max	 182.83937		15.80180		 0.16530
		(15)		 Range	 385.70691		15.79958		 0.16518
		(16)		Disper		 7.73464		 7.85079		 8.67700
		(17)			 RMS		49.86436		 2.01148		 0.01903
		(18)			nTot	8192.00000	1000.00000	5000.00000
		(19)			nUse	8192.00000	1000.00000	5000.00000
		(20)			nMsg		 0.00000		 0.00000		 0.00000
		(21)			%Msg		 0.00000		 0.00000		 0.00000
		(22)				0.1%	 -153.01517		0.00189		 0.00061
		(23)				1.0%	 -117.51499		0.01804		 0.00195
		(24)				5.0%	 -84.37138		 0.08294		 0.00486
		(25)			 95.0%		82.00737		 5.87699		 0.06296
		(26)			 99.0%	 116.81857		 7.92976		 0.08951
		(27)			 99.9%	 155.62813		13.01617		 0.12813
		(28)		Skewness		-0.00585		 1.64650		 1.46050
		(29)		Kurtosis		 0.02865		 3.99830		 3.46480
