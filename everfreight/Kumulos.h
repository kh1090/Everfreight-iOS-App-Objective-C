//
//  Kumulos.h
//  Kumulos
//
//  Created by Kumulos Bindings Compiler on Oct  1, 2016
//

#import <Foundation/Foundation.h>
@import KumulosSDK;

typedef Kumulos kumulosProxy;

@protocol KumulosDelegate <NSObject>
@optional

- (void) kumulosAPI:(kumulosProxy*)kumulos apiOperation:(KSAPIOperation*)operation didFailWithError:(NSString*)theError;

- (void) kumulosAPI:(Kumulos*)kumulos apiOperation:(KSAPIOperation*)operation addNewCarrierDidCompleteWithResult:(NSNumber*)newRecordID;
- (void) kumulosAPI:(Kumulos*)kumulos apiOperation:(KSAPIOperation*)operation carrierLogInDidCompleteWithResult:(NSArray*)theResults;
- (void) kumulosAPI:(Kumulos*)kumulos apiOperation:(KSAPIOperation*)operation addNewDriverDidCompleteWithResult:(NSNumber*)newRecordID;
- (void) kumulosAPI:(Kumulos*)kumulos apiOperation:(KSAPIOperation*)operation driverLoginDidCompleteWithResult:(NSArray*)theResults;
- (void) kumulosAPI:(Kumulos*)kumulos apiOperation:(KSAPIOperation*)operation getShipDidCompleteWithResult:(NSArray*)theResults;
- (void) kumulosAPI:(Kumulos*)kumulos apiOperation:(KSAPIOperation*)operation uploadNewShipmentDidCompleteWithResult:(NSNumber*)newRecordID;
- (void) kumulosAPI:(Kumulos*)kumulos apiOperation:(KSAPIOperation*)operation uploadQuickQuoteDidCompleteWithResult:(NSNumber*)newRecordID;
- (void) kumulosAPI:(Kumulos*)kumulos apiOperation:(KSAPIOperation*)operation addNewShipperDidCompleteWithResult:(NSNumber*)newRecordID;
- (void) kumulosAPI:(Kumulos*)kumulos apiOperation:(KSAPIOperation*)operation shipperLoginDidCompleteWithResult:(NSArray*)theResults;

@end

@interface Kumulos (Bindings)

@property (nonatomic,weak) id <KumulosDelegate> delegate;

- (instancetype) init;

- (KSAPIOperation*) addNewCarrierWithCompanyName:(NSString*)companyName andMCNumber:(NSString*)mCNumber andEmail:(NSString*)email andContactNumber:(NSString*)contactNumber andPassword:(NSString*)password andContactName:(NSString*)contactName;
- (KSAPIOperation*) carrierLogInWithPassword:(NSString*)password andEmail:(NSString*)email;
- (KSAPIOperation*) addNewDriverWithCompanyName:(NSString*)companyName andMcNumber:(NSString*)mcNumber andContactNumber:(NSString*)contactNumber andEmail:(NSString*)email andPassword:(NSString*)password andContactName:(NSString*)contactName;
- (KSAPIOperation*) driverLoginWithEmail:(NSString*)email andPassword:(NSString*)password;
- (KSAPIOperation*) getShipWithPickupAddress:(NSString*)pickupAddress andDropoffAddress:(NSString*)dropoffAddress andLoadWeight:(NSString*)loadWeight andEquipmentType:(NSString*)equipmentType;
- (KSAPIOperation*) uploadNewShipmentWithPickupCompany:(NSString*)pickupCompany andPickupAddress:(NSString*)pickupAddress andPickupDateTime:(NSString*)pickupDateTime andPickupRef1:(NSString*)pickupRef1 andPickupRef2:(NSString*)pickupRef2 andPickupNotes:(NSString*)pickupNotes andDropoffCompany:(NSString*)dropoffCompany andDropoffAddress:(NSString*)dropoffAddress andDropoffDateTime:(NSString*)dropoffDateTime andDropoffRef1:(NSString*)dropoffRef1 andDropoffRef2:(NSString*)dropoffRef2 andDropoffNotes:(NSString*)dropoffNotes andProductDescription:(NSString*)productDescription andPieceCount:(NSString*)pieceCount andLoadDimensions:(NSString*)loadDimensions andLoadWeight:(NSString*)loadWeight andLoadValue:(NSString*)loadValue andEquipmentType:(NSString*)equipmentType andAdditionalInfo:(NSString*)additionalInfo;
- (KSAPIOperation*) uploadQuickQuoteWithEquipmentType:(NSString*)equipmentType andContactNumber:(NSString*)contactNumber andTotalWeight:(NSString*)totalWeight andPickupZip:(NSString*)pickupZip andDropoffZip:(NSString*)dropoffZip andPieceCount:(NSString*)pieceCount;
- (KSAPIOperation*) addNewShipperWithShipperName:(NSString*)shipperName andShipperContact:(NSString*)shipperContact andShipperEmail:(NSString*)shipperEmail andShipperPassword:(NSString*)shipperPassword andContactName:(NSString*)contactName;
- (KSAPIOperation*) shipperLoginWithShipperEmail:(NSString*)shipperEmail andShipperPassword:(NSString*)shipperPassword;

@end