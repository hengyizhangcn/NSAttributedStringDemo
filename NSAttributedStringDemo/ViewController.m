//
//  ViewController.m
//  NSAttributedStringDemo
//
//  Created by zhy on 11/05/2017.
//  Copyright © 2017 zhy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *poemLabel;

@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSString *str0 = @"满江红";
    NSString *str1 = @"\n怒发冲冠，凭栏处，潇潇雨歇。\n";
//    NSString *str2 = @"fish?\n";
    NSString *str2 = @"抬望眼，仰天长啸，壮怀激烈。\n";
    NSString *str3 = @"fish\n";
//    NSString *str3 = @"三十功名尘与土，八千里路云和月。\n";
//    NSString *str4 = @"fish\n";
    NSString *str4 = @"莫等闲，白了少年头，空悲切！\n";
    NSString *str5 = @"靖康耻，犹未雪；臣子恨，何时灭?\n";
    NSString *str6 = @"驾长车，踏破贺兰山缺！\n";
    NSString *str7 = @"壮志饥餐胡虏肉，笑谈渴饮匈奴血。\n";
    NSString *str8 = @"待从头，收拾旧山河，朝天阙！\n";
    NSMutableAttributedString *poemString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@", str0, str1, str2, str3, str4, str5, str6, str7, str8]];
    
    [poemString addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:20],
                                NSObliquenessAttributeName: @(1),
                                NSStrikethroughColorAttributeName: [UIColor blueColor],} range:NSMakeRange(0, str0.length)];
    [poemString addAttributes:@{
//                                NSKernAttributeName:@(5),
//                                NSWritingDirectionAttributeName:@[@1],
                                NSStrikethroughColorAttributeName:[UIColor redColor],
                                NSStrikethroughStyleAttributeName: @(NSUnderlineStyleDouble | NSUnderlineStyleThick | NSUnderlinePatternDashDotDot),
                                } range:NSMakeRange(str0.length, str1.length)];
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(0, 3);
    shadow.shadowColor = [UIColor yellowColor];
    [poemString addAttributes:@{
//                                NSFontAttributeName: [UIFont fontWithName:@"Hoefler Text" size:20],
                                NSLigatureAttributeName:@(0),
//                                NSVerticalGlyphFormAttributeName: @1,
//                                NSBaselineOffsetAttributeName:@(-120.0),
//                                NSShadowAttributeName:shadow,
//                                NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle),
//                                NSUnderlineColorAttributeName: [UIColor grayColor]
                                } range:NSMakeRange(str0.length + str1.length, str2.length)];
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    
    textAttachment.image = [UIImage imageNamed:@"bill_receiveReward@2x.png"];
    textAttachment.bounds = CGRectMake(0, 0, 30, 30);
    [poemString addAttributes:@{
//                                NSTextEffectAttributeName: NSTextEffectLetterpressStyle,
                                NSFontAttributeName: [UIFont fontWithName:@"Hoefler Text" size:20],
//                                NSFontAttributeName: [UIFont systemFontOfSize:60],
                                NSLigatureAttributeName:@(1),
                                NSExpansionAttributeName:@(-2),
                                NSLinkAttributeName:[NSURL URLWithString:@"http://www.baidu.com"],
                                } range:NSMakeRange(str0.length + str1.length + str2.length, str3.length)];
    
//    [poemString addAttributes:@{NSVerticalGlyphFormAttributeName: @1} range:NSMakeRange(0, poemString.string.length)];
    
    NSAttributedString * imageStr = [NSAttributedString attributedStringWithAttachment:textAttachment];
    [poemString appendAttributedString:imageStr];
    _poemLabel.userInteractionEnabled = true;
    _poemLabel.attributedText = poemString;
    
    _textView.attributedText = poemString;
    _textView.editable = false;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


//@property (readonly, copy) NSString *string;
//- (NSDictionary<NSString *, id> *)attributesAtIndex:(NSUInteger)location effectiveRange:(nullable NSRangePointer)range;
//
//@end
//
//@interface NSAttributedString (NSExtendedAttributedString)
//
//@property (readonly) NSUInteger length;
//- (nullable id)attribute:(NSString *)attrName atIndex:(NSUInteger)location effectiveRange:(nullable NSRangePointer)range;
//- (NSAttributedString *)attributedSubstringFromRange:(NSRange)range;
//
//- (NSDictionary<NSString *, id> *)attributesAtIndex:(NSUInteger)location longestEffectiveRange:(nullable NSRangePointer)range inRange:(NSRange)rangeLimit;
//- (nullable id)attribute:(NSString *)attrName atIndex:(NSUInteger)location longestEffectiveRange:(nullable NSRangePointer)range inRange:(NSRange)rangeLimit;

//
//typedef NS_OPTIONS(NSUInteger, NSAttributedStringEnumerationOptions) {
//    NSAttributedStringEnumerationReverse = (1UL << 1),
//    NSAttributedStringEnumerationLongestEffectiveRangeNotRequired = (1UL << 20)
//};
//
//- (void)enumerateAttributesInRange:(NSRange)enumerationRange options:(NSAttributedStringEnumerationOptions)opts usingBlock:(void (NS_NOESCAPE ^)(NSDictionary<NSString *, id> *attrs, NSRange range, BOOL *stop))block NS_AVAILABLE(10_6, 4_0);
//- (void)enumerateAttribute:(NSString *)attrName inRange:(NSRange)enumerationRange options:(NSAttributedStringEnumerationOptions)opts usingBlock:(void (NS_NOESCAPE ^)(id _Nullable value, NSRange range, BOOL *stop))block NS_AVAILABLE(10_6, 4_0);
//
//@end
