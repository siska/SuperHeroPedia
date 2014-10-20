//
//  ViewController.m
//  SuperHeroPedia
//
//  Created by Dave Krawczyk on 9/6/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "ViewController.h"
#import "Superhero.h" //step 1


@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *heroes;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];

    [Superhero retrieveSuperheroesWithCompletion:^(NSArray *superheroes) {
        self.heroes = superheroes; //step 3
    }];

    //got rid of in step 3 - was put into the Superhero.m file
//    NSURL *url = [NSURL URLWithString:@"https://s3.amazonaws.com/mobile-makers-lib/superheroes.json"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        
//        self.heroes = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
//
//        for (NSDictionary *dict in self.heroes) {
//            Superhero *superhero = [[Superhero alloc] initWithDictionary:dict];
//            NSLog(@"superhero: %@", superhero);
//        }
//
//        [self.tableView reloadData];
//    }];

}

-(void)setHeroes:(NSArray *)heroes //step 3
{
    _heroes = heroes;
    [self.tableView reloadData];
}


#pragma mark - Tableview Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heroes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"superHeroCell"];
    
    Superhero *superhero = [self.heroes objectAtIndex:indexPath.row]; //changed to Superhero from NSDictionary
    cell.textLabel.text = superhero.name; //step 3 - removed this: [superhero objectForKey:@"name"];
    cell.detailTextLabel.text = superhero.textDescription; //step 3 - removed this: [superhero objectForKey:@"description"] ;
    cell.detailTextLabel.numberOfLines = 2;

    //step 3 - commented out as it was part of the image pull
//    NSURL *url = [NSURL URLWithString:[superhero objectForKey:@"avatar_url"]];
//    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        [cell.imageView setImage:[UIImage imageWithData:data]];
//        [cell layoutSubviews];
//    }];

    return cell;
}




@end
