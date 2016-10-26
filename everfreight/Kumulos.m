//
//  Kumulos.m
//  Kumulos
//
//  Created by Kumulos Bindings Compiler on Oct  1, 2016
//

#import <objc/runtime.h>
#import "Kumulos.h"

@interface KumulosDelegateHolder : NSObject

@property (weak,nonatomic) id <KumulosDelegate> delegate;

@end

@implementation KumulosDelegateHolder

+ (instancetype) createWithDelegate:(id <KumulosDelegate>)delegate {
    KumulosDelegateHolder* holder = [[KumulosDelegateHolder alloc] init];
    holder.delegate = delegate;
    return holder;
}

@end

@implementation Kumulos (Bindings)

- (instancetype) init {
    if (self = [self initWithAPIKey:@"gh39tmr2d0qqjq3vzpqb6bh74mhmqjdm" andSecretKey:@"d550mysk"]) {

    }

    return self;
}

- (void) setDelegate:(id<KumulosDelegate>)delegate {
    KumulosDelegateHolder* holder = [KumulosDelegateHolder createWithDelegate:delegate];
    objc_setAssociatedObject(self, @selector(delegate), holder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id <KumulosDelegate>) delegate {
    KumulosDelegateHolder* holder = objc_getAssociatedObject(self, @selector(delegate));

    if (nil == holder) {
        return nil;
    }

    return holder.delegate;
}

- (void) invokeDelegateSelector:(SEL)selector withArg:(id)arg andOperation:(KSAPIOperation*)operation {
    id <KumulosDelegate> delegate = self.delegate;

    if (!delegate || ![delegate respondsToSelector:selector]) {
        return;
    }

    NSMethodSignature* signature = [[delegate class] instanceMethodSignatureForSelector:selector];
    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];

    [invocation setTarget:delegate];
    [invocation setSelector:selector];

    Kumulos* k = self;
    [invocation setArgument:&k atIndex:2];
    [invocation setArgument:&operation atIndex:3];
    [invocation setArgument:&arg atIndex:4];

    [invocation invoke];
}


- (KSAPIOperation*) addNewCarrierWithCompanyName:(NSString*)companyName andMCNumber:(NSString*)mCNumber andEmail:(NSString*)email andContactNumber:(NSString*)contactNumber andPassword:(NSString*)password andContactName:(NSString*)contactName {
    NSMutableDictionary* params = [[NSMutableDictionary alloc] initWithCapacity:6];
    params[@"companyName"] = companyName;
    params[@"mCNumber"] = mCNumber;
    params[@"email"] = email;
    params[@"contactNumber"] = contactNumber;
    params[@"password"] = password;
    params[@"contactName"] = contactName;

    SEL selector = @selector(kumulosAPI: apiOperation: addNewCarrierDidCompleteWithResult:);

    KSAPIOperation* op = [self callMethod:@"addNewCarrier" withParams:params success:^(KSAPIResponse* response, KSAPIOperation* operation) {
        [self invokeDelegateSelector:selector withArg:response.payload andOperation:operation];
    } andFailure:^(NSError* error, KSAPIOperation* operation) {
        SEL selector = @selector(kumulosAPI:apiOperation:didFailWithError:);
        [self invokeDelegateSelector:selector withArg:[error description] andOperation:operation];
    }];

    return op;
}

- (KSAPIOperation*) carrierLogInWithPassword:(NSString*)password andEmail:(NSString*)email {
    NSMutableDictionary* params = [[NSMutableDictionary alloc] initWithCapacity:2];
    params[@"password"] = password;
    params[@"email"] = email;

    SEL selector = @selector(kumulosAPI: apiOperation: carrierLogInDidCompleteWithResult:);

    KSAPIOperation* op = [self callMethod:@"carrierLogIn" withParams:params success:^(KSAPIResponse* response, KSAPIOperation* operation) {
        [self invokeDelegateSelector:selector withArg:response.payload andOperation:operation];
    } andFailure:^(NSError* error, KSAPIOperation* operation) {
        SEL selector = @selector(kumulosAPI:apiOperation:didFailWithError:);
        [self invokeDelegateSelector:selector withArg:[error description] andOperation:operation];
    }];

    return op;
}

