//
//  main.m
//  OCNature-1
//
//  Created by shenhua on 2018/8/26.
//  Copyright © 2018年 RWN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <objc/runtime.h>
#import <malloc/malloc.h>
 
struct NSObject_IMPL {
    Class isa;
};

struct Student_IMPL {
    struct NSObject_IMPL NSObject_IVARS;
    int _no;
    int _age;
};
 

@interface Student : NSObject{
    
    @public
    int _no;
    int _age;
    
}

@end

@implementation Student

@end





int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        /*
         //把oc代码转换成c++代码
         xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc main.m -o main-arm64.cpp
         苹果是小端模式
         */
        Student *stu =[[Student alloc] init];
        stu->_no = 4;
        stu->_age =5;
        
        NSLog(@"%zu",class_getInstanceSize([Student class]));
        NSLog(@"%zu",malloc_size((__bridge const void *)(stu)));
        
        struct Student_IMPL  *stuImp = (__bridge struct Student_IMPL *)(stu);
        NSLog(@"no is %d -- age is %d",stuImp->_no,stuImp->_age);
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
