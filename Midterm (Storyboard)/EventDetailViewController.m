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


@interface EventDetailViewController () <MKMapViewDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (assign, nonatomic) BOOL shouldZoomIntoUser;

@end

@implementation EventDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.eventTitleLabel.text = self.event.eventTitle;
    self.eventOrganizerLabel.text = [NSString stringWithFormat:@"Organized by: %@ ", self.event.eventOrganizer];
    self.eventDateLabel.text = [NSString stringWithFormat:@"On : %@ ", self.event.eventDate];
    
    self.mapView.delegate = self;
    
    [self showEventMap];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Geocode

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


@end
