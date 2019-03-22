//
//  JYTestDataManager.m
//  DDZX_js
//
//  Created by apple on 2018/11/23.
//  Copyright © 2018 wjy. All rights reserved.
//

#import "JYTestDataManager.h"

@implementation JYTestDataManager
+ (instancetype)sharedManager
{
    static JYTestDataManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[JYTestDataManager alloc] init];
//        instance.dic = [NSMutableDictionary new];
    });
    return instance;
}

-(void)buildData:(Class)c callBack:(void (^)(NSArray * arr))block
{
    [self performSelector:@selector(getData:) withObject:@{@"class":c,@"block":block} afterDelay:0];

}

-(void)getData:(NSDictionary*)dic
{
//    typedef void(^b)(NSArray * rr);
    Class c = dic[@"class"];
   void (^b)(NSArray *rr) = dic[@"block"];
    NSInteger r = arc4random() %14 + 6;
//    NSInteger r = 6;
    NSMutableArray *arr = [NSMutableArray new];
    for (NSInteger i = 0; i < r; i ++) {
        id m = [[c alloc] init];
        if([m respondsToSelector:@selector(buildTestData)])
        {
         [m performSelector:@selector(buildTestData) withObject:nil afterDelay:0];
        }
        [arr addObject:m];
    }
    [self performSelector:@selector(callBack:) withObject:@{@"arr":arr,@"block":b} afterDelay:1];
//    return arr;
}

-(void)callBack:(NSDictionary*)dic
{
     NSArray *arr = dic[@"arr"];
     void (^b)(NSArray *rr) = dic[@"block"];
    b(arr);
}

-(NSString *)buildChineseWord:(NSInteger)length
{
//    NSString *str = [self GetNameWithLen:length];
//    return str;
    NSString *str = @"";
    for (NSInteger i = 0; i <length; i++) {
        str = [NSString stringWithFormat:@"%@%@",str,[self chineseWord]];
    }
    return str;
}

-(NSString *)chineseWord
{
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    
    NSInteger randomH = 0xA1+arc4random()%(0xFE - 0xA1+1);
    
    NSInteger randomL = 0xB0+arc4random()%(0xF7 - 0xB0+1);
    
    NSInteger number = (randomH<<8)+randomL;
    
    NSData *data = [NSData dataWithBytes:&number length:2];
    
    NSString *string = [[NSString alloc] initWithData:data encoding:gbkEncoding];
    
    NSLog(@"%@",string);
    return string;
}

// 大小端转换
-(unsigned short)changeShortLittleToBig:(unsigned short)number
{
    return (number &0x00ff)<< 8 | (number &0xff00)>>8;
}

-(unsigned int)changeIntLittleToBig:(unsigned int)number
{
    return (number &0x000000ff )<< 24 | (number & 0x0000ff00) << 8 | (number & 0x00ff0000)>>8 | (number & 0xff000000)>>24;
}
//GB2312转UTF8

-(NSString *) gb2312toutf8:(NSData *) data{
    NSStringEncoding enc =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *retStr = [[NSString alloc] initWithData:data encoding:enc];
    return retStr;
}
//随机生成GB2312编码的汉字,因为区域比较大,里面还是有框框出现,

