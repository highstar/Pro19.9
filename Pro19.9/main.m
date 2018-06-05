//
//  main.m
//  Pro19.9
//
//  Created by Gao Xing on 2018/6/5.
//  Copyright © 2018年 Gao Xing. All rights reserved.
//
#import "AddressBook.h"
#import "Foo.h"

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSData *dataArea;
        NSKeyedUnarchiver *unarchiver;
        Foo *myFoo1;
        AddressBook *myBook;
        
        // Read in the archive and connect an NSKeyedUnarchiver object to it
        
        dataArea = [NSData dataWithContentsOfFile:@"myArchive"];
        
        if (!dataArea) {
            NSLog(@"Can't read back archive file!");
            return 1;
        }
        
        unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:dataArea];
        
        // Decode the objects we previously stored in the archive
        myBook = [unarchiver decodeObjectForKey:@"myaddrbook"];
        myFoo1 = [unarchiver decodeObjectForKey:@"myfoo1"];
        
        [unarchiver finishDecoding];
        
        // Verfiy that the restore was successfully
        [myBook list];
        NSLog(@"%@\n%i\n%g", myFoo1.strVal, myFoo1.intVal, myFoo1.floatVal);
    }
    return 0;
}
