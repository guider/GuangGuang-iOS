//
//
//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//                  佛祖保佑             永无BUG
//         .............................................
//
//
//  YYQSplashViewController.h
//  YYQ-Broker-iOS
//
//   github https://github.com/guider
//

//
// Created by apple on 16/9/5.
// Copyright (c) 2016 apple. All rights reserved.
//

#import "HomeCell.h"
#import "UILabel+Common.h"
#import "Masonry.h"

@interface HomeCell ()

@property(nonatomic, strong) UILabel *title;
@property(nonatomic, strong) UILabel *time;
@property(nonatomic, strong) UIImageView *image;

@end

@implementation HomeCell {

}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

    }
    return self;
}

- (void)model:(TModel *)model {
    _model = model;
    [self setupView];

}


- (void)setupView {
    [self.contentView addSubview:self.image];
    [self.contentView addSubview:self.title];
    [self.contentView addSubview:self.time];
    self.title.text = self.model.name;
    self.time.text = self.model.cloumn;

    self.title.backgroundColor = [UIColor redColor];
    [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-14);
        make.top.equalTo(self.contentView.mas_top).offset(19);
        make.height.mas_equalTo(30);
    }];

    [self.time mas_makeConstraints:^(MASConstraintMaker *maker) {
        maker.top.equalTo(self.contentView.mas_top).offset(40);

    }];
    [self.title mas_makeConstraints:^(MASConstraintMaker *maker) {
        maker.top.left.right.offset(20);
        maker.height.mas_equalTo(70);
    }];
}


- (UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] init];
        _title.font = [UIFont systemFontOfSize:19];
        _title.textColor = [UIColor blackColor];
    }
    return _title;
}

- (UILabel *)time {
    if (!_time) {
        _time = [[UILabel alloc] init];
        _time.font = [UIFont systemFontOfSize:15];
        _time.textColor = [UIColor blueColor];
    }
    return _time;
}

- (UIImageView *)image {
    if (_image) {
        _image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"defaullt_thumb.png"]];
        _image.contentMode = UIViewContentModeScaleAspectFit;
        [_image setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
        _image.backgroundColor = [UIColor redColor];
    }
    return _image;
}
@end