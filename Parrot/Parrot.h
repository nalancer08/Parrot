//
//  Parrot.h
//  Parrot
//
//  Created by Webchimp on 19/02/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Parrot : UIViewController <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) UITextField *text;
@property (retain, nonatomic) NSMutableArray *data;
@property (retain, nonatomic) NSMutableArray *data_filtered;
@property (nonatomic) int textFiedlTag;
@property (retain, nonatomic) UITableView *table;

@property (nonatomic) CGRect frame;

// Methods
- (void)setData;
- (void)setData:(NSMutableArray *)data;
- (void)setFrameResults:(CGSize)size;

@end

