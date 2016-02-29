# Gaussian-Blur
高斯模糊效果
## 简介
###Core image
`Core image` 是iOS5 新增加的框架，它有着优秀的图像处理功能，对来对基于像素的图像进行操作与分析，iOS提供了很多的滤镜（`Filter`）, 开发者耳可以组合多种滤镜，形成自己想要的效果。
###CIImage
CIImage 不仅包含元图像数据，还包含在元图像上的滤镜链。CIImage不是直接由UIImage转化来的。他有几种创建方式：
* 1.CIImage*image=[CIImage imageWithContentsOfURL:myURL];  
* 2.CIImage*image=[CIImage imageWithData:myData];  
* 3.CIImage*image=[CIImage imageWithCGImage:myCgimage];  
* 4.CIImage*image=[CIImage imageWithCVPixelBuffer：CVBuffer];  

