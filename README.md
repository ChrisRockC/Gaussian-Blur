# Gaussian-Blur
高斯模糊效果
## 简介
###Core image
`Core image` 是iOS5 新增加的框架，它有着优秀的图像处理功能，对来对基于像素的图像进行操作与分析，iOS提供了很多的滤镜（`Filter`）, 开发者耳可以组合多种滤镜，形成自己想要的效果。
### CIImage
CIImage 不仅包含元图像数据，还包含在元图像上的滤镜链。CIImage不是直接由UIImage转化来的。他有几种创建方式：

* 1.CIImage*image=[CIImage imageWithContentsOfURL:myURL];  
* 2.CIImage*image=[CIImage imageWithData:myData];  
* 3.CIImage*image=[CIImage imageWithCGImage:myCgimage];  
* 4.CIImage*image=[CIImage imageWithCVPixelBuffer:CVBuffer];  

### CIFilter
滤镜是通过键值来设置的。
### CIContext
CIContext是用来渲染CIImage的,将作用在CIImage的滤镜链应用到原始的图片数据中。CIContext是可以基于CPU，也是可以基于GPU的。默认是基于CPU的；两者对比：
* CPU是使用GCD来渲染的，这样就可以在后台异步执行渲染。应用场景可以是对一些加上滤镜效果的照片保存，防止因为退出程序而导致的保存失败，可以使用CPU渲染
* GPU渲染速度比CPU快，但是无法在后台执行，对一些复杂图像但是不考虑在后台异步执行可以使用GPU
### 注意事项
* 滤镜和渲染操作也会对主线程造成影响。应该将CoreImage滤镜渲染操作放在后台线程执行，当这些操作介绍后在返回主线程进行界面的更新。
* 不要对CIImage重复使用滤镜，这是叠加效果而不是替换
* 当滤镜太多，更改频率太高的情况要注意可能会出现程序崩溃，内存泄露等问题
* 在使用CoreImage时，一定要记住CIImage对象在开始时不会操作图像数据，知道使用CIContext渲染图片是才会这么做。还要记住最好在后台执行图像处理的操作，然后在主线程中修改界面。
