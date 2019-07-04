//
//  PandoraBoxHeader.h
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/4.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#ifndef PandoraBoxHeader_h
#define PandoraBoxHeader_h

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-function"
// void(^block)(void)的指针是void(^*block)(void)
static void blockCleanUp(__strong void (^*block)(void))
{
    (*block)();
}

#pragma clang diagnostic pop

#define endBlock \
    __strong void (^block)(void) __attribute__((cleanup(blockCleanUp), unused)) = ^

#endif /* PandoraBoxHeader_h */
