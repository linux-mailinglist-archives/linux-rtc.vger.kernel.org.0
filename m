Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79AE7555AB
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Jun 2019 19:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbfFYRQ6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 25 Jun 2019 13:16:58 -0400
Received: from us-smtp-delivery-168.mimecast.com ([63.128.21.168]:45640 "EHLO
        us-smtp-delivery-168.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726713AbfFYRQ5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 25 Jun 2019 13:16:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=impinj.com;
        s=mimecast20190405; t=1561483016;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6wby4VwGd4v/juwDj/Pjs39tiYp5vbhVxRLNw2VMNPU=;
        b=BJm2ynkyqPeKysG4CGImgXM5W3kI1SwtavnujVegCHbFK0io+4CPue/Xhk1EB7uwHiOknS
        Yrlp2AroPAfE3egLAoRLwDNQwVg5jpl+iT6+sHf7+0Qclf8glSoZ/uhrF55gsFYDSR3qlc
        4zAuyigYlycotNFaYxGzn3yCtcCLK6E=
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2052.outbound.protection.outlook.com [104.47.38.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-MiBPNs0ZNaaDQZS3HHksXw-1; Tue, 25 Jun 2019 13:16:54 -0400
Received: from MWHPR0601MB3708.namprd06.prod.outlook.com (10.167.236.38) by
 MWHPR0601MB3691.namprd06.prod.outlook.com (10.167.236.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.17; Tue, 25 Jun 2019 17:16:52 +0000
Received: from MWHPR0601MB3708.namprd06.prod.outlook.com
 ([fe80::2d66:fca6:b053:764f]) by MWHPR0601MB3708.namprd06.prod.outlook.com
 ([fe80::2d66:fca6:b053:764f%6]) with mapi id 15.20.2008.014; Tue, 25 Jun 2019
 17:16:52 +0000
From:   Trent Piepho <tpiepho@impinj.com>
To:     "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "fthain@telegraphics.com.au" <fthain@telegraphics.com.au>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "userm57@yahoo.com" <userm57@yahoo.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rtc: Don't state that the RTC holds UTC in case it
 doesn't
Thread-Topic: [PATCH] rtc: Don't state that the RTC holds UTC in case it
 doesn't
Thread-Index: AQHVJ9Vy3OcHKvmN50CYhgsoBzBu56arPlOAgABjq4CAAH9NAIAAgpiA
Date:   Tue, 25 Jun 2019 17:16:52 +0000
Message-ID: <1561483011.2343.6.camel@impinj.com>
References: <3e1e24a326b8b623b1a8b66a905ac6494ef74a07.1561081886.git.fthain@telegraphics.com.au>
         <20190624195705.GD5690@piout.net>
         <alpine.LNX.2.21.1906251043050.8@nippy.intranet>
         <20190625092926.GE5690@piout.net>
In-Reply-To: <20190625092926.GE5690@piout.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [216.207.205.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07b33a57-490a-45ac-532b-08d6f990ea83
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR0601MB3691;
x-ms-traffictypediagnostic: MWHPR0601MB3691:
x-microsoft-antispam-prvs: <MWHPR0601MB3691AB1A742F7DA70E22E631D3E30@MWHPR0601MB3691.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(39850400004)(136003)(346002)(396003)(199004)(189003)(446003)(11346002)(476003)(54906003)(2616005)(6246003)(2501003)(486006)(6116002)(3846002)(68736007)(71190400001)(71200400001)(66066001)(25786009)(14444005)(478600001)(256004)(4326008)(14454004)(103116003)(2906002)(86362001)(5660300002)(6436002)(36756003)(8676002)(186003)(26005)(73956011)(66446008)(64756008)(66476007)(66556008)(76176011)(66946007)(91956017)(76116006)(99286004)(6506007)(6512007)(102836004)(53936002)(316002)(229853002)(305945005)(110136005)(81156014)(81166006)(8936002)(7736002)(6486002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR0601MB3691;H:MWHPR0601MB3708.namprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: h1KPuWvUK/8loC3Sow2nned/kNlY6FwagCtTvRXDy6Ky1AXj37cs+LApYmb1Nn7wjM2QaBkwbbxeQDqD2n8l9fG/XOHYPDxafwxN9IpWSxqoStKrNlaDjGGeWhEAE74w7ydqNcvL1EV1DJDJhT0QzEuIbI9AIOotBSwI8HDYUHstDHUIns+65wnElnAFGF0IE05JkJr6vcCpe9uoolLo7XX/rEVqnlEunNbqP7bX0SddZUGUarsSLZvcYnyh4LwSbEPgz3r/hxZ+3mdZS+0zRIavirIDJLWD6rzidsKlfIWnWJWb/MkRrn8Xkn1+wqiTCDRFhuJ5M+xvuVwhOJ+hroeDSrYLNd8iGYtmTQoT3/GDDdCOqXu1/3+3LGDCSPm2XbJfadqwJc/YfJdW05e0TNtN2wjEXmDvr5gnfyJbpzk=
Content-ID: <DDFEED856B81AF418949BC0D5A9D3AD7@namprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: impinj.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b33a57-490a-45ac-532b-08d6f990ea83
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 17:16:52.3646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6de70f0f-7357-4529-a415-d8cbb7e93e5e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tpiepho@impinj.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0601MB3691
X-MC-Unique: MiBPNs0ZNaaDQZS3HHksXw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gVHVlLCAyMDE5LTA2LTI1IGF0IDExOjI5ICswMjAwLCBBbGV4YW5kcmUgQmVsbG9uaSB3cm90
ZToNCj4gDQo+IA0KPiBVc2Vyc3BhY2UgaXMgY2VydGFpbmx5IGFkanVzdGluZyB0aGUgdGltZXpv
bmUgYWZ0ZXIgdGhlIGtlcm5lbCBkaWQuIENhbg0KPiB5b3UgcnVuIHRoZSBzYW1lIGNvbW1hbmRz
IHdpdGhvdXQgcnVubmluZyB5b3VyIGluaXQ/IA0KPiANCj4gT24gc3RhYmxlLCB5b3UgaGF2ZSAv
ZXRjL2luaXQuZC9od2Nsb2NrLnNoIHRoYXQgc3RpbGwgcnVucyBhbmQgZG9lcyB0aGUNCj4gY29y
cmVjdCB0aGluZy4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHN5c3RlbWQgYWxzbyBoYW5kbGVz
IHRoZSBUWg0KPiBwcm9wZXJseSBhZnRlciBoY3Rvc3lzIChzZWUgY2xvY2tfaXNfbG9jYWx0aW1l
KCkpLg0KPiANCj4gU2VyaW91c2x5LCBoY3Rvc3lzIGRvZXMgYSByZWFsbHkgYmFkIGpvYiBhdCBz
ZXR0aW5nIHRoZSBzeXN0ZW0gdGltZSwgaXQNCj4gaXMgZ3VhcmFudGVlZCB0byBiZSBhbHdheXMg
d3Jvbmcgb24gbW9zdCBwbGF0Zm9ybXMuIE15IHBsYW4gaXMgc3RpbGwgdG8NCj4gdHJ5IHRvIGdl
dCBkaXN0cm9zIHRvIHN0b3AgZW5hYmxpbmcgaXQgYW5kIGRvIHRoYXQgcHJvcGVybHkgaW4NCj4g
dXNlcnNwYWNlLiBUaGlzIGlzIGFscmVhZHkgb2sgd2hlbiB1c2luZyBzeXNWIGJ1dCBzeXN0ZW1k
IHdvdWxkIG5lZWQgYQ0KPiBmZXcgY2hhbmdlcyB0byBzdG9wIHJlbHlpbmcgb24gaXQgd2hlbiB0
aGVuIGlzIG5vIGh3Y2xvY2sgaW5pdHNjcmlwdC4NCj4gVW5mb3J0dW5hdGVseSwgSSBkaWRuJ3Qg
aGF2ZSB0aW1lIHRvIHdvcmsgb24gdGhhdCB5ZXQuDQoNCmhjdG9zeXMgaXMgdmVyeSBoYW5keSBp
biB0aGF0IGl0IHNldHMgdGhlIHN5c3RlbSB0aW1lIGJlZm9yZSBhbnkgbG9nDQptZXNzYWdlcyBh
cmUgZ2VuZXJhdGVkLiAgRWl0aGVyIGluIGEgbWFpbiBib290IG9yIGluIGFuIGluaXRyYW1mcy4g
DQpIYXZpbmcgcHJvcGVydHkgdGltZS1zdGFtcGVkIGxvZyBtZXNzYWdlcyBpcyB2ZXJ5IGltcG9y
dGFudCBmb3INCm1hbmFnaW5nIGEgbGFyZ2UgZGVwbG95bWVudC4NCg0KSWYgdGhlIHN5c3RlbSB0
aW1lIGlzIHNldCBieSBzb21lIHNjcmlwdCBvciBzeXN0ZW1kIHVuaXQsIHRoZW4gdGhlcmUNCndp
bGwgYWx3YXlzIGJlIGFsbCB0aGUgdGhpbmdzIHRoYXQgbmVlZCB0byBydW4gYmVmb3JlIHRoYXQg
c2NyaXB0IG9yDQp1bml0IGNhbiB3b3JrLiAgRS5nLiwgdWRldiBjcmVhdGluZyBydGMgZGV2aWNl
IG5vZGVzLCBtb3VudGluZyAvc3lzIGFuZA0KL3Byb2MsIHN5c3RlbWQgZ2VuZXJhdG9yIGZvciBs
b2NhbCBmaWxlIHN5c3RlbSB1bmlzLCB0aGUgb3RoZXIgcGFydHMgb2YNCnN5c3RlbWQgdG8gZG8g
dGhhdCwgZXRjLiBBbGwgdGhpcyB3b24ndCBiZSBhYmxlIHRvIGxvZyB3aXRoIGNvcnJlY3QNCnN5
c3RlbSB0aW1lLg0KDQoNCg==

