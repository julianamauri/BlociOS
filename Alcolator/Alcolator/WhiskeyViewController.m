//
//  WhiskeyViewController.m
//  Alcolator
//
//  Created by Juliana Mauri on 01/07/2016.
//  Copyright (c) 2016 Bloc. All rights reserved.
//

#import "WhiskeyViewController.h"

@interface WhiskeyViewController ()

@end

@implementation WhiskeyViewController

- (IBAction)sliderValueDidChange:(UISlider *)sender {
    [self BadgeValueWithWholeNumberOfWhiskeyGlasses];
    
}

- (IBAction)buttonPressed:(id)sender {
    [self BadgeValueWithWholeNumberOfWhiskeyGlasses];
}

- (void)BadgeValueWithWholeNumberOfWhiskeyGlasses {
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12;  //assume they are 12oz beer bottles
    
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    float ouncesInOneWhiskeyGlass = 1;  // a 1oz shot
    float alcoholPercentageOfWhiskey = 0.4;  // 40% is average
    
    float ouncesOfAlcoholPerWhiskeyGlass = ouncesInOneWhiskeyGlass * alcoholPercentageOfWhiskey;
    float numberOfWhiskeyGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWhiskeyGlass;
    
    int wholeNumberWhiskeyGlasses = numberOfWhiskeyGlassesForEquivalentAlcoholAmount;
    
    NSString *beerText;
    
    if (numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    NSString *whiskeyText;
    
    if (wholeNumberWhiskeyGlasses == 1) {
        whiskeyText = NSLocalizedString(@"shot", @"singular shot");
    } else {
        whiskeyText = NSLocalizedString(@"shots", @"plural of shot");
    }
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %ld %@ of whiskey.", nil), numberOfBeers, beerText, [self.beerPercentTextField.text floatValue], wholeNumberWhiskeyGlasses, whiskeyText];
    self.resultLabel.text = resultText;
    
    [self.tabBarItem setBadgeValue:[NSString stringWithFormat:@"%d", wholeNumberWhiskeyGlasses]];
    
}

@end
