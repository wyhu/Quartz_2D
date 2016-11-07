//
//  KCView.m
//  Quartz_2D
//
//  Created by huweiya on 16/11/7.
//  Copyright © 2016年 5i5j. All rights reserved.
//

#import "KCView.h"

@implementation KCView

#pragma mark 绘图
//绘图只能在此方法中调用，否则无法得到当前图形上下文
-(void)drawRect:(CGRect)rect{

//    //1.取得图形上下文对象
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    //2.创建路径对象
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathMoveToPoint(path, nil, 20, 50);//移动到指定位置（设置路径起点）
//    CGPathAddLineToPoint(path, nil, 20, 100);//绘制直线（从起始位置开始）
//    CGPathAddLineToPoint(path, nil, 300, 100);//绘制另外一条直线（从上一直线终点开始绘制）
//    
//    
//    //3.添加路径到图形上下文
//    CGContextAddPath(context, path);
//    
//    //4.设置图形上下文状态属性
//    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1);//设置笔触颜色
//    CGContextSetRGBFillColor(context, 0, 1.0, 0, 1);//设置填充色
//    CGContextSetLineWidth(context, 2.0);//设置线条宽度
//    CGContextSetLineCap(context, kCGLineCapRound);//设置顶点样式,（20,50）和（300,100）是顶点
//    CGContextSetLineJoin(context, kCGLineJoinRound);//设置连接点样式，(20,100)是连接点
//    /*设置线段样式
//     phase:虚线开始的位置
//     lengths:虚线长度间隔（例如下面的定义说明第一条线段长度8，然后间隔3重新绘制8点的长度线段，当然这个数组可以定义更多元素）
//     count:虚线数组元素个数
//     */
//    CGFloat lengths[2] = { 18, 9 };
//    CGContextSetLineDash(context, 0, lengths, 2);
//    /*设置阴影
//     context:图形上下文
//     offset:偏移量
//     blur:模糊度
//     color:阴影颜色
//     */
//    CGColorRef color = [UIColor grayColor].CGColor;//颜色转化，由于Quartz 2D跨平台，所以其中不能使用UIKit中的对象，但是UIkit提供了转化方法
//    CGContextSetShadowWithColor(context, CGSizeMake(2, 2), 0.8, color);
//    
//    //5.绘制图像到指定图形上下文
//    /*CGPathDrawingMode是填充方式,枚举类型
//     kCGPathFill:只有填充（非零缠绕数填充），不绘制边框
//     kCGPathEOFill:奇偶规则填充（多条路径交叉时，奇数交叉填充，偶交叉不填充）
//     kCGPathStroke:只有边框
//     kCGPathFillStroke：既有边框又有填充
//     kCGPathEOFillStroke：奇偶填充并绘制边框
//     */
//    CGContextDrawPath(context, kCGPathFillStroke);//最后一个参数是填充类型
//    
//    //6.释放对象
//    CGPathRelease(path);

    [self test];
    
    
}


-(void)drawLine2{
    //1.获得图形上下文
    CGContextRef context=UIGraphicsGetCurrentContext();
    
    //2.绘制路径（相当于前面创建路径并添加路径到图形上下文两步操作）
    CGContextMoveToPoint(context, 20, 50);
    CGContextAddLineToPoint(context, 20, 100);
    CGContextAddLineToPoint(context, 300, 100);
    //封闭路径:a.创建一条起点和终点的线,不推荐
    //CGPathAddLineToPoint(path, nil, 20, 50);
    //封闭路径:b.直接调用路径封闭方法
    CGContextClosePath(context);
    
    //3.设置图形上下文属性
    [[UIColor redColor]setStroke];//设置红色边框
    [[UIColor greenColor]setFill];//设置绿色填充
    //[[UIColor blueColor]set];//同时设置填充和边框色
    
    //4.绘制路径
    CGContextDrawPath(context, kCGPathFillStroke);
}


