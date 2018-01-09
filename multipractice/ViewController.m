//
//  ViewController.m
//  multipractice
//
//  Created by 研发部 on 2017/9/22.
//  Copyright © 2017年 development team. All rights reserved.
//

#import "ViewController.h"
#import "KJWebProgressLayer.h"

@interface ViewController ()<UIWebViewDelegate,UITableViewDataSource,UITableViewDelegate>
//@property(nonatomic,strong)UITableView *
@property(nonatomic,strong)UITableView *onetableview;

@end

@implementation ViewController
{
 UIWebView *_webView;
 KJWebProgressLayer *_progressLayer; //载进度条
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 _webview = [[UIWebView alloc]initWithFrame:CGRectMake(100, 100, self.view.frame.size.width, 300)];
 _webview.delegate = self;
 _webview.scrollView.scrollEnabled = NO;
 _webview.scrollView.showsHorizontalScrollIndicator = NO;
 _webview.scrollView.bounces = NO;
 [_webview.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
 [self.view addSubview:_webview];
 NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
 NSURLRequest *request = [NSURLRequest requestWithURL:url];
 [_webview loadRequest:request];
 [_webview sizeToFit];
 _progressLayer = [[KJWebProgressLayer alloc] initWithStrokeColor:[UIColor redColor]];
 _progressLayer.frame = CGRectMake(0, 42, SCREEN_WIDTH, 2);
 [self.navigationController.navigationBar.layer addSublayer:_progressLayer];
 [self.view addSubview:_webView];
 [_progressLayer startLoad];
 
  _onetableview = [[UITableView alloc]initWithFrame:CGRectMake(10, 100, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
 _onetableview.delegate = self;
 _onetableview.dataSource = self;
 [self.view addSubview:_onetableview];
 _onetableview.tableHeaderView = _webview;
// NSURL* url = [NSURL URLWithString:@"http://www.baidu.com"];//创建URL
//
// NSURLRequest* request = [NSURLRequest requestWithURL:url];//创建NSURLRequest
// [_webview.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
// [_webview loadRequest:request];//加载
// UIButton *redbtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
// redbtn.backgroundColor = [UIColor redColor];
// [self.view addSubview:redbtn];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
 if ([keyPath isEqualToString:@"contentSize"]) {
  CGFloat webViewH = [[_webview stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"]floatValue]+15;
  CGRect newFrame = _webview.frame;
  newFrame.size.height = webViewH;
  _webview.frame = newFrame;
  _onetableview.tableHeaderView = _webview;
 }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
 return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 UITableViewCell *viewcell = [UITableViewCell new];
 viewcell.contentView.backgroundColor = [UIColor redColor];
 return viewcell;
}
//-(void)webViewDidStartLoad:(UIWebView *)webView{
//
//}
//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
// if ([keyPath isEqualToString:@"contentSize"]) {
//  CGSize fittingSize = [_webview sizeThatFits:CGSizeZero];
//  _webview.frame = CGRectMake(0, 200, self.view.frame.size.width, fittingSize.height);
//
//  NSLog(@"输出_webview.frame.size.height:%f",_webview.frame.size.height);
// }
//}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
 [_progressLayer finishedLoad];
 NSString *str = @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '80%'";
 [webView stringByEvaluatingJavaScriptFromString:str];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
 [_progressLayer finishedLoad];
}
- (void)dealloc {
 [_webview.scrollView removeObserver:self forKeyPath:@"contentSize"];
 [_progressLayer closeTimer];
 [_progressLayer removeFromSuperlayer];
 _progressLayer = nil;
}
@end
