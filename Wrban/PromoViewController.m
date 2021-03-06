//
//  PromoViewController.m
//  Wrban
//
//  Created by Dacodes on 03/01/16.
//  Copyright © 2016 Dacodes. All rights reserved.
//

#import "PromoViewController.h"
#import "SellProfileTableViewCell.h"

@interface PromoViewController ()<UITableViewDataSource,UITableViewDelegate> {
    BOOL imagedLiked;
}

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation PromoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Promoción";
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    imagedLiked = NO;
    self.myTableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.view setNeedsLayout];
    //[self.myTableView reloadData];
}

#pragma mark - TableView

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 567.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    NSInteger viewWidth = self.view.bounds.size.width;
    
    UIView* header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, viewWidth, 44)];
    header.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [header setAlpha:.9];
    
    UIButton*profilePicture=[UIButton buttonWithType:UIButtonTypeCustom];
    [profilePicture setFrame:CGRectMake(10, 4, 36, 36)];
    //[profilePicture sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.nearmart.com/v1/media/%@/105/105",self.profilePicHash]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"ProfileUser"] options:SDWebImageRefreshCached];
    [profilePicture setImage:[UIImage imageNamed:self.logo] forState:UIControlStateNormal];
    profilePicture.imageView.contentMode=UIViewContentModeScaleAspectFit;
    profilePicture.backgroundColor = [UIColor whiteColor];
    //[profilePicture addTarget:self action:@selector(showProfile) forControlEvents:UIControlEventTouchUpInside];
    profilePicture.layer.cornerRadius = 10.0;
    profilePicture.layer.borderColor = [UIColor clearColor].CGColor;
    profilePicture.layer.borderWidth = 2.0;
    profilePicture.layer.masksToBounds = YES;
    profilePicture.clipsToBounds = YES;
    
    [header addSubview:profilePicture];
    
    UIButton *nameProfile=[UIButton buttonWithType:UIButtonTypeSystem];
    [nameProfile setFrame:CGRectMake(60, 0, 150, 44)];
    [nameProfile setTitle:self.company forState:UIControlStateNormal];
    //[nameProfile addTarget:self action:@selector(showProfile) forControlEvents:UIControlEventTouchUpInside];
    [nameProfile.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
    nameProfile.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    [nameProfile setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    nameProfile.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
    //[nameProfile.titleLabel setAdjustsFontSizeToFitWidth:YES];
    [header addSubview:nameProfile];
    
    //    UIButton *time=[UIButton buttonWithType:UIButtonTypeSystem];
    //    [time setFrame:CGRectMake(viewWidth - 140, 16, 15, 15)];
    //    [time setImage:[UIImage imageNamed:@"Time"] forState:UIControlStateNormal];
    //    [time setTintColor:[UIColor colorWithRed:133.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1]];
    //    time.userInteractionEnabled=NO;
    //    [header addSubview:time];
    //
    //    UILabel*timeLabel=[[UILabel alloc]initWithFrame:CGRectMake(viewWidth - 124, 9, 25, 30)];
    //    timeLabel.text=[NSString stringWithFormat:@"%@",@"2 sem"];
    //    timeLabel.textColor=[UIColor colorWithRed:133.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1];
    //    timeLabel.font=[UIFont fontWithName:@"Gotham-Light" size:11.0f];
    //    [header addSubview:timeLabel];
    //
    //    UIView*line=[[UIView alloc]initWithFrame:CGRectMake(viewWidth - 96, 12, 2, 20)];
    //    line.backgroundColor=[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:80/255.0 alpha:.1];
    //    [header addSubview:line];
    //
    //    UIButton *favorites=[UIButton buttonWithType:UIButtonTypeSystem];
    //    [favorites setFrame:CGRectMake(viewWidth - 85, 16, 15, 15)];
    //    [favorites setImage:[UIImage imageNamed:@"Interested"] forState:UIControlStateNormal];
    //    [favorites setTintColor:[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:80/255.0 alpha:1]];
    //    favorites.userInteractionEnabled=NO;
    //    [header addSubview:favorites];
    //
    //    UILabel*favoritesLabel=[[UILabel alloc]initWithFrame:CGRectMake(viewWidth - 68, 9, 30, 30)];
    //    favoritesLabel.text=[NSString stringWithFormat:@"%@",@"10"];
    //    favoritesLabel.textColor=[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:80/255.0 alpha:1];
    //    favoritesLabel.font=[UIFont fontWithName:@"Gotham-Light" size:11.0f];
    //    [header addSubview:favoritesLabel];
    //
    //    UIButton *comments=[UIButton buttonWithType:UIButtonTypeSystem];
    //    [comments setFrame:CGRectMake(viewWidth - 48, 16, 15, 15)];
    //    [comments setImage:[UIImage imageNamed:@"Contacted"] forState:UIControlStateNormal];
    //    [comments setTintColor:[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:80/255.0 alpha:1]];
    //    comments.userInteractionEnabled=NO;
    //    [header addSubview:comments];
    
    UILabel*commentssLabel=[[UILabel alloc]initWithFrame:CGRectMake(viewWidth - 50, 9, 50, 30)];
    commentssLabel.text=[NSString stringWithFormat:@"%@",@"1 sem"];
    commentssLabel.textColor=[UIColor blackColor];
    commentssLabel.font=[UIFont systemFontOfSize:12.0f];
    [header addSubview:commentssLabel];
    
    return header;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44.0;
}

- (SellProfileTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SellProfileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    //[cell.image sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.nearmart.com/v1/media/%@/640/640",[self.infoSale objectForKey:@"picture_hash"]]]placeholderImage:nil];
    cell.image.image = [UIImage imageNamed:self.promoImage];
    //temp=cell.image.image;
    cell.image.contentMode=UIViewContentModeScaleAspectFit;
    
    cell.titlePhoto.text=@"Promo";
    cell.titlePhoto.font=[UIFont systemFontOfSize:14.0f];
    cell.titlePhoto.textColor=[UIColor blackColor];
    cell.pricePhoto.text=[NSString stringWithFormat:@"$10.0"];
    cell.pricePhoto.font=[UIFont systemFontOfSize:14.0f];
    
    //    if ([self.infoSale objectForKey:@"items"] == nil) {
    //        cell.stockPhoto.text=[NSString stringWithFormat:@"%@ ITEMS LEFT",[saleInfo objectForKey:@"items"]];
    //    }else{
    //        cell.stockPhoto.text=[NSString stringWithFormat:@"%@ ITEMS LEFT",[self.infoSale objectForKey:@"items"]];
    //    }
    
    cell.stockPhoto.font=[UIFont systemFontOfSize:14.0f];
    cell.descriptionPhoto.text = @"sdcbusdfhcbjakhcbkjbhjadschkbasdkchjbasdkjchbasdcjkhsabdcjadshbcjhsdabcakjsdhcbadsjkhcbasdkjchbadjkchasbdjchsdcbusdfhcbjakhcbkjbhjadschkbasdkchjbasdkjchbasdcjkhsabdcjadshbcjhsdabcakjsdhcbadsjkhcbasdkjchbadjkchasbdjch";
    cell.descriptionPhoto.font=[UIFont systemFontOfSize:14.0f];
    cell.descriptionPhoto.textColor=[UIColor blackColor];
    
    //[cell.interestingButton addTarget:self action:@selector(interestedSale:) forControlEvents:UIControlEventTouchUpInside];
    [cell.interestingButton.titleLabel setFont:[UIFont fontWithName:@"Gotham-Light" size:10.0]];
    //    if (self.isInterested) {
    //        [cell.interestingButton setTitle:@"      I'M INTERESTED" forState:UIControlStateNormal];
    //        [cell.interestingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //        [cell.interestingButton setBackgroundImage:[UIImage imageNamed:@"InterestingSelected"] forState:UIControlStateNormal];
    //        cell.interestingButton.selected=YES;
    //    }else{
    //        [cell.interestingButton setTitle:@"     INTERESTING" forState:UIControlStateNormal];
    //        [cell.interestingButton setTitleColor:[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:80/255.0 alpha:1] forState:UIControlStateNormal];
    //        [cell.interestingButton setBackgroundImage:[UIImage imageNamed:@"Interesting"] forState:UIControlStateNormal];
    //        cell.interestingButton.selected=NO;
    //    }
    //
    //    if (![self.idUser isEqualToString:[self IDUser]]) {
    //        [cell.contactButton.titleLabel setFont:[UIFont fontWithName:@"Gotham-Light" size:10.0]];
    //        [cell.contactButton setTitle:@"      CONTACT" forState:UIControlStateNormal];
    //        [cell.contactButton setTitleColor:[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:80/255.0 alpha:1] forState:UIControlStateNormal];
    //        [cell.contactButton addTarget:self action:@selector(contactUser) forControlEvents:UIControlEventTouchUpInside];
    //    }else{
    //        //cell.contactButton.hidden=YES;
    //        [cell.contactButton.titleLabel setFont:[UIFont fontWithName:@"Gotham-Light" size:10.0]];
    //        [cell.contactButton setTitle:@"      REMOVE" forState:UIControlStateNormal];
    //        [cell.contactButton setTitleColor:[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:80/255.0 alpha:1] forState:UIControlStateNormal];
    //        [cell.contactButton addTarget:self action:@selector(removeSale) forControlEvents:UIControlEventTouchUpInside];
    //    }
    
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(interstedSaleDoubleTap:)];
        tapGestureRecognizer.numberOfTapsRequired=2;
        cell.image.tag=indexPath.section;
        cell.image.userInteractionEnabled=YES;
        [cell.image addGestureRecognizer:tapGestureRecognizer];
    
    cell.likeButton.selected = imagedLiked;
    [cell.likeButton setImage:[UIImage imageNamed:@"RedHeart"] forState:UIControlStateSelected];
    [cell.likeButton setImage:[UIImage imageNamed:@"UnfilledHeart"] forState:UIControlStateNormal];
    
    [cell.likeButton addTarget:self action:@selector(likeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];

    
    
    //[cell.contactButton addTarget:self action:@selector(createConversation) forControlEvents:UIControlEventTouchUpInside];
    //    [cell.contactButton setTitle:@"       CONTACTED" forState:UIControlStateHighlighted];
    //    [cell.contactButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    //    [cell.contactButton setBackgroundImage:[UIImage imageNamed:@"ContactSelected"] forState:UIControlStateHighlighted];
    
    return cell;
}


-(void)interstedSaleDoubleTap:(id)sender {
    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
    SellProfileTableViewCell *cell = [self.myTableView cellForRowAtIndexPath:path];
    cell.likeButton.selected = YES;
    imagedLiked = YES;
    [UIView animateWithDuration:0.2 animations:^{
        cell.heartImageView.alpha = 1;
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 delay:0.5 options:nil animations:^{
            cell.heartImageView.alpha = 0;
        } completion:^(BOOL finished) {
        }];
    }];


}

-(void)likeButtonPressed:(UIButton *)sender {
    sender.selected = !sender.selected;
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
