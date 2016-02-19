//
//  Parrot.m
//  Parrot
//
//  Created by Webchimp on 19/02/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import "Parrot.h"

@implementation Parrot

- (void)setData {
    NSLog(@"poniendo todo");

    
    self.data = [[NSMutableArray alloc]initWithObjects:@"Cricket",@"Dancing",@"Painting",@"Swiming",@"guitar",@"movie",@"boxing",@"drum",@"hockey",@"chessing",@"gamming",@"hunting",@"killing",@"shoping",@"jamm"@"zooming", @"dado", @"dedo", @"dinosaurio", @"delfin", @"dass", @"dorito", @"danonino", @"dam", @"dash", nil];
    self.data_filtered = [[NSMutableArray alloc]init];
    
    self.text = [[UITextField alloc] init];
    [self.text setDelegate:self];
    self.text.frame = self.frame;

    self.text.backgroundColor=[UIColor whiteColor];
    
    //[self addSubview:self.text];
    NSLog(@"x= %f, y= %f, w= %f, h= %f", self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    
    self.table = [[UITableView alloc] initWithFrame: CGRectMake(self.text.frame.origin.x, (self.text.frame.origin.y + self.text.frame.size.height + 15), self.text.frame.size.width, (self.text.frame.size.height * 3)) style: UITableViewStyleGrouped];
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.scrollEnabled = YES;
    
    [self.table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellIdentifier"];
    
    //[self addSubview:self.table];
    [self.table setHidden:TRUE];
}

- (void)setup {
    NSLog(@"x= %f, y= %f, w= %f, h= %f", self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

/////////////////// DELEGATE METHODS OF TABLES
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data_filtered count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CellIdentifier"];
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        ;
    }
    cell.textLabel.text = [self.data_filtered objectAtIndex:indexPath.row];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[self endEditing:YES];
    if(self.textFiedlTag == 1)
    {
        self.text.text = [self.data_filtered objectAtIndex:indexPath.row];
        
    }
    else if(self.textFiedlTag == 2)
    {
        self.text.text = [self.data_filtered objectAtIndex:indexPath.row];
    }
    else if(self.textFiedlTag == 3)
    {
        self.text.text = [self.data_filtered objectAtIndex:indexPath.row];
    }
    else if(self.textFiedlTag == 4)
    {
        self.text.text = [self.data_filtered objectAtIndex:indexPath.row];
    }
    else
    {
        self.text.text = [self.data_filtered objectAtIndex:indexPath.row];
    }
    
}
//////////////////

//*****************//
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"%ld",(long)textField.tag);
    self.textFiedlTag = textField.tag;
    
    [self searchText:textField replacementString:@"Begin"];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    self.table.hidden = TRUE;
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.table.hidden = TRUE;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    [self searchText:textField replacementString:string];
    return YES;
}
//****************//


-(void) searchText:(UITextField *)textField replacementString:(NSString *)string
{
    
    if(self.textFiedlTag == 1)
    {
        self.table.frame = CGRectMake(4, 200, 320, 120);
        
    }
    else if(self.textFiedlTag == 2)
    {
        self.table.frame = CGRectMake(4, 248, 320, 120);
    }
    else if(self.textFiedlTag == 3)
    {
        self.table.frame = CGRectMake(4, 268, 320, 120);
    }
    else if(self.textFiedlTag == 4)
    {
        self.table.frame = CGRectMake(4, 268, 320, 120);
    }
    else
    {
        self.table.frame = CGRectMake(4, 268, 320, 120);
    }
    
    
    
    NSString *str_Search_String=[NSString stringWithFormat:@"%@",textField.text];
    if([string isEqualToString:@"Begin"])
        str_Search_String=[NSString stringWithFormat:@"%@",textField.text];
    else if([string isEqualToString:@""])
        str_Search_String = [str_Search_String substringToIndex:[str_Search_String length] - 1];
    else
        str_Search_String=[str_Search_String stringByAppendingString:string];
    
    self.data_filtered = [[NSMutableArray alloc] init];
    if(str_Search_String.length>0)
    {
        NSInteger counter = 0;
        for(NSString *name in self.data)
        {
            NSRange r = [name rangeOfString:str_Search_String options:NSCaseInsensitiveSearch];
            if(r.length>0)
            {
                [self.data_filtered addObject:name];
            }
            
            counter++;
            
        }
        
        if (self.data_filtered.count > 0)
        {
            NSLog(@"%@",self.data_filtered);
            self.table.hidden = FALSE;
            [self.table reloadData];
        }
        else
        {
            self.table.hidden = TRUE;
        }
        
        
        
    }
    else
    {
        [self.table setHidden:TRUE];
        
    }
    
}


@end
