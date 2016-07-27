//
//  EventDetailViewController.m
//  Midterm (Storyboard)
//
//  Created by Viviane Chan on 2016-07-25.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "EventDetailViewController.h"
@import CoreLocation;
@import MapKit;
@import UIKit;
#import "CollectionViewCell.h"
#import "Dog.h"


@interface EventDetailViewController () <MKMapViewDelegate>


@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (assign, nonatomic) BOOL shouldZoomIntoUser;
@property (strong, nonatomic) NSArray *dogsInEvent;

@end

@implementation EventDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.eventTitleLabel.text = self.event.eventTitle;
    self.eventOrganizerLabel.text = self.event.eventOrganizer;
//    self.organizerImageView.image = 
//    self.eventDateLabel.text = [NSString stringWithFormat:@"On : %@ ", self.event.eventDate];
    
    Dog *mainDog = self.event.mainDog;
    
    self.organizerImageView.image = [UIImage imageWithData:mainDog.dogPicture];
    
    self.eventDescriptionLabel.text = self.event.eventDescription;
    
    self.mapView.delegate = self;
    
    self.dogsInEvent = [self.event.dog allObjects];
    
    [self showEventMap];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Show Map

- (void)showEventMap
{
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    [geocoder geocodeAddressString:self.event.eventAddress completionHandler:^(NSArray *placemarks, NSError *error) {
        
        if (placemarks && placemarks.count > 0) {
            CLPlacemark *topResult = [placemarks objectAtIndex:0];
            
            MKPlacemark *placemark = [[MKPlacemark alloc]initWithPlacemark:topResult];
            
            CLLocationCoordinate2D center = CLLocationCoordinate2DMake(placemark.coordinate.latitude,placemark.coordinate.longitude);
            
            MKCoordinateSpan span = MKCoordinateSpanMake(0.05, 0.05);
            MKCoordinateRegion regionToDisplay = MKCoordinateRegionMake(center, span);
            [self.mapView setRegion:regionToDisplay];
            
            [self.mapView addAnnotation:placemark];
            
        }}];
    
}


- (MKAnnotationView *)mapView:(MKMapView *)map viewForAnnotation:(id <MKAnnotation>)annotation
{
    static NSString *annotationViewReuseIdentifier = @"annotationViewReuseIdentifier";
    
    MKAnnotationView *annotationView = (MKAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:annotationViewReuseIdentifier];
    
    if (annotationView == nil)
    {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationViewReuseIdentifier];
    }
    
    annotationView.image = [UIImage imageNamed:@"rsz_dog-100"];
    annotationView.annotation = annotation;
    annotationView.canShowCallout = YES;
    
    return annotationView;
}



#pragma mark - Collection View

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView {
    // _data is a class member variable that contains one array per section.
    return 1;
}

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section {

    return [self.event.dog count]; // get dogs from relationship event-dog

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    CollectionViewCell *cvCell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"participantCell" forIndexPath:(NSIndexPath *)indexPath];
    
    Dog *dog = self.dogsInEvent[indexPath.item];
    
    cvCell.participantImageview.image = [UIImage imageWithData:dog.dogPicture];
    
    return cvCell;
    
}



@end
