//
//  ViewController.h
//  SuperHeroPedia
//
//  Created by Dave Krawczyk on 9/6/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@end

/*
step 1 
 - created a new file of Superhero of subclass NSObject - add the two properties to the .h file - name and textDescription (don't just use description - it will overwrite the normal description which is a property of NSObject and is useful)
 - created the initWithDictionary in the .h and then went through and said what it would do within the .m - it currently takes in an NSDictionary and then will give back a name and the description - Taylor used an interesting way to not have to type objectForKey each time
 - then we went into the .m of the VC, imported the Superhero class, added a forin statement within the viewDidLoad to create objects of the Superhero class through that initWithDictionary that takes in the Dictionary
 
 step 2
 - we created a class method within the Superheroe.h file - retrieveSuperheroesWithCompletion - did this to make the viewDidLoad code a bit smaller, but Don said he may not bother doing something like this - that it was okay to keep it in the previous place 
 - we created a new NSArray for *results to take in the JSONSerialization stuff, then a mutable array that only holds as much data as is in the *results array - Don said we could do this when we won't be changing the array - it makes the program run slightly faster 
 - then we did the normal stuff of putting the new Superhero object that will be created into an array (superheroes) and then we complete that class method with the complete(superheroes) class method
 
 step 3 
 - since we created that class method within the Superhero.m section, we could not get rid of all that NSConnection stuff within the viewDidLoad of the VC.m - now we just called this on Superhero - the class method returned the array of superheroes that was created within the class method within the Superhero.m file - we then set that equal to the array that we have within the VC.m file
 - we then wanted to make sure that the tableView was reloaded whenever the self.heroes array is changed - for every property that we create, we automatically get a setter getter method - we then use this getter method later on within the -(void)setHeroes to make sure that the array that is passed in (heroes) is equal to the variable of _heroes and then we reload the tableView - this makes it so that the reloadData is tied to the method, to the setting of that array to whatever is returned from that block method








*/