- (KSAPIOperation*) addNewDriverWithCompanyName:(NSString*)companyName andMcNumber:(NSString*)mcNumber andContactNumber:(NSString*)contactNumber andEmail:(NSString*)email andPassword:(NSString*)password andContactName:(NSString*)contactName {
    NSMutableDictionary* params = [[NSMutableDictionary alloc] initWithCapacity:6];
    params[@"companyName"] = companyName;
    params[@"mcNumber"] = mcNumber;
    params[@"contactNumber"] = contactNumber;
    params[@"email"] = email;
    params[@"password"] = password;
    params[@"contactName"] = contactName;

    SEL selector = @selector(kumulosAPI: apiOperation: addNewDriverDidCompleteWithResult:);

    KSAPIOperation* op = [self callMethod:@"addNewDriver" withParams:params success:^(KSAPIResponse* response, KSAPIOperation* operation) {
        [self invokeDelegateSelector:selector withArg:response.payload andOperation:operation];
    } andFailure:^(NSError* error, KSAPIOperation* operation) {
        SEL selector = @selector(kumulosAPI:apiOperation:didFailWithError:);
        [self invokeDelegateSelector:selector withArg:[error description] andOperation:operation];
    }];

    return op;
}

- (KSAPIOperation*) driverLoginWithEmail:(NSString*)email andPassword:(NSString*)password {
    NSMutableDictionary* params = [[NSMutableDictionary alloc] initWithCapacity:2];
    params[@"email"] = email;
    params[@"password"] = password;

    SEL selector = @selector(kumulosAPI: apiOperation: driverLoginDidCompleteWithResult:);

    KSAPIOperation* op = [self callMethod:@"driverLogin" withParams:params success:^(KSAPIResponse* response, KSAPIOperation* operation) {
        [self invokeDelegateSelector:selector withArg:response.payload andOperation:operation];
    } andFailure:^(NSError* error, KSAPIOperation* operation) {
        SEL selector = @selector(kumulosAPI:apiOperation:didFailWithError:);
        [self invokeDelegateSelector:selector withArg:[error description] andOperation:operation];
    }];

    return op;
}

- (KSAPIOperation*) getShipWithPickupAddress:(NSString*)pickupAddress andDropoffAddress:(NSString*)dropoffAddress andLoadWeight:(NSString*)loadWeight andEquipmentType:(NSString*)equipmentType {
    NSMutableDictionary* params = [[NSMutableDictionary alloc] initWithCapacity:4];
    params[@"pickupAddress"] = pickupAddress;
    params[@"dropoffAddress"] = dropoffAddress;
    params[@"loadWeight"] = loadWeight;
    params[@"equipmentType"] = equipmentType;

    SEL selector = @selector(kumulosAPI: apiOperation: getShipDidCompleteWithResult:);

    KSAPIOperation* op = [self callMethod:@"getShip" withParams:params success:^(KSAPIResponse* response, KSAPIOperation* operation) {
        [self invokeDelegateSelector:selector withArg:response.payload andOperation:operation];
    } andFailure:^(NSError* error, KSAPIOperation* operation) {
        SEL selector = @selector(kumulosAPI:apiOperation:didFailWithError:);
        [self invokeDelegateSelector:selector withArg:[error description] andOperation:operation];
    }];

    return op;
}

- (KSAPIOperation*) uploadNewShipmentWithPickupCompany:(NSString*)pickupCompany andPickupAddress:(NSString*)pickupAddress andPickupDateTime:(NSString*)pickupDateTime andPickupRef1:(NSString*)pickupRef1 andPickupRef2:(NSString*)pickupRef2 andPickupNotes:(NSString*)pickupNotes andDropoffCompany:(NSString*)dropoffCompany andDropoffAddress:(NSString*)dropoffAddress andDropoffDateTime:(NSString*)dropoffDateTime andDropoffRef1:(NSString*)dropoffRef1 andDropoffRef2:(NSString*)dropoffRef2 andDropoffNotes:(NSString*)dropoffNotes andProductDescription:(NSString*)productDescription andPieceCount:(NSString*)pieceCount andLoadDimensions:(NSString*)loadDimensions andLoadWeight:(NSString*)loadWeight andLoadValue:(NSString*)loadValue andEquipmentType:(NSString*)equipmentType andAdditionalInfo:(NSString*)additionalInfo {
    NSMutableDictionary* params = [[NSMutableDictionary alloc] initWithCapacity:19];
    params[@"pickupCompany"] = pickupCompany;
    params[@"pickupAddress"] = pickupAddress;
    params[@"pickupDateTime"] = pickupDateTime;
    params[@"pickupRef1"] = pickupRef1;
    params[@"pickupRef2"] = pickupRef2;
    params[@"pickupNotes"] = pickupNotes;
    params[@"dropoffCompany"] = dropoffCompany;
    params[@"dropoffAddress"] = dropoffAddress;
    params[@"dropoffDateTime"] = dropoffDateTime;
    params[@"dropoffRef1"] = dropoffRef1;
    params[@"dropoffRef2"] = dropoffRef2;
    params[@"dropoffNotes"] = dropoffNotes;
    params[@"productDescription"] = productDescription;
    params[@"pieceCount"] = pieceCount;
    params[@"loadDimensions"] = loadDimensions;
    params[@"loadWeight"] = loadWeight;
    params[@"loadValue"] = loadValue;
    params[@"equipmentType"] = equipmentType;
    params[@"additionalInfo"] = additionalInfo;

    SEL selector = @selector(kumulosAPI: apiOperation: uploadNewShipmentDidCompleteWithResult:);

    KSAPIOperation* op = [self callMethod:@"uploadNewShipment" withParams:params success:^(KSAPIResponse* response, KSAPIOperation* operation) {
        [self invokeDelegateSelector:selector withArg:response.payload andOperation:operation];
    } andFailure:^(NSError* error, KSAPIOperation* operation) {
        SEL selector = @selector(kumulosAPI:apiOperation:didFailWithError:);
        [self invokeDelegateSelector:selector withArg:[error description] andOperation:operation];
    }];

    return op;
}