-(void)drawRectWithContext:(CGContextRef)context{
    //添加矩形对象
    CGRect rect=CGRectMake(20, 50, 280.0, 50.0);
    CGContextAddRect(context,rect);
    //设置属性
    [[UIColor redColor] set];
    //绘制
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark 绘制矩形（利用UIKit的封装方法）
-(void)drawRectByUIKitWithContext:(CGContextRef)context{
    CGRect rect= CGRectMake(20, 150, 280.0, 50.0);
    CGRect rect2=CGRectMake(20, 250, 280.0, 50.0);
    //设置属性
    [[UIColor redColor] set];
    //绘制矩形,相当于创建对象、添加对象到上下文、绘制三个步骤
    UIRectFill(rect);//绘制矩形（只有填充）
    
    [[UIColor redColor] setStroke];
    UIRectFrame(rect2);//绘制矩形(只有边框)
}


#pragma mark 绘制椭圆
-(void)drawEllipse:(CGContextRef)context{
    //添加对象,绘制椭圆（圆形）的过程也是先创建一个矩形
    CGRect rect=CGRectMake(50, 50, 220.0, 220.0);
    CGContextAddEllipseInRect(context, rect);
    //设置属性
    [[UIColor blueColor] set];
    //绘制
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark 绘制弧形
-(void)drawArc:(CGContextRef)context{
    /*添加弧形对象
     x:中心点x坐标
     y:中心点y坐标
     radius:半径
     startAngle:起始弧度
     endAngle:终止弧度
     closewise:是否逆时针绘制，0则顺时针绘制
     */
    CGContextAddArc(context, 160, 160, 100.0, 0.0, M_PI_2, 1);
    
    //设置属性
    [[UIColor redColor]set];
    
    //绘制
    CGContextDrawPath(context, kCGPathFillStroke);
}


#pragma mark 绘制贝塞尔曲线
-(void)drawCurve:(CGContextRef)context{
    
    //绘制曲线
    CGContextMoveToPoint(context, 20, 100);//移动到起始位置
    /*绘制二次贝塞尔曲线
     c:图形上下文
     cpx:控制点x坐标
     cpy:控制点y坐标
     x:结束点x坐标
     y:结束点y坐标
     */
    CGContextAddQuadCurveToPoint(context, 160, 0, 300, 100);
    
    CGContextMoveToPoint(context, 20, 500);
    /*绘制三次贝塞尔曲线
     c:图形上下文
     cp1x:第一个控制点x坐标
     cp1y:第一个控制点y坐标
     cp2x:第二个控制点x坐标
     cp2y:第二个控制点y坐标
     x:结束点x坐标
     y:结束点y坐标
     */
    CGContextAddCurveToPoint(context, 80, 300, 240, 500, 300, 300);
    
    //设置图形上下文属性
    [[UIColor yellowColor]setFill];
    [[UIColor redColor]setStroke];
    
    
    //绘制路径
    CGContextDrawPath(context, kCGPathFillStroke);
    
}


#pragma mark 绘制文本内容
-(void)drawText:(CGContextRef)context{
    //绘制到指定的区域内容
    NSString *str=@"Star Walk is the most beautiful stargazing app you’ve ever seen on a mobile device. It will become your go-to interactive astro guide to the night sky, following your every movement in real-time and allowing you to explore over 200, 000 celestial bodies with extensive information about stars and constellations that you find.";
    CGRect rect= CGRectMake(20, 50, 280, 300);
    UIFont *font=[UIFont systemFontOfSize:18];//设置字体
    UIColor *color=[UIColor redColor];//字体颜色
    NSMutableParagraphStyle *style=[[NSMutableParagraphStyle alloc]init];//段落样式
    NSTextAlignment align=NSTextAlignmentLeft;//对齐方式
    style.alignment=align;
    [str drawInRect:rect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:color,NSParagraphStyleAttributeName:style}];
}

#pragma mark图片绘制
-(void)drawImage:(CGContextRef)context{
    UIImage *image=[UIImage imageNamed:@"屏幕快照 2016-11-02 下午4.49.00.png"];
    //从某一点开始绘制
//    [image drawAtPoint:CGPointMake(10, 50)];
    //绘制到指定的矩形中，注意如果大小不合适会会进行拉伸
    [image drawInRect:CGRectMake(10, 50, 100, 100)];
    //平铺绘制
    //    [image drawAsPatternInRect:CGRectMake(0, 0, 320, 568)];
}




#pragma mark 线性渐变
-(void)drawLinearGradient:(CGContextRef)context{
    //使用rgb颜色空间
    CGColorSpaceRef colorSpace=CGColorSpaceCreateDeviceRGB();
    
    /*指定渐变色
     space:颜色空间
     components:颜色数组,注意由于指定了RGB颜色空间，那么四个数组元素表示一个颜色（red、green、blue、alpha），
     如果有三个颜色则这个数组有4*3个元素
     locations:颜色所在位置（范围0~1），这个数组的个数不小于components中存放颜色的个数
     count:渐变个数，等于locations的个数
     */
    CGFloat compoents[12]={
        248.0/255.0,86.0/255.0,86.0/255.0,1,
        249.0/255.0,127.0/255.0,127.0/255.0,1,
        1.0,1.0,1.0,1.0
    };
    CGFloat locations[3]={0,0.3,1.0};
    CGGradientRef gradient= CGGradientCreateWithColorComponents(colorSpace, compoents, locations, 3);
    
    /*绘制线性渐变
     context:图形上下文
     gradient:渐变色
     startPoint:起始位置
     endPoint:终止位置
     options:绘制方式,kCGGradientDrawsBeforeStartLocation 开始位置之前就进行绘制，到结束位置之后不再绘制，
     kCGGradientDrawsAfterEndLocation开始位置之前不进行绘制，到结束点之后继续填充
     */
    CGContextDrawLinearGradient(context, gradient, CGPointZero, CGPointMake(200, 200), kCGGradientDrawsAfterEndLocation);
    
    //释放颜色空间
    CGColorSpaceRelease(colorSpace);
}

#pragma mark 径向渐变
-(void)drawRadialGradient:(CGContextRef)context{
    //使用rgb颜色空间
    CGColorSpaceRef colorSpace=CGColorSpaceCreateDeviceRGB();
    
    /*指定渐变色
     space:颜色空间
     components:颜色数组,注意由于指定了RGB颜色空间，那么四个数组元素表示一个颜色（red、green、blue、alpha），
     如果有三个颜色则这个数组有4*3个元素
     locations:颜色所在位置（范围0~1），这个数组的个数不小于components中存放颜色的个数
     count:渐变个数，等于locations的个数
     */
    CGFloat compoents[12]={
        248.0/255.0,86.0/255.0,86.0/255.0,1,
        249.0/255.0,127.0/255.0,127.0/255.0,1,
        1.0,1.0,1.0,1.0
    };
    CGFloat locations[3]={0,0.3,1.0};
    CGGradientRef gradient= CGGradientCreateWithColorComponents(colorSpace, compoents, locations, 3);
    
    /*绘制径向渐变
     context:图形上下文
     gradient:渐变色
     startCenter:起始点位置
     startRadius:起始半径（通常为0，否则在此半径范围内容无任何填充）
     endCenter:终点位置（通常和起始点相同，否则会有偏移）
     endRadius:终点半径（也就是渐变的扩散长度）
     options:绘制方式,kCGGradientDrawsBeforeStartLocation 开始位置之前就进行绘制，但是到结束位置之后不再绘制，
     kCGGradientDrawsAfterEndLocation开始位置之前不进行绘制，但到结束点之后继续填充
     */
    
    CGContextDrawRadialGradient(context, gradient, CGPointMake(160, 284),0, CGPointMake(165, 289), 150, kCGGradientDrawsAfterEndLocation);
    //释放颜色空间
    CGColorSpaceRelease(colorSpace);
}

#pragma mark 渐变填充
-(void)drawRectWithLinearGradientFill:(CGContextRef)context{
    CGColorSpaceRef colorSpace=CGColorSpaceCreateDeviceRGB();
    
    //裁切处一块矩形用于显示，注意必须先裁切再调用渐变
    //CGContextClipToRect(context, CGRectMake(20, 50, 280, 300));
    //裁切还可以使用UIKit中对应的方法
    UIRectClip(CGRectMake(20, 50, 280, 300));
    
    CGFloat compoents[12]={
        248.0/255.0,86.0/255.0,86.0/255.0,1,
        249.0/255.0,127.0/255.0,127.0/255.0,1,
        1.0,1.0,1.0,1.0
    };
    CGFloat locations[3]={0,0.3,1.0};
    CGGradientRef gradient= CGGradientCreateWithColorComponents(colorSpace, compoents, locations, 3);
    
    CGContextDrawLinearGradient(context, gradient, CGPointMake(20, 50), CGPointMake(300, 300), kCGGradientDrawsAfterEndLocation);
    
    
    //释放颜色空间
    CGColorSpaceRelease(colorSpace);
}
- (void)test{
    
    [self drawRectWithLinearGradientFill:UIGraphicsGetCurrentContext()];
}


@end
