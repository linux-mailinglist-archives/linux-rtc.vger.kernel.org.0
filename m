Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F724558CC
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Jun 2019 22:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfFYU2h (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 25 Jun 2019 16:28:37 -0400
Received: from us-smtp-delivery-168.mimecast.com ([63.128.21.168]:49138 "EHLO
        us-smtp-delivery-168.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726393AbfFYU2g (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 25 Jun 2019 16:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=impinj.com;
        s=mimecast20190405; t=1561494514;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5xtuLcxFclVBDACKCITHt4+pryJfnkK3LXxmKY2n4Kc=;
        b=OGCkGaQk3LUkTtCwyGea3BNhtDjSdB5twwjMkZ6CxmJ7pEDeLx6PbJYpHIrKeIAyeBkxOZ
        xQHmWoy6NdxpmHxfom0/UiPym5AxI7ARw83Y8w7fOPVqMo+x92HvNJ00hd6V5FX90X8oTw
        6Wu+LWjNW0cEKWepqBOhgJ8IeuGzpfs=
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam03lp2051.outbound.protection.outlook.com [104.47.42.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-jmAhI484NJmdVCZf1QB--A-1; Tue, 25 Jun 2019 16:27:28 -0400
Received: from MWHPR0601MB3708.namprd06.prod.outlook.com (10.167.236.38) by
 MWHPR0601MB3673.namprd06.prod.outlook.com (10.167.236.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Tue, 25 Jun 2019 20:27:12 +0000
Received: from MWHPR0601MB3708.namprd06.prod.outlook.com
 ([fe80::2d66:fca6:b053:764f]) by MWHPR0601MB3708.namprd06.prod.outlook.com
 ([fe80::2d66:fca6:b053:764f%6]) with mapi id 15.20.2008.014; Tue, 25 Jun 2019
 20:27:12 +0000
From:   Trent Piepho <tpiepho@impinj.com>
To:     "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "userm57@yahoo.com" <userm57@yahoo.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "fthain@telegraphics.com.au" <fthain@telegraphics.com.au>
Subject: Re: [PATCH] rtc: Don't state that the RTC holds UTC in case it
 doesn't
Thread-Topic: [PATCH] rtc: Don't state that the RTC holds UTC in case it
 doesn't
Thread-Index: AQHVJ9Vy3OcHKvmN50CYhgsoBzBu56arPlOAgABjq4CAAH9NAIAAgpiAgAAiVoCAABLYgA==
Date:   Tue, 25 Jun 2019 20:27:12 +0000
Message-ID: <1561494431.2343.25.camel@impinj.com>
References: <3e1e24a326b8b623b1a8b66a905ac6494ef74a07.1561081886.git.fthain@telegraphics.com.au>
         <20190624195705.GD5690@piout.net>
         <alpine.LNX.2.21.1906251043050.8@nippy.intranet>
         <20190625092926.GE5690@piout.net> <1561483011.2343.6.camel@impinj.com>
         <20190625191945.GH5690@piout.net>
In-Reply-To: <20190625191945.GH5690@piout.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [216.207.205.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ed8e449-3489-45a0-233e-08d6f9ab813f
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR0601MB3673;
x-ms-traffictypediagnostic: MWHPR0601MB3673:
x-microsoft-antispam-prvs: <MWHPR0601MB3673F2BB7A2E6B4085DF5CD9D3E30@MWHPR0601MB3673.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(189003)(199004)(3846002)(6436002)(229853002)(6116002)(71190400001)(81156014)(81166006)(2906002)(71200400001)(4326008)(186003)(8936002)(8676002)(102836004)(486006)(5660300002)(36756003)(6512007)(14444005)(6916009)(6246003)(99286004)(5640700003)(103116003)(2616005)(7736002)(256004)(86362001)(53936002)(66946007)(76116006)(66476007)(91956017)(14454004)(305945005)(476003)(25786009)(446003)(66556008)(73956011)(64756008)(66446008)(6506007)(11346002)(54906003)(66066001)(498600001)(26005)(2351001)(68736007)(6486002)(76176011)(2501003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR0601MB3673;H:MWHPR0601MB3708.namprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mHQsaBRHEaWqLV0D+Otgyx+XnDkejhx3YTxE6Z1TD7YEf55TOmCsWsVSls7KACinxDzp9Qu0G6xRL0YYrLJOEwvEGJFhyBcqyxCwe1+tkFQNdmAYfr2mwq8aHf0rDvufvK04w07Sutw1LYT0mkyv2KwnE2H9g4D5jrBr6QP6H79GDQIAdDImxYZes5W/vEBxzXMjptH6QuaJv+QcPlW1ioki+15+8c0xCX3GyMoB4TJiIkrA7NfSGqjsiBcNdmOEsLRfWGtXgj/3ZMAy9KM1jJ5796MivE4AfB2OsJ4StD3J3yJW7LwcqWn+hhu/k33yMA3ub9Vdb6pPJw9KlnipgcK4PYooPM8ImbOZDE4h88DsoZe18RqviuqT5Pa7sIRrRkRyhZsIq5/eur0hHhoZ9YhjBWS/7K9oIZzZHoiYJ58=
Content-ID: <8BA9E5C61205744D85B7D2637AB90B9A@namprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: impinj.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed8e449-3489-45a0-233e-08d6f9ab813f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 20:27:12.1247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6de70f0f-7357-4529-a415-d8cbb7e93e5e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tpiepho@impinj.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0601MB3673
X-MC-Unique: jmAhI484NJmdVCZf1QB--A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gVHVlLCAyMDE5LTA2LTI1IGF0IDIxOjE5ICswMjAwLCBBbGV4YW5kcmUgQmVsbG9uaSB3cm90
ZToNCj4gT24gMjUvMDYvMjAxOSAxNzoxNjo1MiswMDAwLCBUcmVudCBQaWVwaG8gd3JvdGU6DQo+
ID4gT24gVHVlLCAyMDE5LTA2LTI1IGF0IDExOjI5ICswMjAwLCBBbGV4YW5kcmUgQmVsbG9uaSB3
cm90ZToNCj4gPiA+IFVzZXJzcGFjZSBpcyBjZXJ0YWlubHkgYWRqdXN0aW5nIHRoZSB0aW1lem9u
ZSBhZnRlciB0aGUga2VybmVsIGRpZC4gQ2FuDQo+ID4gPiB5b3UgcnVuIHRoZSBzYW1lIGNvbW1h
bmRzIHdpdGhvdXQgcnVubmluZyB5b3VyIGluaXQ/IA0KPiA+ID4gDQo+ID4gPiBPbiBzdGFibGUs
IHlvdSBoYXZlIC9ldGMvaW5pdC5kL2h3Y2xvY2suc2ggdGhhdCBzdGlsbCBydW5zIGFuZCBkb2Vz
IHRoZQ0KPiA+ID4gY29ycmVjdCB0aGluZy4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHN5c3Rl
bWQgYWxzbyBoYW5kbGVzIHRoZSBUWg0KPiA+ID4gcHJvcGVybHkgYWZ0ZXIgaGN0b3N5cyAoc2Vl
IGNsb2NrX2lzX2xvY2FsdGltZSgpKS4NCj4gPiA+IA0KPiA+ID4gU2VyaW91c2x5LCBoY3Rvc3lz
IGRvZXMgYSByZWFsbHkgYmFkIGpvYiBhdCBzZXR0aW5nIHRoZSBzeXN0ZW0gdGltZSwgaXQNCj4g
PiA+IGlzIGd1YXJhbnRlZWQgdG8gYmUgYWx3YXlzIHdyb25nIG9uIG1vc3QgcGxhdGZvcm1zLiBN
eSBwbGFuIGlzIHN0aWxsIHRvDQo+ID4gPiB0cnkgdG8gZ2V0IGRpc3Ryb3MgdG8gc3RvcCBlbmFi
bGluZyBpdCBhbmQgZG8gdGhhdCBwcm9wZXJseSBpbg0KPiA+ID4gdXNlcnNwYWNlLiBUaGlzIGlz
IGFscmVhZHkgb2sgd2hlbiB1c2luZyBzeXNWIGJ1dCBzeXN0ZW1kIHdvdWxkIG5lZWQgYQ0KPiA+
ID4gZmV3IGNoYW5nZXMgdG8gc3RvcCByZWx5aW5nIG9uIGl0IHdoZW4gdGhlbiBpcyBubyBod2Ns
b2NrIGluaXRzY3JpcHQuDQo+ID4gPiBVbmZvcnR1bmF0ZWx5LCBJIGRpZG4ndCBoYXZlIHRpbWUg
dG8gd29yayBvbiB0aGF0IHlldC4NCj4gPiANCj4gPiBoY3Rvc3lzIGlzIHZlcnkgaGFuZHkgaW4g
dGhhdCBpdCBzZXRzIHRoZSBzeXN0ZW0gdGltZSBiZWZvcmUgYW55IGxvZw0KPiA+IG1lc3NhZ2Vz
IGFyZSBnZW5lcmF0ZWQuIEVpdGhlciBpbiBhIG1haW4gYm9vdCBvciBpbiBhbiBpbml0cmFtZnMu
IA0KPiA+IEhhdmluZyBwcm9wZXJ0eSB0aW1lLXN0YW1wZWQgbG9nIG1lc3NhZ2VzIGlzIHZlcnkg
aW1wb3J0YW50IGZvcg0KPiA+IG1hbmFnaW5nIGEgbGFyZ2UgZGVwbG95bWVudC4NCj4gPiANCj4g
PiBJZiB0aGUgc3lzdGVtIHRpbWUgaXMgc2V0IGJ5IHNvbWUgc2NyaXB0IG9yIHN5c3RlbWQgdW5p
dCwgdGhlbiB0aGVyZQ0KPiA+IHdpbGwgYWx3YXlzIGJlIGFsbCB0aGUgdGhpbmdzIHRoYXQgbmVl
ZCB0byBydW4gYmVmb3JlIHRoYXQgc2NyaXB0IG9yDQo+ID4gdW5pdCBjYW4gd29yay4gRS5nLiwg
dWRldiBjcmVhdGluZyBydGMgZGV2aWNlIG5vZGVzLCBtb3VudGluZyAvc3lzIGFuZA0KPiA+IC9w
cm9jLCBzeXN0ZW1kIGdlbmVyYXRvciBmb3IgbG9jYWwgZmlsZSBzeXN0ZW0gdW5pcywgdGhlIG90
aGVyIHBhcnRzIG9mDQo+ID4gc3lzdGVtZCB0byBkbyB0aGF0LCBldGMuIEFsbCB0aGlzIHdvbid0
IGJlIGFibGUgdG8gbG9nIHdpdGggY29ycmVjdA0KPiA+IHN5c3RlbSB0aW1lLg0KPiA+IA0KPiAN
Cj4gSSdkIGFyZ3VlIHRoYXQgdGhpcyBzeXN0ZW0gdGltZSBpcyBub3QgY29ycmVjdCBhbnl3YXkg
YW5kIGhlbmNlIGlzIG5vdA0KPiB0aGF0IHVzZWZ1bC4gRXNwZWNpYWxseSBzaW5jZSB0aGUgYm9v
dCB0aW1lIHRvIGFueXRoaW5nIHJlYWRpbmcgdGhlIFJUQw0KPiB3aWxsIHN0aWxsIGJlIHNtYWxs
ZXIgdGhhbiB0aGUgbWF4aW11bSBlcnJvciBoY3Rvc3lzIGNhbiBoYXZlICh0aGF0IGlzDQo+IHVw
IHRvIHR3byBzZWNvbmRzKS4gVGhpcyBpcyBldmVuIHdvcnNlIGlmIHRoZSBSVEMgc290cmVzIGxv
Y2FsIHRpbWUuDQoNCldoeSB3b3VsZCB0aGUgc3lzdGVtIHRpbWUgYmUgaW5jb3JyZWN0IGJ5IG1v
cmUgdGhhbiArLSA1MDAgbXMgcGx1cw0Kd2hhdGV2ZXIgdGhlIGRyaWZ0IHRoZSBSVEMgc2luY2Ug
dGhlIGxhc3QgdGltZSBpdCB3YXMgY29ycmVjdGx5IHNldD8gDQpJcyB0aGVyZSBhbm90aGVyIHNv
dXJjZSBvZiBlcnJvcj8NCg0KVGhlICstNTAwIG1zIGVycm9yIGNvdWxkIGJlIHJlZHVjZWQgYnkg
dXNpbmcgYW4gdXBkYXRlIGludGVycnVwdCBpbg0KaGN0b3N5cy4NCg0KSWYgb25lIHdlcmUgdG8g
bm90IHNldCB0aGUgUlRDIHRvIFVUQywgdGhlbiB5ZXMgdGhlcmUgaXMgYSBwcm9ibGVtLiANCkJ1
dCBpdCdzIG1hbmFnZWFibGUuICBEb24ndCBkbyB0aGF0LiAgSSd2ZSBnb3QgbGFyZ2UgbnVtYmVy
cyBvZg0KZW1iZWRkZWQgZGV2aWNlcyBJJ3ZlIGRlc2lnbmVkLiAgV2h5IHdvdWxkIEkgZGVzaWdu
IHRoZW0gdG8gdXNlIGxvY2FsDQp0aW1lIGluIHRoZSBSVEM/ICANCg0KSWYgb25lIGRvZXMgc2V0
IHRoZSBSVEMgdG8gbG9jYWwgdGltZSwgdGhlbiBpdCdzIGJhZCwgYnV0IG5vdA0KaW1wb3NzaWJs
ZSB0byBkZWFsIHdpdGguICBUaGUgbG9nIG1lc3NhZ2VzIHRoYXQgaGF2ZSB0aW1lc3RhbXBzIGJl
dHdlZW4NCmJvb3QgYW5kIHdoZW4gdGhlIHRpbWV6b25lIGlzIHNldCB3aWxsIGJlIGluIHRoZSB3
cm9uZyB6b25lLiAgVGhlDQpuZWNlc3NhcnkgaW5mb3JtYXRpb24gdG8gY29ycmVjdCB0aGlzIGVy
cm9yIGV4aXN0cy4gIEl0J3MgZmFyIGJldHRlcg0KdGhhbiBhbGwgdGltZXN0YW1wcyBhcyBKYW4g
MXN0IDE5NzAuDQoNCj4gSW5zdGVhZCBvZiB1c2luZyBhIHN5c3RlbWQgdW5pdCwgd2UgY291bGQg
bWFrZSBzeXN0ZW1kIHJlYWQgdGhlIFJUQyBhcw0KPiBzb29uIGFzIHBvc3NpYmxlIGFuZCBzZXQg
dGhlIHN5c3RlbSB0aW1lIGNvcnJlY3RseSAoYXQgbGVhc3QsIHRoYXQgaXMgbXkNCg0KQnV0IHdo
YXQgaXMgYXMgc29vbiBhcyBwb3NzaWJsZT8gIERvZXNuJ3QgaXQgbmVlZCAvZGV2L3J0YyBvciBt
YXliZQ0KL3N5cy9jbGFzcy9ydGMgdG8gZXhpc3Q/ICBUaGF0IGRvZXNuJ3QgaGFwcGVuIGZvciBh
IHdoaWxlIGFmdGVyIGJvb3QuDQoNCj4gcGxhbikuIFRoaXMgd291bGQgYmUgZXNwZWNpYWxseSB1
c2VmdWwgd2hlbiB1c2luZyBOVFAgYmVjYXVzZSBhcyBhbHJlYWR5DQo+IHJlcG9ydGVkLCBpdCBt
YXkgdGFrZSBhIGZldyBob3VycyB0byBhY3R1YWxseSBzeW5jaHJvbml6ZSBiZWNhdXNlDQo+IGhj
dG9zeXMgZGlkbid0IHNldCB0aGUgY29ycmVjdCB0aW1lLg0KDQpJcyB0aGF0IHJlYWxseSBhIHBy
b2JsZW0gaW4gaGN0b3N5cz8gIFVzdWFsbHkgb25lIGFsd2F5cyBkb2VzIHNvbWUgc29ydA0Kb2Yg
bWFrZXN0ZXAgb3B0aW9uIGluIG50cCB0byBzZXQgcmF0aGVyIHRoYW4gc2tldyB0aGUgY2xvY2sg
b24gc3RhcnQsDQpwZXJoYXBzIG9ubHkgaWYgdGhlIGVycm9yIGlzIHRvbyBncmVhdCwgdG8gYXZv
aWQgc3luY2hyb25pemluZyB0YWtpbmcNCmFuIGV4Y2VlZGluZyBsb25nIHRpbWUuDQoNCkkgc2Vl
IHRoaXMgYXMgdHdvIGJsYXRhbnQgc3lzdGVtIG1pc2NvbmZpZ3VyYXRpb25zLiAgT25lLCB0ZWxs
aW5nIHRoZQ0Ka2VybmVsIHRvIHNldCB0aGUgdGltZSBiYXNlZCBvbiBhIFJUQyBzZXQgdG8gVVRD
IGFuZCB0aGVuIG5vdCBzZXR0aW5nDQp0aGUgUlRDIHRvIFVUQy4gIEFuZCB0d28sIHNldHRpbmcg
bnRwIHRvIG5vdCBzdGVwIHRoZSBjbG9jayBhbmQgZ2l2aW5nDQppdCBhIGh1Z2UgaW5pdGlhbCBl
cnJvciB0byBkZWFsIHdpdGguDQoNCj4gDQo+IEkgd291bGQgYWdyZWUgdGhhdCB0aGVyZSBhcmUg
cmVtYWluaW5nIHVzZSBjYXNlcyBmb3IgaGN0b3N5cywgZS5nLiB3aGVuDQo+IHdhbnRpbmcgdG8g
Ym9vdCBhIHJvb3RmcyBvdmVyIGEgbmV0d29yayBmaWxlc3lzdGVtIGFuZCB3aXRob3V0IGFuDQo+
IGluaXRyYW1mcy4NCj4g

