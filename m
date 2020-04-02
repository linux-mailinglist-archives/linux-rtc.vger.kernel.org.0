Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 155D219CA97
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Apr 2020 21:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731874AbgDBTvZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 2 Apr 2020 15:51:25 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:36011 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731689AbgDBTvZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 2 Apr 2020 15:51:25 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 249BA891AF;
        Fri,  3 Apr 2020 08:51:21 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1585857081;
        bh=GYF+qTQ5apownH2wCYLqdmYSX61dKA9g3mLOv6smh58=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=jNB2shBEsmBQgyzKYr8xan4WxmBikEPN1S7U02teZ21PcPJOhJDavBdIkEG5b+YN+
         zVS0OZPnrzTK0SNp3NNLViU7RlHyjlmyrnpjMSXvqKwDb2gjkFwkY9DW4t737d72+Q
         qKyUxpxoETzHPUXxDSV0q9Iq/SQspvNqA+9vo+kmPcNDJ/UEqALtzDdyeR8/5VedSL
         cLCtx3ITHNt/wYvLRVr8jJOSH/i3hf3dwSstRA5lNUD0tygnSJQcdYDgMi5Obc2zJV
         up9G1Ygr7LGSxXOejnbZTM+gnJ6yjvVOwBvwf+fkbDbXSHuxzIBZxFHxRRWuqgaEVY
         g+c5Rs/lr2LxA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5e8642380001>; Fri, 03 Apr 2020 08:51:20 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 3 Apr 2020 08:51:20 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Fri, 3 Apr 2020 08:51:20 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "colin.king@canonical.com" <colin.king@canonical.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH][V2][next] rtc: ds1307: check for failed memory allocation
 on wdt
Thread-Topic: [PATCH][V2][next] rtc: ds1307: check for failed memory
 allocation on wdt
