# MILabel
快速创建拥有金属光泽动画效果的文字
- 思路来源
  * 网易云音乐 按住屏幕分享歌词
  * 下图红色区域内的文字

![网易云音乐](http://upload-images.jianshu.io/upload_images/1899979-d0f258d43f620bb9.PNG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 解决思路分析
  * 仔细观察可以发现金属光泽其实就是一个白条
  ` 当然这个白条并不只是纯白 是水平方向上从透明度为0 的白到透明度为1 再到透明度为0 的渐变图层 CAGradientLayer `
  * 初步确定解决方案为再View上添加一个渐变图层，然后做水平方向上的动画
- 初步实现效果

![初步效果](http://upload-images.jianshu.io/upload_images/1899979-2980e8d983ec1166.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


- 效果分析
  - 不难发现其实我们需要的只是图中文字轮廓部分需要有白色的渐变动画
  
## 怎样才能实现只在文字轮廓显示白色渐变呢
- 接下来我们讲讲图层中的mask ,利用它我们就可以解决上面的问题了
- 先看看效果


![优化效果](http://upload-images.jianshu.io/upload_images/1899979-ea1161c9cbbcca91.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- mask图层工作原理:
  * 根据透明度进行裁剪，只保留非透明部分，显示底部内容。
  * 根据mask的工作原理 我们可以拿一个有文字但没有背景色的label来当做mask图层，这样其实显示的内容就不是label， 而是被label文字裁剪只显示文字部分的背景颜色，这样就可以把白色渐变图层添加到主图层然后用label裁剪就能解决上面的问题了
  * 有一点需要注意的是：如果用文字图层裁剪渐变层，文字图层就不在拥有显示功能，这个图层就被弄来裁剪了，不会显示
- 完善金属光泽 
  * 为白色渐变图层添加水平方向上的动画 
`核心动画 帧动画 CAKeyframeAnimation `
