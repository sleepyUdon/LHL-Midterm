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


@interface EventDetailViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (assign, nonatomic) BOOL shouldZoomIntoUser;
@property (strong,nonatomic) MKPlacemark *placemark;

@end

@implementation EventDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.eventTitleLabel.text = self.event.eventTitle;
    self.eventOrganizerLabel.text = [NSString stringWithFormat:@"Organized by: %@ ", self.event.eventOrganizer];
    self.eventDateLabel.text = [NSString stringWithFormat:@"On : %@ ", self.event.eventDate];
    
    self.shouldZoomIntoUser = YES;
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    self.mapView.delegate = self;
    //   self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    //   self.locationManager.distanceFilter = 50;
    
    if ([CLLocationManager locationServicesEnabled]) {
        
        if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
            
            [self.locationManager requestWhenInUseAuthorization];
        }
        
    }
    
    
    [self showEventMap];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    NSLog(@"Authorization Changed to: %d", status);
    
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        NSLog(@"Authorized!");
        
        self.mapView.showsUserLocation = YES;
        self.mapView.showsPointsOfInterest = YES;
        
        [self.locationManager startUpdatingLocation];
        
        //[self.locationM anager requestLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    NSLog(@"New locations: %@", locations);
    // [self.locationManager stopUpdatingLocation]
    
    CLLocation *location = [locations lastObject];
    
    if (self.shouldZoomIntoUser) {
        self.shouldZoomIntoUser = NO;
        
        CLLocationCoordinate2D coordinate = location.coordinate;
        
        MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, MKCoordinateSpanMake(0.001, 0.001));
        [self.mapView setRegion:region animated:YES];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Location error: %@", error.localizedDescription);
}

#pragma mark - Geocode

- (void)showEventMap
{
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    [geocoder geocodeAddressString:self.event.eventAddress completionHandler:^(NSArray *placemarks, NSError *error) {
        
        if (placemarks && placemarks.count > 0) {
            CLPlacemark *topResult = [placemarks objectAtIndex:0];
            
            MKPlacemark *placemark = [[MKPlacemark alloc]initWithPlacemark:topResult];
            self.placemark = placemark;
            
            CLLocationCoordinate2D center = CLLocationCoordinate2DMake(self.placemark.coordinate.latitude,self.placemark.coordinate.longitude);
            
            MKCoordinateSpan span = MKCoordinateSpanMake(0.05, 0.05);
            MKCoordinateRegion regionToDisplay = MKCoordinateRegionMake(center, span);
            [self.mapView setRegion:regionToDisplay];
            
            [self.mapView addAnnotation:self.placemark];
            
        }}];
    
}


@end
