//
//  PGPPublicKeyPacketTests.m
//  ObjectivePGP
//
//  Created by Marcin Krzyzanowski on 18/01/15.
//  Copyright (c) 2015 Marcin Krzyżanowski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSInputStream+PGPTests.h"
#import "PGPPublicKeyPacket.h"
#import "PGPPacketHeader.h"

@interface PGPPublicKeyPacketTests : XCTestCase

@end

@implementation PGPPublicKeyPacketTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void) testReadPublicKeyPacket
{
    Byte publicKey[] = {0x99,0x01,0x0D,0x04,0x53,0x8E,0x9E,0xBC,0x01,0x08,0x00,0xD0,0xB3,0x0C,0xDE,0xA4,0xD3,0x28,0x87,0x5F,0xEB,0x60,0x6B,0x92,0xF8,0x93,0xF3,0x11,0xA2,0x22,0x6F,0xC5,0xF4,0xF5,0x67,0x64,0x2C,0xA6,0x36,0x62,0xC0,0x14,0xF0,0x4C,0x25,0xFB,0x4E,0x05,0x6E,0x39,0x42,0xC8,0xA9,0x6B,0xCD,0xC9,0x0C,0x4D,0xFC,0x6D,0x68,0xAB,0x75,0x73,0x08,0x2C,0xFD,0x69,0xA2,0x57,0x06,0xE1,0xF6,0xDF,0x2C,0x86,0xE6,0x07,0xDA,0xAD,0x21,0x89,0x5F,0xD7,0xB4,0x18,0xB0,0xC5,0x6B,0x39,0xDE,0x5F,0xA7,0x88,0x99,0x0F,0x5F,0x9D,0xAF,0x6F,0xAB,0x13,0x51,0x69,0xBA,0x52,0xCB,0x7E,0xE9,0x1A,0x49,0x79,0x55,0xBD,0x5D,0x90,0xCE,0x59,0xDF,0x1C,0xBB,0xDD,0x6E,0xE4,0xB9,0x04,0xDA,0x05,0x85,0x30,0x56,0xB1,0x8E,0x35,0xD5,0x46,0xFE,0xD8,0x55,0x07,0x48,0x1E,0x26,0x42,0x85,0x37,0x81,0xA8,0xE8,0xE6,0x99,0x7D,0x4B,0x3D,0x6B,0xEE,0xAD,0x15,0x01,0xB5,0x31,0xA6,0xB8,0xF0,0x36,0x93,0x59,0x0A,0xE2,0xAC,0x5C,0x32,0xF0,0xB4,0xF5,0x1A,0xD6,0xF4,0x7D,0x6B,0xA5,0x62,0x9C,0x8B,0x2D,0x8D,0x1D,0xC5,0x77,0x23,0x3F,0xB6,0x77,0x43,0xFC,0x0E,0x80,0x6A,0x1F,0xB9,0xF0,0x69,0x18,0x8B,0x71,0x94,0xD2,0xA6,0x8E,0x1A,0xEF,0x7F,0xC7,0x96,0x35,0xCC,0xC0,0x1C,0x43,0x52,0x4C,0xF9,0x54,0xD4,0xA7,0x48,0xA5,0x1E,0xC2,0xD8,0x31,0x6A,0xFB,0x35,0xAC,0x05,0x20,0x66,0x7A,0xFC,0xFD,0x20,0x8A,0xAC,0xA9,0x8E,0x05,0xA2,0xA9,0xE0,0xF4,0x1B,0xFD,0xF5,0xD1,0x01,0x6A,0x34,0x13,0x0E,0x69,0xDE,0xD2,0x82,0x73,0x7F,0xDB,0x00,0x11,0x01,0x00,0x01,0xB4,0x26,0x50,0x61,0x74,0x72,0x79,0x6B,0x20,0x44,0x77,0xC3,0xB3,0x72,0x7A,0x6E,0x69,0x6B,0x20,0x3C,0x70,0x61,0x74,0x72,0x79,0x6B,0x40,0x64,0x77,0x6F,0x72,0x7A,0x6E,0x69,0x6B,0x2E,0x63,0x6F,0x6D,0x3E,0x89,0x01,0x3D,0x04,0x13,0x01,0x0A,0x00,0x27,0x05,0x02,0x53,0x8E,0x9E,0xBC,0x02,0x1B,0x03,0x05,0x09,0x07,0x86,0x1F,0x80,0x05,0x0B,0x09,0x08,0x07,0x03,0x05,0x15,0x0A,0x09,0x08,0x0B,0x05,0x16,0x02,0x03,0x01,0x00,0x02,0x1E,0x01,0x02,0x17,0x80,0x00,0x0A,0x09,0x10,0x91,0xE0,0xE6,0xEF,0xF7,0x96,0x54,0x96,0x1E,0x99,0x07,0xFF,0x57,0x78,0x9C,0xF4,0x2C,0x1B,0xA6,0x71,0x0B,0x6E,0x0A,0xF5,0xC0,0xED,0xFA,0x7A,0xDF,0x13,0xE7,0xAD,0x7E,0x1E,0x2A,0x76,0x38,0x2D,0xFF,0x53,0x4B,0x92,0x4C,0x8E,0x7F,0x88,0x9B,0x8B,0x6E,0xE7,0x42,0xDC,0x73,0x1B,0x65,0xBF,0x0C,0x59,0xE1,0x7D,0xEC,0x0D,0xA3,0x5C,0x35,0x3E,0x90,0xCA,0x46,0xE7,0x71,0x5A,0xC6,0x1D,0x29,0xD8,0x8F,0x8E,0xCE,0x5A,0x77,0x3D,0xF5,0x5E,0xEF,0x58,0x98,0x31,0xFE,0x34,0x46,0x49,0xB1,0xBC,0x12,0x83,0xF7,0x6A,0x1A,0x6C,0x2B,0x15,0x3A,0x9C,0xB3,0x14,0x4D,0xD2,0x6B,0xD2,0xC1,0x7F,0xBB,0x4C,0x67,0x0C,0x36,0x9F,0x52,0x87,0x3B,0x5D,0x6D,0x1F,0xBC,0xCA,0xA4,0x9F,0xD6,0x6A,0x66,0xF4,0x14,0xD4,0xF0,0x20,0x20,0x36,0x72,0x8A,0x2A,0x98,0x5F,0xD2,0x08,0x19,0xA6,0x07,0x6D,0x05,0x3B,0x0A,0xCE,0xAD,0xED,0xB2,0xFF,0x82,0x37,0x88,0x55,0xC2,0xA9,0x5A};
    NSInputStream *stream = [NSInputStream inputStreamWithBytes:publicKey length:sizeof(publicKey)];
    [stream open];
    
    NSError *error = nil;
    PGPPacketHeader *header = [PGPPacketHeader readFromStream:stream error:&error];
    XCTAssertNotNil(header);
    XCTAssertNil(error);
    XCTAssertEqual(header.packetTag, PGPPublicKeyPacketTag);
    
    PGPPublicKeyPacket *packet = [PGPPublicKeyPacket readFromStream:stream error:&error];
    XCTAssertNotNil(packet);
    XCTAssertNil(error);
    XCTAssertEqualObjects(packet.createDate, [NSDate dateWithTimeIntervalSince1970:1401855676]);
    XCTAssertEqual(packet.MPIs.count, 2);
    [stream close];
}


@end
