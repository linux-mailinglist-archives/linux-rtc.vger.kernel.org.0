Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C71B23C19C
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Aug 2020 23:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgHDVif (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 Aug 2020 17:38:35 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:35063 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728161AbgHDVif (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 4 Aug 2020 17:38:35 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 67501891B0;
        Wed,  5 Aug 2020 09:38:29 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1596577109;
        bh=y2cZ7l9v/x5XqOZUS+LH1DScC914DI74uGMJrW51dKw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=MS2zpE5WBjFme9aPxbhpBQC79mPXylCE3yZoo39YP5vOOqxTIJXLTc5hnWr6rzuaf
         BT+sOd3zvjDvy3pdNTLLhduWaWrxti5k3NG3gNYRST2dooAFn/wZWZmg8udbBquJ1a
         gq0AgF+SHgyoCQxhueSvC64X3gcE8B6tpZaoAGT3W4ACXAkUVL3QJSQpsMV8Ljh4pQ
         2O0o6LziFalkm/Uan11TUTzg2ik7/gbtORmLnfS3slE27FsacseD9IBEJD+89c8AzQ
         4uprvOY4Bx+yTqaFQHW56fS7rJpk8jvrQTM8rRdJDlFlJzcaDP4LMHu0pmiszBqe/E
         8hFuJ/5hXx6Kg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f29d5540001>; Wed, 05 Aug 2020 09:38:28 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 5 Aug 2020 09:38:29 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Wed, 5 Aug 2020 09:38:28 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Guenter Roeck <linux@roeck-us.net>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: Re: [PATCH] RTC: Implement pretimeout watchdog for DS1307
Thread-Topic: Re: [PATCH] RTC: Implement pretimeout watchdog for DS1307
Thread-Index: AQHWaqeXDTzLsxQJg0K4XzW5bEEcaQ==
Date:   Tue, 4 Aug 2020 21:38:28 +0000
Message-ID: <b035b829-b94a-2761-77d6-1c3616eff2b5@alliedtelesis.co.nz>
References: <20200804051743.19115-1-mark.tomlinson@alliedtelesis.co.nz>
 <20200804152044.GB10725@piout.net>
 <3bb0b209-8213-ce6e-b7ee-3393ca0bbdae@roeck-us.net>
In-Reply-To: <3bb0b209-8213-ce6e-b7ee-3393ca0bbdae@roeck-us.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBE2D6DCE1C93748917BB1D03B6C2CEA@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

DQpPbiA1LzA4LzIwIDQ6MTQgYW0sIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQo+IE9uIDgvNC8yMCA4
OjIwIEFNLCBBbGV4YW5kcmUgQmVsbG9uaSB3cm90ZToNCj4+IEhpLA0KPj4NCj4+IFRoZSBzdWJq
ZWN0IHByZWZpeCBpcyBub3QgY29ycmVjdCwgaXQgc2hvdWxkIGJlIHJ0YzogZHMxMzA3Og0KPj4N
Cj4+IEFsc28sIHNob3VsZG4ndCB0aGF0IGtpbmQgb2Ygc29mdHdhcmUgdGltZW91dCB3aGljaCBk
b2Vzbid0IGFjdHVhbGx5DQo+PiBkZXBlbmQgb24gdGhlIGhhcmR3YXJlIGJldHRlciBiZSBoYW5k
bGVkIGluIHRoZSB3YXRjaGRvZyBjb3JlPyBUaGVuIHRoaXMNCj4+IHdpbGwgYmVuZWZpdCBhbGwg
dGhlIHdhdGNoZG9nIGFuZCB3aWxsIGNlcnRhaW5seSBhdm9pZCBhIGxvdCBvZiBjb2RlDQo+PiBk
dXBsaWNhdGlvbi4NCj4+DQo+IEdvb2QgcG9pbnQuIEkgYWJzb2x1dGVseSBhZ3JlZS4gV2UnZCBo
YXZlIHRvIGhhc2ggb3V0IHNvbWUgZGV0YWlscywNCj4gc3VjaCBhcyBob3cgYW5kIHdoZW4gdG8g
ZW5hYmxlIGl0LCBidXQgdGhpcyBkZWZpbml0ZWx5IGJlbG9uZ3MgaW50bw0KPiB0aGUgd2F0Y2hk
b2cgY29yZSBpZiBpdCBpcyBjb25zaWRlcmVkIHVzZWZ1bC4NCj4NCj4gT24gdGhlIG90aGVyIHNp
ZGUsIHRoZSBzb2Z0ZG9nIGFscmVhZHkgaW1wbGVtZW50cyB0aGlzLiBXaHkgbm90IGp1c3QNCj4g
aW5zdGFudGlhdGUgdGhlIHNvZnRkb2cgYXMgc2Vjb25kIHdhdGNoZG9nIGFuZCB1c2UgaXQgZm9y
IHRoZSBwdXJwb3NlDQo+IG9mIGhhbmRsaW5nIHByZXRpbWVvdXRzID8NCj4NCj4gVGhhbmtzLA0K
PiBHdWVudGVyDQoNCk9uZSBhZHZhbnRhZ2Ugb2YgdGhpcyBraW5kIG9mIGFwcHJvYWNoIChpbXBs
ZW1lbnRlZCBtb3JlIGdlbmVyaWNhbGx5KSBpcyANCnRoYXQgdGhlIHRpbWVycyBhcmUgbGlua2Vk
LiBUaGV5IGdldCBzZXJ2aWNlZCB0b2dldGhlciBhbmQgYW55IHVwZGF0ZXMgDQp0byB0aGUgdGlt
ZW91dCBoYXBwZW4gYXQgdGhlIHNhbWUgdGltZS4NCg0KT25lIHBvc3NpYmxlIGltcGxlbWVudGF0
aW9uIHBhdGggd291bGQgYmUgdG8gaGF2ZSBpdCBraWNrIGluIGluIHRoZSANCndhdGNoZG9nIGNv
cmUgaWYgdGhlIGZsYWdzIHN1cHBsaWVkIGJ5IHRoZSBkcml2ZXIgZG9uJ3QgYWxyZWFkeSBjb250
YWluIA0KV0RJT0ZfUFJFVElNRU9VVCAocHJvYmFibHkgdHVja2VkIGJlaGluZCBhIGNvbmZpZyBm
bGFnIGF0IGxlYXN0IGluaXRpYWxseSkuDQoNClRhbGtpbmcgd2l0aCBNYXJrIEkgdGhpbmsgd2Ug
cHJvYmFibHkgd2lsbCBnbyB3aXRoIHRoZSBzb2Z0ZG9nIGFwcHJvYWNoIA0KYW5kIGRlYWwgd2l0
aCBrZWVwaW5nIHRoZW0gaW4gc3luYyBpbiBvdXIgbW9uaXRvcmluZyBhcHBsaWNhdGlvbi4NCg0K
Pg0KPj4gT24gMDQvMDgvMjAyMCAxNzoxNzo0MysxMjAwLCBNYXJrIFRvbWxpbnNvbiB3cm90ZToN
Cj4+PiBJZiB0aGUgaGFyZHdhcmUgd2F0Y2hkb2cgaW4gdGhlIGNsb2NrIGNoaXAgc2ltcGx5IHB1
bGxzIHRoZSByZXNldCBsaW5lDQo+Pj4gb2YgdGhlIENQVSwgdGhlbiB0aGVyZSBpcyBubyBjaGFu
Y2UgdG8gd3JpdGUgYSBzdGFjayB0cmFjZSB0byBoZWxwDQo+Pj4gZGV0ZXJtaW5lIHdoYXQgbWF5
IGhhdmUgYmVlbiBibG9ja2luZyB0aGUgQ1BVLg0KPj4+DQo+Pj4gVGhpcyBwYXRjaCBhZGRzIGEg
cHJldGltZW91dCB0byB0aGUgd2F0Y2hkb2csIHdoaWNoLCBpZiBlbmFibGVkLCBzZXRzDQo+Pj4g
YSB0aW1lciB0byBnbyBvZmYgYmVmb3JlIHRoZSBoYXJkd2FyZSB3YXRjaGRvZyBraWNrcyBpbiwg
YW5kIGNhbGxzDQo+Pj4gdGhlIHN0YW5kYXJkIHByZXRpbWVvdXQgZnVuY3Rpb24sIHdoaWNoIGNh
biAoZm9yIGV4YW1wbGUpIGNhbGwgcGFuaWMuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBNYXJr
IFRvbWxpbnNvbiA8bWFyay50b21saW5zb25AYWxsaWVkdGVsZXNpcy5jby5uej4NCj4+PiAtLS0N
Cj4+PiAgIGRyaXZlcnMvcnRjL3J0Yy1kczEzMDcuYyB8IDM1ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystDQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1kczEz
MDcuYyBiL2RyaXZlcnMvcnRjL3J0Yy1kczEzMDcuYw0KPj4+IGluZGV4IDQ5NzAyOTQyYmIwOC4u
NjQ3Zjg2NTlkMGJkIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvcnRjL3J0Yy1kczEzMDcuYw0K
Pj4+ICsrKyBiL2RyaXZlcnMvcnRjL3J0Yy1kczEzMDcuYw0KPj4+IEBAIC0yMyw2ICsyMyw3IEBA
DQo+Pj4gICAjaW5jbHVkZSA8bGludXgvY2xrLXByb3ZpZGVyLmg+DQo+Pj4gICAjaW5jbHVkZSA8
bGludXgvcmVnbWFwLmg+DQo+Pj4gICAjaW5jbHVkZSA8bGludXgvd2F0Y2hkb2cuaD4NCj4+PiAr
I2luY2x1ZGUgPGxpbnV4L3RpbWVyLmg+DQo+Pj4gICANCj4+PiAgIC8qDQo+Pj4gICAgKiBXZSBj
YW4ndCBkZXRlcm1pbmUgdHlwZSBieSBwcm9iaW5nLCBidXQgaWYgd2UgZXhwZWN0IHByZS1MaW51
eCBjb2RlDQo+Pj4gQEAgLTE3NCw2ICsxNzUsMTAgQEAgc3RydWN0IGRzMTMwNyB7DQo+Pj4gICAj
aWZkZWYgQ09ORklHX0NPTU1PTl9DTEsNCj4+PiAgIAlzdHJ1Y3QgY2xrX2h3CQljbGtzWzJdOw0K
Pj4+ICAgI2VuZGlmDQo+Pj4gKyNpZmRlZiBDT05GSUdfV0FUQ0hET0dfQ09SRQ0KPj4+ICsJc3Ry
dWN0IHRpbWVyX2xpc3QJc29mdF90aW1lcjsNCj4+PiArCXN0cnVjdCB3YXRjaGRvZ19kZXZpY2UJ
KndkdDsNCj4+PiArI2VuZGlmDQo+Pj4gICB9Ow0KPj4+ICAgDQo+Pj4gICBzdHJ1Y3QgY2hpcF9k
ZXNjIHsNCj4+PiBAQCAtODYzLDEyICs4NjgsMzQgQEAgc3RhdGljIGludCBtNDF0eHhfcnRjX3Nl
dF9vZmZzZXQoc3RydWN0IGRldmljZSAqZGV2LCBsb25nIG9mZnNldCkNCj4+PiAgIH0NCj4+PiAg
IA0KPj4+ICAgI2lmZGVmIENPTkZJR19XQVRDSERPR19DT1JFDQo+Pj4gK3N0YXRpYyB2b2lkIGRz
MTM4OF9zb2Z0X3dkdF9leHBpcmUoc3RydWN0IHRpbWVyX2xpc3QgKnNvZnRfdGltZXIpDQo+Pj4g
K3sNCj4+PiArCXN0cnVjdCBkczEzMDcgKmRzMTMwNyA9IGNvbnRhaW5lcl9vZihzb2Z0X3RpbWVy
LCBzdHJ1Y3QgZHMxMzA3LCBzb2Z0X3RpbWVyKTsNCj4+PiArDQo+Pj4gKwl3YXRjaGRvZ19ub3Rp
ZnlfcHJldGltZW91dChkczEzMDctPndkdCk7DQo+Pj4gK30NCj4+PiArDQo+Pj4gK3N0YXRpYyB2
b2lkIGRzMTM4OF9zb2Z0X3RpbWVyX3NldChzdHJ1Y3Qgd2F0Y2hkb2dfZGV2aWNlICp3ZHRfZGV2
KQ0KPj4+ICt7DQo+Pj4gKwlzdHJ1Y3QgZHMxMzA3ICpkczEzMDcgPSB3YXRjaGRvZ19nZXRfZHJ2
ZGF0YSh3ZHRfZGV2KTsNCj4+PiArCWludCBzb2Z0X3RpbWVvdXQ7DQo+Pj4gKw0KPj4+ICsJaWYg
KHdkdF9kZXYtPnByZXRpbWVvdXQgPiAwKSB7DQo+Pj4gKwkJc29mdF90aW1lb3V0ID0gd2R0X2Rl
di0+dGltZW91dCAtIHdkdF9kZXYtPnByZXRpbWVvdXQ7DQo+Pj4gKwkJbW9kX3RpbWVyKCZkczEz
MDctPnNvZnRfdGltZXIsIGppZmZpZXMgKyBzb2Z0X3RpbWVvdXQgKiBIWik7DQo+Pj4gKwl9IGVs
c2Ugew0KPj4+ICsJCWRlbF90aW1lcigmZHMxMzA3LT5zb2Z0X3RpbWVyKTsNCj4+PiArCX0NCj4+
PiArfQ0KPj4+ICsNCj4+PiAgIHN0YXRpYyBpbnQgZHMxMzg4X3dkdF9zdGFydChzdHJ1Y3Qgd2F0
Y2hkb2dfZGV2aWNlICp3ZHRfZGV2KQ0KPj4+ICAgew0KPj4+ICAgCXN0cnVjdCBkczEzMDcgKmRz
MTMwNyA9IHdhdGNoZG9nX2dldF9kcnZkYXRhKHdkdF9kZXYpOw0KPj4+ICAgCXU4IHJlZ3NbMl07
DQo+Pj4gICAJaW50IHJldDsNCj4+PiAgIA0KPj4+ICsJZHMxMzg4X3NvZnRfdGltZXJfc2V0KHdk
dF9kZXYpOw0KPj4+ICsNCj4+PiAgIAlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMoZHMxMzA3LT5y
ZWdtYXAsIERTMTM4OF9SRUdfRkxBRywNCj4+PiAgIAkJCQkgRFMxMzg4X0JJVF9XRiwgMCk7DQo+
Pj4gICAJaWYgKHJldCkNCj4+PiBAQCAtOTAwLDYgKzkyNyw3IEBAIHN0YXRpYyBpbnQgZHMxMzg4
X3dkdF9zdG9wKHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndkdF9kZXYpDQo+Pj4gICB7DQo+Pj4g
ICAJc3RydWN0IGRzMTMwNyAqZHMxMzA3ID0gd2F0Y2hkb2dfZ2V0X2RydmRhdGEod2R0X2Rldik7
DQo+Pj4gICANCj4+PiArCWRlbF90aW1lcigmZHMxMzA3LT5zb2Z0X3RpbWVyKTsNCj4+PiAgIAly
ZXR1cm4gcmVnbWFwX3VwZGF0ZV9iaXRzKGRzMTMwNy0+cmVnbWFwLCBEUzEzODhfUkVHX0NPTlRS
T0wsDQo+Pj4gICAJCQkJICBEUzEzODhfQklUX1dERSB8IERTMTM4OF9CSVRfUlNULCAwKTsNCj4+
PiAgIH0NCj4+PiBAQCAtOTA5LDYgKzkzNyw3IEBAIHN0YXRpYyBpbnQgZHMxMzg4X3dkdF9waW5n
KHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndkdF9kZXYpDQo+Pj4gICAJc3RydWN0IGRzMTMwNyAq
ZHMxMzA3ID0gd2F0Y2hkb2dfZ2V0X2RydmRhdGEod2R0X2Rldik7DQo+Pj4gICAJdTggcmVnc1sy
XTsNCj4+PiAgIA0KPj4+ICsJZHMxMzg4X3NvZnRfdGltZXJfc2V0KHdkdF9kZXYpOw0KPj4+ICAg
CXJldHVybiByZWdtYXBfYnVsa19yZWFkKGRzMTMwNy0+cmVnbWFwLCBEUzEzODhfUkVHX1dET0df
SFVOX1NFQ1MsIHJlZ3MsDQo+Pj4gICAJCQkJc2l6ZW9mKHJlZ3MpKTsNCj4+PiAgIH0NCj4+PiBA
QCAtOTIzLDYgKzk1Miw3IEBAIHN0YXRpYyBpbnQgZHMxMzg4X3dkdF9zZXRfdGltZW91dChzdHJ1
Y3Qgd2F0Y2hkb2dfZGV2aWNlICp3ZHRfZGV2LA0KPj4+ICAgCXJlZ3NbMF0gPSAwOw0KPj4+ICAg
CXJlZ3NbMV0gPSBiaW4yYmNkKHdkdF9kZXYtPnRpbWVvdXQpOw0KPj4+ICAgDQo+Pj4gKwlkczEz
ODhfc29mdF90aW1lcl9zZXQod2R0X2Rldik7DQo+Pj4gICAJcmV0dXJuIHJlZ21hcF9idWxrX3dy
aXRlKGRzMTMwNy0+cmVnbWFwLCBEUzEzODhfUkVHX1dET0dfSFVOX1NFQ1MsIHJlZ3MsDQo+Pj4g
ICAJCQkJIHNpemVvZihyZWdzKSk7DQo+Pj4gICB9DQo+Pj4gQEAgLTE2NTIsNyArMTY4Miw4IEBA
IHN0YXRpYyB2b2lkIGRzMTMwN19jbGtzX3JlZ2lzdGVyKHN0cnVjdCBkczEzMDcgKmRzMTMwNykN
Cj4+PiAgIA0KPj4+ICAgI2lmZGVmIENPTkZJR19XQVRDSERPR19DT1JFDQo+Pj4gICBzdGF0aWMg
Y29uc3Qgc3RydWN0IHdhdGNoZG9nX2luZm8gZHMxMzg4X3dkdF9pbmZvID0gew0KPj4+IC0JLm9w
dGlvbnMgPSBXRElPRl9TRVRUSU1FT1VUIHwgV0RJT0ZfS0VFUEFMSVZFUElORyB8IFdESU9GX01B
R0lDQ0xPU0UsDQo+Pj4gKwkub3B0aW9ucyA9IFdESU9GX1NFVFRJTUVPVVQgfCBXRElPRl9LRUVQ
QUxJVkVQSU5HIHwNCj4+PiArCQkgICBXRElPRl9NQUdJQ0NMT1NFIHwgV0RJT0ZfUFJFVElNRU9V
VCwNCj4+PiAgIAkuaWRlbnRpdHkgPSAiRFMxMzg4IHdhdGNoZG9nIiwNCj4+PiAgIH07DQo+Pj4g
ICANCj4+PiBAQCAtMTY4MSw2ICsxNzEyLDggQEAgc3RhdGljIHZvaWQgZHMxMzA3X3dkdF9yZWdp
c3RlcihzdHJ1Y3QgZHMxMzA3ICpkczEzMDcpDQo+Pj4gICAJd2R0LT50aW1lb3V0ID0gOTk7DQo+
Pj4gICAJd2R0LT5tYXhfdGltZW91dCA9IDk5Ow0KPj4+ICAgCXdkdC0+bWluX3RpbWVvdXQgPSAx
Ow0KPj4+ICsJZHMxMzA3LT53ZHQgPSB3ZHQ7DQo+Pj4gKwl0aW1lcl9zZXR1cCgmZHMxMzA3LT5z
b2Z0X3RpbWVyLCBkczEzODhfc29mdF93ZHRfZXhwaXJlLCAwKTsNCj4+PiAgIA0KPj4+ICAgCXdh
dGNoZG9nX2luaXRfdGltZW91dCh3ZHQsIDAsIGRzMTMwNy0+ZGV2KTsNCj4+PiAgIAl3YXRjaGRv
Z19zZXRfZHJ2ZGF0YSh3ZHQsIGRzMTMwNyk7DQo+Pj4gLS0gDQo+Pj4gMi4yOC4wDQo+Pj4NCj4=
