Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD46886AEF
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Aug 2019 21:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390363AbfHHTyY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 8 Aug 2019 15:54:24 -0400
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:60372 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404426AbfHHTxQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 8 Aug 2019 15:53:16 -0400
X-AuditID: c0a8fbf4-501ff700000014c1-ad-5d4c7daa8a70
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 1D.9C.05313.AAD7C4D5; Thu,  8 Aug 2019 21:53:14 +0200 (CEST)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Thu, 8 Aug 2019 21:53:13 +0200
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "yuehaibing@huawei.com" <yuehaibing@huawei.com>,
        "arnd@arndb.de" <arnd@arndb.de>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>
Subject: Re: [PATCH] rtc: bd70528: fix link error
Thread-Topic: [PATCH] rtc: bd70528: fix link error
Thread-Index: AQHVNYqcYstSvLPbPUmgdDecItnyFKbAlGyAgAAuWQCAAN4rAIAu9JOAgAEjsgA=
Date:   Thu, 8 Aug 2019 19:53:13 +0000
Message-ID: <f22cf88f836159b9f5428c6297d8e54b4639e1db.camel@fi.rohmeurope.com>
References: <20190708124227.3422311-1-arnd@arndb.de>
         <e752a638c0bde6893adf805322f73de5bd459dbc.camel@fi.rohmeurope.com>
         <CAK8P3a1HNnstePcreH-ZLyiJi3tNcCNJ=VozZUMnp-VLvYLSaA@mail.gmail.com>
         <e1687224a155787d9f3c042dca1c03a81b89ed25.camel@fi.rohmeurope.com>
         <81f5978e-f401-0975-6c96-003b6d94e49d@huawei.com>
