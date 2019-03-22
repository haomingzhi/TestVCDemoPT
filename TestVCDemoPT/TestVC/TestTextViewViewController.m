//
//  TestTextViewViewController.m
//  TestVCDemoPT
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 wjy. All rights reserved.
//

#import "TestTextViewViewController.h"
#import "UITextView+JYStyle.h"
#import "NSMutableAttributedString+JYTool.h"
@interface TestTextViewViewController ()
@property(nonatomic,strong)UITextView *textView;
@end

@implementation TestTextViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.textView];
}

-(UITextView *)textView
{
    if (!_textView) {
        _textView = [UITextView newTextViewForAttStyle:self];
        NSMutableAttributedString *st = [NSMutableAttributedString newImgAtt:@"亲子关系"];
        [_textView configLinkAtt:st];
        NSMutableAttributedString *sst = [[NSMutableAttributedString alloc] initWithAttributedString:_textView.attributedText];
        [sst appendAttributedString:st];
        _textView.attributedText = sst;
    }
    return _textView;
}
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    if ([[URL scheme] isEqualToString:@"CustomTapEvents"]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户点击了自定义事件" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:action];
        [self presentViewController:alertController animated:YES completion:nil];
        return NO;
    }
    else if([[URL scheme] isEqualToString:@"xxx"])
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户点击了图片" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:action];
        [self presentViewController:alertController animated:YES completion:nil];
        return NO;
    }
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
