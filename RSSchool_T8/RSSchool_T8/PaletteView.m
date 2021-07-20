//
//  PaletteView.m
//  RSSchool_T8
//
//  Created by Нехай Роман on 7/18/21.
//

#import "PaletteView.h"
#import "ActionButton.h"
#import "ColorView.h"

@interface PaletteView ()

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet ActionButton *saveButton;
@property (weak, nonatomic) IBOutlet ColorView *color1View;
@property (weak, nonatomic) IBOutlet ColorView *color2View;
@property (weak, nonatomic) IBOutlet ColorView *color3View;
@property (weak, nonatomic) IBOutlet ColorView *color4View;
@property (weak, nonatomic) IBOutlet ColorView *color5View;
@property (weak, nonatomic) IBOutlet ColorView *color6View;
@property (weak, nonatomic) IBOutlet ColorView *color7View;
@property (weak, nonatomic) IBOutlet ColorView *color8View;
@property (weak, nonatomic) IBOutlet ColorView *color9View;
@property (weak, nonatomic) IBOutlet ColorView *color10View;
@property (weak, nonatomic) IBOutlet ColorView *color11View;
@property (weak, nonatomic) IBOutlet ColorView *color12View;

@property (nonatomic, copy) void (^colorButtonTapped)(UIColor *);

@property NSMutableArray<ColorView *> *selectedViews;

@property NSTimer *timer;

@end

IB_DESIGNABLE
@implementation PaletteView

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupXib];
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupXib];
        [self setup];
    }
    return self;
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [self setupXib];
    [self setup];
}

- (void)setupXib {
    [[NSBundle mainBundle] loadNibNamed:@"Palette" owner:self options:nil];
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
}

- (void)setup {
    self.contentView.layer.cornerRadius = 40;
    self.contentView.layer.shadowOffset = CGSizeMake(0, 0);
    self.contentView.layer.shadowOpacity = 0.25;
    self.contentView.layer.shadowRadius = 8;

    self.selectedViews = [[NSMutableArray alloc] initWithCapacity:3];

    [self.color1View addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(colorViewTapped:)]];
    [self.color2View addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(colorViewTapped:)]];
    [self.color3View addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(colorViewTapped:)]];
    [self.color4View addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(colorViewTapped:)]];
    [self.color5View addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(colorViewTapped:)]];
    [self.color6View addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(colorViewTapped:)]];
    [self.color7View addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(colorViewTapped:)]];
    [self.color8View addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(colorViewTapped:)]];
    [self.color9View addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(colorViewTapped:)]];
    [self.color10View addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(colorViewTapped:)]];
    [self.color11View addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(colorViewTapped:)]];
    [self.color12View addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(colorViewTapped:)]];
}

- (void)setColorButtonTap:(void (^)(UIColor * _Nonnull))colorButtonTapped {
    self.colorButtonTapped = colorButtonTapped;
}

- (void)colorViewTapped:(UITapGestureRecognizer *)sender {
    ColorView *view = (ColorView *)sender.view;
    [view setSelected:!view.isSelected];

    if (view.isSelected) {
        if (self.selectedViews.count == 3) {
            [[self.selectedViews objectAtIndex:0] setSelected:NO];
            [self.selectedViews removeObjectAtIndex:0];
        }
        [self.selectedViews addObject:view];
        self.contentView.backgroundColor = view.getColor;
        [self.timer invalidate];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:NO block:^(NSTimer * _Nonnull timer) {
            self.contentView.backgroundColor = [UIColor whiteColor];
        }];
    } else {
        [self.selectedViews removeObject:view];
    }

    self.colorButtonTapped([view getColor]);
}

- (IBAction)saveButtonTapped:(id)sender {
    self.hidden = YES;
}

@end