In-Reply-To: <81f5978e-f401-0975-6c96-003b6d94e49d@huawei.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [84.253.217.36]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F580010CED6DED4590B009BF0DDF66A4@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLJsWRmVeSWpSXmKPExsVyYMXvTbqran1iDRYclrZYcvEqu0X7u2Xs
        Fn8nHWO3uP/1KKPF5V1z2CyOrb7CZvH2znQWiztfn7M4cHj8/jWJ0WPemmqPliNvWT02r9Dy
        uHNtD5vH9Hk/mTw+b5ILYI/itklKLCkLzkzP07dL4M7oWfSaueCcbsW/zv2MDYw7dLoYOTkk
        BEwkOp8dYu1i5OIQErjGKHF//it2COc4o8Snx1OZuhg5ONgEbCS6brKDNIgIhEm8OjaRCcRm
        FrjEJLHzbzSILSxgKLGm+y5YuYiAkcS1rkqIcj+J38fng7WyCKhI7FnfwgZi8wLF+1v2skCs
        2sskcXLedrAEp4CdRP+b12DzGQVkJTob3kHtEpfY9Ow7K8TRAhJL9pxnhrBFJV4+/scKsldC
        QFHi7S0rEJNZQFNi/S59iE4Hifd7l7BD2IoSU7ofskOcIChxcuYTlgmMYrOQLJiF0D0LSfcs
        JN2zkHQvYGRdxSiRm5iZk55YkmqoV5RaqleUn5ELpJLzczcxQiL4yw7G/4c8DzEKcDAq8fD+
        S/KJFWJNLCuuzD3EKMnBpCTKuyIQKMSXlJ9SmZFYnBFfVJqTWnyIUYKDWUmE916ZZ6wQb0pi
        ZVVqUT5MSpqDRUmcV433V4yQAMjm7NTUgtQimKwMB4eSBO+TaqChgkWp6akVaZk5JQhpJg5O
        kOFcUiLFqXkpqUWJpSUZ8aC0El8MTCwgKR6gvaE1QO28xQWJuUBRiNZTjNocE17OXcTMcWTu
        0kXMQix5+XmpUuK8hiClAiClGaV5cIteMYoD/SvM+x3kDh5gmoeb8wpoBRPQiqJ3IK8VlyQi
        pKQaGHfFTJ3W2zHD4Eyr/Flls96LyzS7jly7djbc5LHD6rV2nDGRz62ULJZ9dNSMnjF90m+v
        jZlHNV+vrTlyrHxK0C9Fxb/Vpy7nP/v9Z+u1qNvVhYu82wO25tgff34p8LhVyszYnz2zVjeu
        jrz86Piumsrw+476T5Nd3776eknqy9FjDz/rLLXWccpQYinOSDTUYi4qTgQAdJTPsrADAAA=
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGVsbG8gQWxsLA0KDQpPbiBUaHUsIDIwMTktMDgtMDggYXQgMTA6MjkgKzA4MDAsIFl1ZWhhaWJp
bmcgd3JvdGU6DQo+IE9uIDIwMTkvNy85IDEzOjI1LCBWYWl0dGluZW4sIE1hdHRpIHdyb3RlOg0K
PiA+IEhlbGxvIEFybmQsDQo+ID4gDQo+ID4gKEFkZGVkIFJhbmR5IHdobyBhbHNvIHNlbnQgYSBw
YXRjaCB0byBmaXggdGhpcykNCj4gPiANCj4gPiBPbiBNb24sIDIwMTktMDctMDggYXQgMTg6MTAg
KzAyMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+ID4gPiBPbiBNb24sIEp1bCA4LCAyMDE5IGF0
IDM6MjQgUE0gVmFpdHRpbmVuLCBNYXR0aQ0KPiA+ID4gPE1hdHRpLlZhaXR0aW5lbkBmaS5yb2ht
ZXVyb3BlLmNvbT4gd3JvdGU6DQo+ID4gPiANCj4gPiA+ID4gT24gTW9uLCAyMDE5LTA3LTA4IGF0
IDE0OjQxICswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOg0KPiA+ID4gPiA+IFdpdGggQ09ORklH
X0JENzA1MjhfV0FUQ0hET0c9bSwgYSBidWlsdC1pbiBydGMgZHJpdmVyIGNhbm5vdA0KPiA+ID4g
PiA+IGNhbGwNCj4gPiA+ID4gPiBpbnRvIHRoZSBsb3ctbGV2ZWwgZnVuY3Rpb25zIHRoYXQgYXJl
IHBhcnQgb2YgdGhlIHdhdGNoZG9nDQo+ID4gPiA+ID4gbW9kdWxlOg0KPiA+ID4gPiA+IA0KPiA+
ID4gPiA+IGRyaXZlcnMvcnRjL3J0Yy1iZDcwNTI4Lm86IEluIGZ1bmN0aW9uIGBiZDcwNTI4X3Nl
dF90aW1lJzoNCj4gPiA+ID4gPiBydGMtYmQ3MDUyOC5jOigudGV4dCsweDIyYyk6IHVuZGVmaW5l
ZCByZWZlcmVuY2UgdG8NCj4gPiA+ID4gPiBgYmQ3MDUyOF93ZHRfbG9jaycNCj4gPiA+ID4gPiBy
dGMtYmQ3MDUyOC5jOigudGV4dCsweDJhOCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8NCj4gPiA+
ID4gPiBgYmQ3MDUyOF93ZHRfdW5sb2NrJw0KPiA+ID4gPiA+IGRyaXZlcnMvcnRjL3J0Yy1iZDcw
NTI4Lm86IEluIGZ1bmN0aW9uDQo+ID4gPiA+ID4gYGJkNzA1Mjhfc2V0X3J0Y19iYXNlZF90aW1l
cnMnOg0KPiA+ID4gPiA+IHJ0Yy1iZDcwNTI4LmM6KC50ZXh0KzB4NTBjKTogdW5kZWZpbmVkIHJl
ZmVyZW5jZSB0bw0KPiA+ID4gPiA+IGBiZDcwNTI4X3dkdF9zZXQnDQo+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gQWRkIGEgS2NvbmZpZyBkZXBlbmRlbmN5IG9uIHRoaXMgZHJpdmVyLCBidXQgc3RpbGwg
YWxsb3cNCj4gPiA+ID4gPiBjb21waWxlLQ0KPiA+ID4gPiA+IHRlc3RpbmcNCj4gPiA+ID4gPiB3
aXRob3V0IGl0Lg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEZpeGVzOiAzMmE0YTRlYmY3NjggKCJy
dGM6IGJkNzA1Mjg6IEluaXRpYWwgc3VwcG9ydCBmb3IgUk9ITQ0KPiA+ID4gPiA+IGJkNzA1MjgN
Cj4gPiA+ID4gPiBSVEMiKQ0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4g
PGFybmRAYXJuZGIuZGU+DQo+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gIGRyaXZlcnMvcnRjL0tj
b25maWcgfCAyICsrDQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykN
Cj4gPiA+ID4gPiANCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvS2NvbmZpZyBi
L2RyaXZlcnMvcnRjL0tjb25maWcNCj4gPiA+ID4gPiBpbmRleCAzYmZjMDRhODY1MjkuLjdiMDcx
Y2M3NDQyMiAxMDA2NDQNCj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3J0Yy9LY29uZmlnDQo+ID4g
PiA+ID4gKysrIGIvZHJpdmVycy9ydGMvS2NvbmZpZw0KPiA+ID4gPiA+IEBAIC00OTgsOCArNDk4
LDEwIEBAIGNvbmZpZyBSVENfRFJWX000MVQ4MF9XRFQNCj4gPiA+ID4gPiAgICAgICBoZWxwDQo+
ID4gPiA+ID4gICAgICAgICBJZiB5b3Ugc2F5IFkgaGVyZSB5b3Ugd2lsbCBnZXQgc3VwcG9ydCBm
b3IgdGhlDQo+ID4gPiA+ID4gICAgICAgICB3YXRjaGRvZyB0aW1lciBpbiB0aGUgU1QgTTQxVDYw
IGFuZCBNNDFUODAgUlRDIGNoaXBzDQo+ID4gPiA+ID4gc2VyaWVzLg0KPiA+ID4gPiA+ICsNCj4g
PiA+ID4gPiAgY29uZmlnIFJUQ19EUlZfQkQ3MDUyOA0KPiA+ID4gPiA+ICAgICAgIHRyaXN0YXRl
ICJST0hNIEJENzA1MjggUE1JQyBSVEMiDQo+ID4gPiA+ID4gKyAgICAgZGVwZW5kcyBvbiBCRDcw
NTI4X1dBVENIRE9HIHx8IChDT01QSUxFX1RFU1QgJiYNCj4gPiA+ID4gPiAhQkQ3MDUyOF9XQVRD
SERPRykNCj4gPiA+ID4gDQo+ID4gPiA+IEkgYW0gbm90IGZhbiBvZiB0aGlzLiBUaGVyZSBtYXkg
d2VsbCBiZSB1c2UtY2FzZXMgd2hlcmUgaXQgaXMNCj4gPiA+ID4gZGVzaXJhYmxlDQo+ID4gPiA+
IHRvIGxlYXZlIHRoZSB3YXRjaGRvZyBvdXQgYnV0IHN0aWxsIGNvbXBpbGUgaW4gdGhlIFJUQy4g
VGhpcyBpcw0KPiA+ID4gPiB3aHkNCj4gPiA+ID4gd2UNCj4gPiA+ID4gaGF2ZSBzdGF0aWMgaW5s
aW5lIHN0dWJzIGluIHRoZSBoZWFkZXIgZm9yIGNhc2VzIHdoZXJlIFdERyBpcw0KPiA+ID4gPiBu
b3QNCj4gPiA+ID4gY29tcGlsZWQgaW4uIChSVEMgZG9lcyBub3QgbmVlZCB0byBzdG9wIFdERyBp
ZiBXREcgZHJpdmVyIGlzDQo+ID4gPiA+IG5vdA0KPiA+ID4gPiBpbmNsdWRlZCkNCj4gPiA+ID4g
DQo+ID4gPiA+IEFkZGluZyBkZXBlbmRlbmN5IGZyb20gUlRDIHRvIE1GRCBmb3IgQkQ3MDUyOCBz
aG91bGQgYmUgZG9uZSAtDQo+ID4gPiA+IHRoaXMNCj4gPiA+ID4gd2lsbCBhdm9pZCBtb3N0IG9m
IHRoZSBpc3N1ZXMgKEFuZCB0aGVyZSBoYXMgYmVlbiBmZXcgcGF0Y2hlcw0KPiA+ID4gPiBzZW50
DQo+ID4gPiA+IGZvcg0KPiA+ID4gPiB0aGlzIGFscmVhZHkpLiBCdXQgdGhhdCdzIHN0aWxsIG5v
dCBjb21wbGV0ZSBzb2x1dGlvbiBiZWNhdXNlDQo+ID4gPiA+IGNvbmZpZ3VyaW5nIFJUQyBhbmQg
TUZEIHRvIGJlIGJ1aWx0IGluLWtlcm5lbCBhbmQgV0RHIGFzIGENCj4gPiA+ID4gbW9kdWxlDQo+
ID4gPiA+IHdpbGwNCj4gPiA+ID4gY2F1c2UgZXJyb3JzIGFnYWluLg0KPiA+ID4gPiANCj4gPiA+
ID4gSXMgdGhlcmUgYSB3YXkgdG8gZm9yY2UgV0RHIGluLWtlcm5lbCBpZiBSVEMgaXMgaW4ta2Vy
bmVsPyAoT3INCj4gPiA+ID4gZGlzYWxsb3cgY29uZmlndXJpbmcgUlRDIGluLWtlcm5lbCBpZiBX
REcgaXMgYSBtb2R1bGUgLSB3aGlsZQ0KPiA+ID4gPiBzdGlsbA0KPiA+ID4gPiBhbGxvdyBSVEMg
dG8gYmUgYnVpbHQgd2l0aG91dCBXREc/DQo+ID4gPiANCj4gPiA+IFdlIGNvdWxkIG1ha2UgdGhp
cw0KPiA+ID4gDQo+ID4gPiAgICAgICAgIGRlcGVuZHMgb24gQkQ3MDUyOF9XQVRDSERPRyB8fCAh
QkQ3MDUyOF9XQVRDSERPRw0KPiA+ID4gDQo+ID4gPiB3aGljaCB3b3VsZCBhbGxvdyBidWlsZGlu
ZyB3aXRoIG9yIHdpdGhvdXQgd2F0Y2hkb2csIGV2ZW4gd2hlbg0KPiA+ID4gbm90DQo+ID4gPiBj
b21waWxlLXRlc3RpbmcsIGJ1dCBzdGlsbCBkaXNhbGxvdyB0aGUgY29tYmluYXRpb24gb2YNCj4g
PiA+IC4NCj4gPiANCj4gPiBUaGFua3MgZm9yIHRlYWNoaW5nIG1lIEFybmQhIFRoYXQgaXMgY2xl
dmVyIDopIFdlIG5lZWQgc29tZXRoaW5nDQo+ID4gbGlrZQ0KPiA+IA0KPiA+IGRlcGVuZHMgb24g
TUZEX1JPSE1fQkQ3MDUyOCAmJiAoQkQ3MDUyOF9XQVRDSERPRyB8fA0KPiA+ICFCRDcwNTI4X1dB
VENIRE9HKQ0KPiA+IA0KPiA+IChJJ20gbm90IHN1cmUgaWYgcGFyZW50aGVzaXMgYXJlIE9rIGFu
ZCByZXNwZWN0ZWQgaW4gS2NvbmZpZykuIEkNCj4gPiB3b3VsZA0KPiA+IG5ldmVyIGhhdmUgdGhv
dWdodCBvZiBCRDcwNTI4X1dBVENIRE9HIHx8ICFCRDcwNTI4X1dBVENIRE9HIC0gaXQNCj4gPiBs
b29rcw0KPiA+IGF3a3dhcmQgYXQgZmlyc3Qgc2lnaHQgYnV0IGluZGVlZCAtIGRlcGVuZHMgb24g
QkQ3MDUyOF9XQVRDSERPRw0KPiA+IGRpc2FsbG93cyBCRDcwNTI4X1dBVENIRE9HPW0gd2l0aCBS
VENfRFJWX0JENzA1Mjg9eSB3aGlsZQ0KPiA+ICFCRDcwNTI4X1dBVENIRE9HIGFsbG93cyBCRDcw
NTI4X1dBVENIRE9HPW4uIEJyaWxsaWFudCBhbmQgZXhhY3RseQ0KPiA+IHdoYXQNCj4gPiB3ZSBu
ZWVkIDopIFRoYW5rcyBhIGJ1bmNoIQ0KPiANCj4gSGVsbG8gVmFpdHRpbmVuLA0KPiANCj4gdGhl
IGlzc3VlIHN0aWxsIGV4aXN0cyBpbiBsaW51eC1uZXh0IDIwMTkwODA3LCBhbnkgcGxhbj8NCj4g
DQoNCj4gU29ycnkgZm9sa3MuIEkgdGhvdWdodCBBcm5kIHdvdWxkIHNlbmQgbmV3IHBhdGNoIC0g
SSBkaWRuJ3Qgd2FudCB0bw0KPiBzdGVhbCBoaXMgd29yayA7KSBJIHdpbGwgYmUgYmFjayB0byBt
eSBub3JtYWwgbGlmZSBuZXh0IHdlZWsgc28gSQ0KPiB3aWxsIHNlbmQgYSBwYXRjaCBhdCBtb25k
YXkgaWYgdGhlIGlzc3VlIGlzIHN0aWxsIG9wZW4hDQoNCkJyLA0KCU1hdHRpDQo=