Thread-Index: AQHWCPY59kiziJYDL0uIkIAkuSeLCqhlZE2A
Date:   Thu, 2 Apr 2020 19:51:20 +0000
Message-ID: <671ce0fe788c6f9ad5bb830905df21df13ba3017.camel@alliedtelesis.co.nz>
References: <20200402135201.548313-1-colin.king@canonical.com>
In-Reply-To: <20200402135201.548313-1-colin.king@canonical.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.14.96]
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FD27E1088831F469645522F6A70C1A4@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gVGh1LCAyMDIwLTA0LTAyIGF0IDE0OjUyICswMTAwLCBDb2xpbiBLaW5nIHdyb3RlOg0KPiBG
cm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPg0KPiANCj4gQ3Vy
cmVudGx5IGEgZmFpbGVkIG1lbW9yeSBhbGxvY2F0aW9uIHdpbGwgbGVhZCB0byBhIG51bGwgcG9p
bnRlcg0KPiBkZXJlZmVyZW5jZSBvbiBwb2ludCB3ZHQuICBGaXggdGhpcyBieSBjaGVja2luZyBm
b3IgYSBmYWlsZWQNCj4gYWxsb2NhdGlvbg0KPiBhbmQgYWRkaW5nIGVycm9yIHJldHVybiBoYW5k
bGluZyB0byBmdW5jdGlvbiBkczEzMDdfd2R0X3JlZ2lzdGVyLg0KPiBBbHNvIG1vdmUgdGhlIGVy
cm9yIGV4aXQgbGFiZWwgImV4aXQiIHRvIGFsbG93IGEgcmV0dXJuIHN0YXRlbWVudCB0bw0KPiBi
ZSByZW1vdmVkLg0KPiANCj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIkRlcmVmZXJlbmNlIG51bGwg
cmV0dXJuIikNCj4gRml4ZXM6IGZkOTBkNDhkYjAzNyAoInJ0YzogZHMxMzA3OiBhZGQgc3VwcG9y
dCBmb3Igd2F0Y2hkb2cgdGltZXIgb24NCj4gZHMxMzg4IikNCj4gU2lnbmVkLW9mZi1ieTogQ29s
aW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4NCj4gLS0tDQo+IFYyOiBtb3Zl
IGVycm9yIGV4aXQgbGFiZWwgYW5kIHJlbW92ZSBhIHJldHVybiBzdGF0ZW1lbnQsIHRoYW5rcyB0
byANCj4gICAgIFdhbHRlciBIYXJtcyBmb3Igc3BvdHRpbmcgdGhpcyBjbGVhbiB1cC4NCj4gLS0t
DQo+ICBkcml2ZXJzL3J0Yy9ydGMtZHMxMzA3LmMgfCAxNiArKysrKysrKystLS0tLS0tDQo+ICAx
IGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1kczEzMDcuYyBiL2RyaXZlcnMvcnRjL3J0Yy1kczEz
MDcuYw0KPiBpbmRleCBmYWQwNDIxMTg4NjIuLmMwNThiMDJlZmI0ZCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ydGMvcnRjLWRzMTMwNy5jDQo+ICsrKyBiL2RyaXZlcnMvcnRjL3J0Yy1kczEzMDcu
Yw0KPiBAQCAtMTY2NSwxNCArMTY2NSwxNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHdhdGNoZG9n
X29wcw0KPiBkczEzODhfd2R0X29wcyA9IHsNCj4gIA0KPiAgfTsNCj4gIA0KPiAtc3RhdGljIHZv
aWQgZHMxMzA3X3dkdF9yZWdpc3RlcihzdHJ1Y3QgZHMxMzA3ICpkczEzMDcpDQo+ICtzdGF0aWMg
aW50IGRzMTMwN193ZHRfcmVnaXN0ZXIoc3RydWN0IGRzMTMwNyAqZHMxMzA3KQ0KPiAgew0KPiAg
CXN0cnVjdCB3YXRjaGRvZ19kZXZpY2UJKndkdDsNCj4gIA0KPiAgCWlmIChkczEzMDctPnR5cGUg
IT0gZHNfMTM4OCkNCj4gLQkJcmV0dXJuOw0KPiArCQlyZXR1cm4gMDsNCj4gIA0KPiAgCXdkdCA9
IGRldm1fa3phbGxvYyhkczEzMDctPmRldiwgc2l6ZW9mKCp3ZHQpLCBHRlBfS0VSTkVMKTsNCj4g
KwlpZiAoIXdkdCkNCj4gKwkJcmV0dXJuIC1FTk9NRU07DQoNCk15IG9yaWdpbmFsIGludGVudGlv
biB3YXMgdGhhdCB0aGUgd2R0IHN1cHBvcnQgd2FzIG9wdGlvbmFsLiBJJ2QNCnN1Z2dlc3QganVz
dA0KDQorCWlmICghd2R0KQ0KKwkJcmV0dXJuOw0KDQpXaGljaCBzaG91bGQga2VlcCBDb3Zlcml0
eSBoYXBweS4NCg0KPiAgCXdkdC0+aW5mbyA9ICZkczEzODhfd2R0X2luZm87DQo+ICAJd2R0LT5v
cHMgPSAmZHMxMzg4X3dkdF9vcHM7DQo+IEBAIC0xNjgzLDEwICsxNjg1LDEzIEBAIHN0YXRpYyB2
b2lkIGRzMTMwN193ZHRfcmVnaXN0ZXIoc3RydWN0IGRzMTMwNw0KPiAqZHMxMzA3KQ0KPiAgCXdh
dGNoZG9nX2luaXRfdGltZW91dCh3ZHQsIDAsIGRzMTMwNy0+ZGV2KTsNCj4gIAl3YXRjaGRvZ19z
ZXRfZHJ2ZGF0YSh3ZHQsIGRzMTMwNyk7DQo+ICAJZGV2bV93YXRjaGRvZ19yZWdpc3Rlcl9kZXZp
Y2UoZHMxMzA3LT5kZXYsIHdkdCk7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gIH0NCj4gICNlbHNl
DQo+IC1zdGF0aWMgdm9pZCBkczEzMDdfd2R0X3JlZ2lzdGVyKHN0cnVjdCBkczEzMDcgKmRzMTMw
NykNCj4gK3N0YXRpYyBpbnQgZHMxMzA3X3dkdF9yZWdpc3RlcihzdHJ1Y3QgZHMxMzA3ICpkczEz
MDcpDQo+ICB7DQo+ICsJcmV0dXJuIDA7DQo+ICB9DQo+ICAjZW5kaWYgLyogQ09ORklHX1dBVENI
RE9HX0NPUkUgKi8NCj4gIA0KPiBAQCAtMTk3OSwxMCArMTk4NCw3IEBAIHN0YXRpYyBpbnQgZHMx
MzA3X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50DQo+ICpjbGllbnQsDQo+ICANCj4gIAlkczEzMDdf
aHdtb25fcmVnaXN0ZXIoZHMxMzA3KTsNCj4gIAlkczEzMDdfY2xrc19yZWdpc3RlcihkczEzMDcp
Ow0KPiAtCWRzMTMwN193ZHRfcmVnaXN0ZXIoZHMxMzA3KTsNCj4gLQ0KPiAtCXJldHVybiAwOw0K
PiAtDQo+ICsJZXJyID0gZHMxMzA3X3dkdF9yZWdpc3RlcihkczEzMDcpOw0KPiAgZXhpdDoNCj4g
IAlyZXR1cm4gZXJyOw0KPiAgfQ0K