-(NSString *)GetNameWithLen:(short)len
{
    NSString *name = @"";
    int high = 0xd7 - 0xc1;//16-55区汉字
    int low= 0xfe - 0xa1;
    short nameByte;
    for(int i=0;i<len;i++) {
        unsigned char high_zn = arc4random_uniform(high) + 0xc1;
        unsigned char low_zn = arc4random_uniform(low)+ 0xa1;
        nameByte = high_zn << 8 | low_zn;
        NSLog(@"0x%x %x %x ",nameByte,high_zn,low_zn);
        //这里进行大小端转换
        [self changeShortLittleToBig:nameByte];
        NSData *nameData = [NSData dataWithBytes:&nameByte length:sizeof(unsigned short)];
        name = [NSString stringWithFormat:@"%@%@",name,[self gb2312toutf8:nameData]];
    }
    return name;
}
//unicode - 2字节
-(NSString *)getNameUseUTF8WithLen:(char)len
{
    NSString *name = @"";
    unsigned short low= 0x4e00;
    unsigned short hight= 0x9fa0;
    for ( unsigned short byte = arc4random_uniform(hight-low)+low;byte < len;)
    {   //小端 转大端
    byte = ((byte &0xff00) >> 8) | ((0xff & byte )<<8);
    NSData *nameData = [NSData dataWithBytes:&byte length:sizeof(unsigned short)];
    NSLog(@"0x%x%@",byte,nameData);
    NSString *byteStr = [[NSString alloc]initWithData:nameData encoding:NSUnicodeStringEncoding];
    name = [NSString stringWithFormat:@"%@%@",name,byteStr];
    //name = ;
}
return name;
}

-(NSString *)getFamilyName
{
    NSString *str = @"赵钱孙李　周吴郑王　冯陈褚卫　蒋沈韩杨　朱秦尤许　何吕施张　孔曹严华　金魏陶姜\
戚谢邹喻　柏水窦章　云苏潘葛　奚范彭郎　鲁韦昌马　苗凤花方　俞任袁柳　酆鲍史唐\
费廉岑薛　雷贺倪汤　滕殷罗毕　郝邬安常　乐于时傅　皮卞齐康　伍余元卜　顾孟平黄\
和穆萧尹　姚邵湛汪　祁毛禹狄　米贝明臧　计伏成戴　谈宋茅庞　熊纪舒屈　项祝董梁\
杜阮蓝闵　席季麻强　贾路娄危　江童颜郭　梅盛林刁　钟徐邱骆　高夏蔡田　樊胡凌霍\
虞万支柯　咎管卢莫　经房裘缪　干解应宗　宣丁贲邓　郁单杭洪　包诸左石　崔吉钮龚\
程嵇邢滑　裴陆荣翁　荀羊於惠　甄魏加封　芮羿储靳　汲邴糜松　井段富巫　乌焦巴弓\
牧隗山谷　车侯宓蓬　全郗班仰　秋仲伊宫　宁仇栾暴　甘钭厉戎　祖武符刘　姜詹束龙\
叶幸司韶　郜黎蓟薄　印宿白怀　蒲台从鄂　索咸籍赖　卓蔺屠蒙　池乔阴郁　胥能苍双\
闻莘党翟　谭贡劳逄　姬申扶堵　冉宰郦雍　却璩桑桂　濮牛寿通　边扈燕冀　郏浦尚农\
温别庄晏　柴瞿阎充　慕连茹习　宦艾鱼容　向古易慎　戈廖庚终　暨居衡步　都耿满弘\
匡国文寇　广禄阙东　殴殳沃利　蔚越夔隆　师巩厍聂　晁勾敖融　冷訾辛阚　那简饶空\
曾毋沙乜　养鞠须丰　巢关蒯相　查后江红　游竺权逯　盖益桓公　万俟司马　上官欧阳\
夏侯诸葛　闻人东方　赫连皇甫　尉迟公羊　澹台公冶　宗政濮阳　淳于仲孙　太叔申屠\
公孙乐正　轩辕令狐　钟离闾丘　长孙慕容　鲜于宇文　司徒司空　亓官司寇　仉督子车\
颛孙端木　巫马公西　漆雕乐正　壤驷公良　拓拔夹谷　宰父谷粱　晋楚阎法　汝鄢涂钦\
段干百里　东郭南门　呼延归海　羊舌微生　岳帅缑亢　况后有琴　梁丘左丘　东门西门\
商牟佘佴　伯赏南宫　墨哈谯笪　年爱阳佟　第五言福";
   str = [str stringByReplacingOccurrencesOfString:@"　" withString:@""];
    NSInteger i =  arc4random()%(str.length - 1) + 1;
    if (i >= 444) {
        NSInteger n = 0;
        if (i % 2 == 0) {
            n = i;
        }
        else
        {
            n = i - 1;
        }
        NSString *ss = [str substringWithRange:NSMakeRange(n, 2)];
        return ss;
    }
  NSString *s = [str substringWithRange:NSMakeRange(i, 1)];
    return s;
}

