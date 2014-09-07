//
//  ViewController.m
//  InstagramStatusBarTest
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIScrollView *m_scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 400)];
    redView.backgroundColor = [UIColor colorWithRed:0.815 green:0.007
                                               blue:0.105 alpha:1];
    
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(150, 460, 450, 200)];
    greenView.backgroundColor = [UIColor colorWithRed:0.494 green:0.827
                                                 blue:0.129 alpha:1];
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(40, 1000, 200, 450)];
    blueView.backgroundColor = [UIColor colorWithRed:0.29 green:0.564
                                                blue:0.886 alpha:1];
    
    UIView *yellowView = [[UIView alloc] initWithFrame:CGRectMake(100, 1500, 480, 150)];
    yellowView.backgroundColor = [UIColor colorWithRed:0.972 green:0.905
                                                  blue:0.109 alpha:1];
    
    [m_scrollView addSubview:redView];
    [m_scrollView addSubview:greenView];
    [m_scrollView addSubview:blueView];
    [m_scrollView addSubview:yellowView];
    
    [m_scrollView setDelegate:self];
    [m_scrollView setContentSize:CGSizeMake(self.view.frame.size.width, 2000)];
    
    [self.view addSubview:m_scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScroll");
    NSLog(@"scrollView.y=%f", scrollView.contentOffset.y);
    
    CGFloat yOffset = scrollView.contentOffset.y;

            UIWindow *statusBarWindow = (UIWindow *)[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"];

    if(yOffset > 0)
    {
        [statusBarWindow setFrame:CGRectMake(0,
                                             -1*yOffset,
                                             statusBarWindow.frame.size.width,
                                             statusBarWindow.frame.size.height)];
    } else
    {
        [statusBarWindow setFrame:CGRectMake(0,
                                             0,
                                             statusBarWindow.frame.size.width,
                                             statusBarWindow.frame.size.height)];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