- (KSAPIOperation*) uploadQuickQuoteWithEquipmentType:(NSString*)equipmentType andContactNumber:(NSString*)contactNumber andTotalWeight:(NSString*)totalWeight andPickupZip:(NSString*)pickupZip andDropoffZip:(NSString*)dropoffZip andPieceCount:(NSString*)pieceCount {
    NSMutableDictionary* params = [[NSMutableDictionary alloc] initWithCapacity:6];
    params[@"equipmentType"] = equipmentType;
    params[@"contactNumber"] = contactNumber;
    params[@"totalWeight"] = totalWeight;
    params[@"pickupZip"] = pickupZip;
    params[@"dropoffZip"] = dropoffZip;
    params[@"pieceCount"] = pieceCount;

    SEL selector = @selector(kumulosAPI: apiOperation: uploadQuickQuoteDidCompleteWithResult:);

    KSAPIOperation* op = [self callMethod:@"uploadQuickQuote" withParams:params success:^(KSAPIResponse* response, KSAPIOperation* operation) {
        [self invokeDelegateSelector:selector withArg:response.payload andOperation:operation];
    } andFailure:^(NSError* error, KSAPIOperation* operation) {
        SEL selector = @selector(kumulosAPI:apiOperation:didFailWithError:);
        [self invokeDelegateSelector:selector withArg:[error description] andOperation:operation];
    }];

    return op;
}

- (KSAPIOperation*) addNewShipperWithShipperName:(NSString*)shipperName andShipperContact:(NSString*)shipperContact andShipperEmail:(NSString*)shipperEmail andShipperPassword:(NSString*)shipperPassword andContactName:(NSString*)contactName {
    NSMutableDictionary* params = [[NSMutableDictionary alloc] initWithCapacity:5];
    params[@"shipperName"] = shipperName;
    params[@"shipperContact"] = shipperContact;
    params[@"shipperEmail"] = shipperEmail;
    params[@"shipperPassword"] = shipperPassword;
    params[@"contactName"] = contactName;

    SEL selector = @selector(kumulosAPI: apiOperation: addNewShipperDidCompleteWithResult:);

    KSAPIOperation* op = [self callMethod:@"addNewShipper" withParams:params success:^(KSAPIResponse* response, KSAPIOperation* operation) {
        [self invokeDelegateSelector:selector withArg:response.payload andOperation:operation];
    } andFailure:^(NSError* error, KSAPIOperation* operation) {
        SEL selector = @selector(kumulosAPI:apiOperation:didFailWithError:);
        [self invokeDelegateSelector:selector withArg:[error description] andOperation:operation];
    }];

    return op;
}

- (KSAPIOperation*) shipperLoginWithShipperEmail:(NSString*)shipperEmail andShipperPassword:(NSString*)shipperPassword {
    NSMutableDictionary* params = [[NSMutableDictionary alloc] initWithCapacity:2];
    params[@"shipperEmail"] = shipperEmail;
    params[@"shipperPassword"] = shipperPassword;

    SEL selector = @selector(kumulosAPI: apiOperation: shipperLoginDidCompleteWithResult:);

    KSAPIOperation* op = [self callMethod:@"shipperLogin" withParams:params success:^(KSAPIResponse* response, KSAPIOperation* operation) {
        [self invokeDelegateSelector:selector withArg:response.payload andOperation:operation];
    } andFailure:^(NSError* error, KSAPIOperation* operation) {
        SEL selector = @selector(kumulosAPI:apiOperation:didFailWithError:);
        [self invokeDelegateSelector:selector withArg:[error description] andOperation:operation];
    }];

    return op;
}

@end