-(NSString *)buildDateTime
{
   NSDate *dn = [NSDate date];
     NSInteger i =  arc4random()%(365);
    NSTimeInterval tt = [dn timeIntervalSince1970] - 3600 * 24 * i;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:tt];
    NSString *dateStr = [formatter stringFromDate:date];

    return dateStr;
}

-(NSString *)buildName
{
    return [NSString stringWithFormat:@"%@%@",[self getFamilyName],[self buildChineseWord:1]];
}

-(NSString *)buildDate
{
    NSString *t = [self buildDateTime];
    t = [t substringWithRange:NSMakeRange(0, 10)];
    return t;
}

-(NSString *)buildArcArticle
{
    NSInteger i =  arc4random()%200 + 100;
    return [self buildArticle:i];
}


-(NSString *)buildArticle:(NSInteger )length
{
    NSString *str = @"";
    for (NSInteger i = 0; i < length; i++) {
       str = [NSString stringWithFormat:@"%@%@",str,[self chineseWord]];
    }
    return str;
}

-(NSString *)buildTitle:(NSInteger )length
{
    NSString *str = @"";
    for (NSInteger i = 0; i < length; i++) {
        str = [NSString stringWithFormat:@"%@%@",str,[self chineseWord]];
    }
    return str;
}

-(NSInteger)buildPoint
{
       NSInteger i =  arc4random()%(5) + 1;
    return i;
}
-(NSInteger)buildIntValue
{
    return [self buildIntValue:100];
}
-(NSInteger)buildIntValue:(NSInteger)i
{
   NSInteger c = arc4random()%i;
    return c;
}
-(CGFloat)buildFloatValue
{
    return [self buildFloatValue:100];
}

-(CGFloat)buildFloatValue:(NSInteger)i
{
   NSInteger c = arc4random()%100;
    CGFloat f = c/100.0;
    NSInteger ff = arc4random()%i;
    return  ff + f;
}

-(NSArray *)buildMark
{
    return [self buildMarks:@[@"强力推荐",@"本期名师",@"热门搜索"]];
}
-(NSArray *)buildInfoMark
{
    return [self buildMarks:@[@"志愿专家",@"15分钟回复",@"名师"]];
}
-(NSArray *)buildMarks:(NSArray *)arr
{
     NSInteger c = arc4random()%arr.count;
    c = MIN(2, c);
    NSMutableArray *marr = [NSMutableArray new];
    NSInteger p = 0;
    for (NSInteger i = 0; i < c; i++) {
      NSInteger n =  arc4random()%arr.count;
        while (n == p) {
            n =  arc4random()%arr.count;
        }
        p = n;
        [marr addObject:arr[n]];
    }
    return  marr;
}

-(NSString *)buildImg
{
    NSArray *arr = @[@"https://t1.hddhhn.com/uploads/tu/201512/264/142.jpg",@"https://t1.hddhhn.com/uploads/tu/201512/252/141.jpg",@"https://t1.hddhhn.com/uploads/tu/201607/85/18.jpg",@"https://t1.hddhhn.com/uploads/tu/201611/241/2.png",@"https://t1.hddhhn.com/uploads/tu/201605/95/8.jpg",@"https://t1.hddhhn.com/uploads/tu/201606/307/19.jpg",@"https://t1.hddhhn.com/uploads/tu/201612/320/st29.png",@"https://t1.hddhhn.com/uploads/tu/201606/307/19.jpg",@"https://t1.hddhhn.com/uploads/tu/201601/323/3.jpg"];
     NSInteger c = arc4random()%arr.count;
    return arr[c];
}
@end
