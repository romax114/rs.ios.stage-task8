//
//  ArtistViewController.m
//  RSSchool_T8
//
//  Created by Нехай Роман on 7/18/21.
//

#import "ArtistViewController.h"
#import "RSSchool_T8-Swift.h"
#import "CanvasView.h"
#import "ActionButton.h"
#import "PaletteView.h"
#import "Shapes.h"

typedef NS_CLOSED_ENUM(NSInteger, ScreenState) {
    ScreenStateIdle,
    ScreenStateDraw,
    ScreenStateDone
};

@interface ArtistViewController ()

@property NSMutableArray<UIColor *> *selectedColors;
@property Shape selectedShape;

@property (weak, nonatomic) IBOutlet CanvasView *canvasView;
@property (weak, nonatomic) IBOutlet ActionButton *openPaletteButton;
@property (weak, nonatomic) IBOutlet ActionButton *openTimerButton;
@property (weak, nonatomic) IBOutlet ActionButton *shareButton;
@property (weak, nonatomic) IBOutlet PaletteView *paletteView;
@property (weak, nonatomic) IBOutlet ActionButton *drawButton;
@property (weak, nonatomic) IBOutlet TimerView *timerView;

@property NSTimer *drawingTimer;

@end

@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.selectedColors = [[NSMutableArray alloc] initWithCapacity:3];
    self.selectedShape = ShapeHead;

    [self.paletteView setColorButtonTap:^(UIColor * _Nonnull color) {
        if ([self.selectedColors containsObject:color]) {
            [self.selectedColors removeObject:color];
        } else {
            if (self.selectedColors.count == 3) {
                [self.selectedColors removeObjectAtIndex:0];
            }
            [self.selectedColors addObject:color];
        }
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DrawingsViewController *viewController = (DrawingsViewController *)segue.destinationViewController;
    viewController.currentShape = self.selectedShape;
    viewController.shapeSelected = ^(Shape shape) {
        self.selectedShape = shape;
    };
}

- (void)setScreenState:(ScreenState)state {
    switch (state) {
        case ScreenStateIdle:
            self.openPaletteButton.enabled = YES;
            self.openTimerButton.enabled = YES;
            [self.drawButton setTitle:@"Draw" forState:UIControlStateNormal];
//            self.drawButton.enabled = YES;
            self.shareButton.enabled = NO;
            break;
        case ScreenStateDraw:
            self.openPaletteButton.enabled = NO;
            self.openTimerButton.enabled = NO;
            self.drawButton.enabled = NO;
//            self.shareButton.enabled = NO;
            break;
        case ScreenStateDone:
//            self.openPaletteButton.enabled = NO;
//            self.openTimerButton.enabled = NO;
            [self.drawButton setTitle:@"Reset" forState:UIControlStateNormal];
            self.drawButton.enabled = YES;
            self.shareButton.enabled = YES;
            break;
    }
}

- (IBAction)openPaletteTapped:(id)sender {
    self.paletteView.hidden = NO;
}

- (IBAction)openTimerTapped:(id)sender {
    self.timerView.hidden = NO;
}

- (IBAction)drawTapped:(id)sender {
    if ([self.drawButton.titleLabel.text  isEqual: @"Reset"]) {
        [self setScreenState:ScreenStateIdle];
        self.canvasView.layer1.path = nil;
        self.canvasView.layer2.path = nil;
        self.canvasView.layer3.path = nil;
        self.canvasView.layer1.strokeEnd = 0;
        self.canvasView.layer2.strokeEnd = 0;
        self.canvasView.layer3.strokeEnd = 0;
        return;
    }

    while (self.selectedColors.count < 3) {
        [self.selectedColors addObject:[UIColor blackColor]];
    }

    [self setScreenState:ScreenStateDraw];

    float interval = 1.0 / 60;
    float step = interval / self.timerView.time;

    NSArray<UIBezierPath *> *paths = [Shapes getShape:self.selectedShape];

    self.canvasView.layer1.path = paths[0].CGPath;
    self.canvasView.layer2.path = paths[1].CGPath;
    self.canvasView.layer3.path = paths[2].CGPath;
    self.canvasView.layer1.strokeColor = self.selectedColors[0].CGColor;
    self.canvasView.layer2.strokeColor = self.selectedColors[1].CGColor;
    self.canvasView.layer3.strokeColor = self.selectedColors[2].CGColor;

    self.drawingTimer = [NSTimer scheduledTimerWithTimeInterval:interval repeats:YES block:^(NSTimer * _Nonnull timer) {
        self.canvasView.layer1.strokeEnd += step;
        self.canvasView.layer2.strokeEnd += step;
        self.canvasView.layer3.strokeEnd += step;
    }];
    [NSTimer scheduledTimerWithTimeInterval:self.timerView.time repeats:NO block:^(NSTimer * _Nonnull timer) {
        [self.drawingTimer invalidate];
        [self setScreenState:ScreenStateDone];
    }];
}

- (IBAction)shareTapped:(id)sender {
}

@end
