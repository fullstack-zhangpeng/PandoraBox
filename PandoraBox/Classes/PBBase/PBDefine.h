//
//  Header.h
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/6.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#ifndef Header_h
#define Header_h

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-function"
// void(^block)(void)的指针是void(^*block)(void)
static void pb_BlockCleanUp(__strong void (^*block)(void))
{
    (*block)();
}

#pragma clang diagnostic pop

#define pb_endBlock \
__strong void (^block)(void) __attribute__((cleanup(pb_BlockCleanUp), unused)) = ^

#endif /* Header_h */
