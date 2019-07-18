Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5D36D21E
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2019 18:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730306AbfGRQiY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 18 Jul 2019 12:38:24 -0400
Received: from us-smtp-delivery-168.mimecast.com ([216.205.24.168]:31700 "EHLO
        us-smtp-delivery-168.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726040AbfGRQiY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 18 Jul 2019 12:38:24 -0400
X-Greylist: delayed 366 seconds by postgrey-1.27 at vger.kernel.org; Thu, 18 Jul 2019 12:38:23 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=impinj.com;
        s=mimecast20190405; t=1563467902;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C8hMNjhWAkjNX6Mug5Rv7Cs+KaLJDJd5jAPYe1MPAbk=;
        b=Rs3bQeIg2MM7rlFy8OeTC4HvdKPjhLqPNjBWsKydI/QVtATpOmk/refkKLBRhYcm+j+ekw
        U3hYAH1ge5t/qgwXO7kXQP3W7ijdIdaCkrmejTa/Jm7khEd8IMdicw2Y111R03kP/GceJd
        ZQSkrTHlJo/4Q46tei+QElSBELAI+k4=
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam04lp2050.outbound.protection.outlook.com [104.47.44.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-wAiM6YmDMNKjFiwhhL6LUA-1; Thu, 18 Jul 2019 12:32:15 -0400
Received: from MWHPR0601MB3708.namprd06.prod.outlook.com (10.167.236.38) by
 MWHPR0601MB3659.namprd06.prod.outlook.com (10.167.236.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 16:32:07 +0000
Received: from MWHPR0601MB3708.namprd06.prod.outlook.com
 ([fe80::2d66:fca6:b053:764f]) by MWHPR0601MB3708.namprd06.prod.outlook.com
 ([fe80::2d66:fca6:b053:764f%6]) with mapi id 15.20.2094.011; Thu, 18 Jul 2019
 16:32:06 +0000
From:   Trent Piepho <tpiepho@impinj.com>
To:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "anson.huang@nxp.com" <anson.huang@nxp.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "aisheng.dong@nxp.com" <aisheng.dong@nxp.com>
CC:     "linux-imx@nxp.com" <linux-imx@nxp.com>
Subject: Re: [PATCH] rtc: snvs: fix possible race condition
Thread-Topic: [PATCH] rtc: snvs: fix possible race condition
Thread-Index: AQHVO6gKZejg7PMOuUGfI0AjQ/aRL6bOpJgAgAAzT4CAANzngIAA4I4A
Date:   Thu, 18 Jul 2019 16:32:06 +0000
Message-ID: <1563467526.2343.80.camel@impinj.com>
References: <20190716071858.36750-1-Anson.Huang@nxp.com>
         <AM0PR04MB421167283C950557E231181480C90@AM0PR04MB4211.eurprd04.prod.outlook.com>
         <DB3PR0402MB39164D0022E25706D2B871C7F5C90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
         <AM0PR04MB421114F025F27AF2BC5FA21980C80@AM0PR04MB4211.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB421114F025F27AF2BC5FA21980C80@AM0PR04MB4211.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [216.207.205.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e8c6866-08fe-4ab5-f07e-08d70b9d7953
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR0601MB3659;
x-ms-traffictypediagnostic: MWHPR0601MB3659:
x-microsoft-antispam-prvs: <MWHPR0601MB3659322D1C707180A142DA17D3C80@MWHPR0601MB3659.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(346002)(366004)(396003)(136003)(39850400004)(199004)(189003)(256004)(2501003)(71200400001)(71190400001)(68736007)(305945005)(102836004)(14444005)(53936002)(76116006)(91956017)(6246003)(66476007)(6506007)(6512007)(6486002)(81166006)(7736002)(3846002)(66946007)(229853002)(476003)(66446008)(14454004)(6116002)(81156014)(64756008)(66556008)(103116003)(6436002)(8676002)(2616005)(110136005)(316002)(26005)(99286004)(2201001)(4326008)(2906002)(478600001)(86362001)(76176011)(486006)(36756003)(11346002)(446003)(5660300002)(186003)(25786009)(66066001)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR0601MB3659;H:MWHPR0601MB3708.namprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OGQTifMe8kfs8u/6iPSz4kMoT7vBhFj2+YE7E0/kER83lLA7sZdgojPnszpWsM+5V7rC5CWmD4aCBsLSlVV7TZFGVxTgaTVyIDAWnC8xmQDON1YQZ87HJ+ustl1910U1JEpaC0nar3Daa2ksQlRuOEaUZAhBV1V0XT2u2vHL6UsA34juiFMvFWcYR/icOz3gV8IAg4JtvnWqeOmwzXZtA1aNMTxc/LoDqJ0aNYVMv//qPfq8ptf1biDIDaauMNu6CbQkSZ1vcklB+s4FpGkYVI80f2XFpqxwKpDmQpjXyTh3Xtt+aOY0PNUiesCHbNF+DdT2jtHVQPtzF2tISC/8R/NxB/g4gtndvDkd9/EcX3SQitZyUeemQWczYtvNqUTZhzfMUwwz+SszASWnvJeFCshEuVzvVa+cKAyAn/nLAaA=
Content-ID: <1E98B1AF02F1294BBF2274435E95F023@namprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: impinj.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8c6866-08fe-4ab5-f07e-08d70b9d7953
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 16:32:06.8456
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6de70f0f-7357-4529-a415-d8cbb7e93e5e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tpiepho@impinj.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0601MB3659
X-MC-Unique: wAiM6YmDMNKjFiwhhL6LUA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gVGh1LCAyMDE5LTA3LTE4IGF0IDAzOjA4ICswMDAwLCBBaXNoZW5nIERvbmcgd3JvdGU6DQo+
ID4gRnJvbTogQW5zb24gSHVhbmcNCj4gPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMTcsIDIwMTkg
OTo1OCBQTT4gDQo+ID4gSGksIEFpc2hlbmcNCj4gPiANCj4gPiA+ID4gRnJvbTogQW5zb24uSHVh
bmdAbnhwLmNvbSA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPiA+ID4gU2VudDogVHVlc2RheSwg
SnVseSAxNiwgMjAxOSAzOjE5IFBNDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGUgUlRDIElSUSBpcyBy
ZXF1ZXN0ZWQgYmVmb3JlIHRoZSBzdHJ1Y3QgcnRjX2RldmljZSBpcw0KPiA+ID4gPiBhbGxvY2F0
ZWQsDQo+ID4gPiA+IHRoaXMgbWF5IGxlYWQgdG8gYSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2Ug
aW4gSVJRIGhhbmRsZXIuDQo+ID4gPiA+IA0KPiA+ID4gPiBUbyBmaXggdGhpcyBpc3N1ZSwgYWxs
b2NhdGluZyB0aGUgcnRjX2RldmljZSBzdHJ1Y3QgYmVmb3JlDQo+ID4gPiA+IHJlcXVlc3Rpbmcg
dGhlIFJUQyBJUlEgdXNpbmcgZGV2bV9ydGNfYWxsb2NhdGVfZGV2aWNlLCBhbmQgdXNlDQo+ID4g
PiA+IHJ0Y19yZWdpc3Rlcl9kZXZpY2UgdG8gcmVnaXN0ZXIgdGhlIFJUQyBkZXZpY2UuDQo+ID4g
PiA+IA0KPiA+ID4gDQo+ID4gPiBJIHNhdyBvdGhlciBydGMgZHJpdmVycyBkaWQgdGhlIHNhbWUg
d2F5IGFzIHVzLCBzbyB0aGlzIGxvb2tzDQo+ID4gPiBsaWtlIGENCj4gPiA+IGNvbW1vbiBwcm9i
bGVtLg0KPiA+ID4gTXkgcXVlc3Rpb24gaXMgaWYgd2UgY2FuIGNsZWFyIGludGVycnVwdCBzdGF0
dXMgYmVmb3JlIHJlZ2lzdGVyDQo+ID4gPiB0bw0KPiA+ID4gYXZvaWQgdGhpcyBpc3N1ZSBhcyBv
dGhlciBydGMgZHJpdmVycz8NCj4gPiANCj4gPiBJIHRoaW5rIHdlIGNhbiBOT1QgcHJlZGljdCB3
aGVuIHRoZSBJUlEgd2lsbCBiZSBwZW5kaW5nLCBJUlEgY291bGQNCj4gPiBhcnJpdmUgYXQNCj4g
PiBhbnkgdGltZSwgdGhlIG1vc3Qgc2FmZSB3YXkgaXMgdG8gcHJlcGFyZSBldmVyeXRoaW5nIGJl
Zm9yZQ0KPiA+IHJlcXVlc3RpbmcvZW5hYmxpbmcgSVJRLg0KPiA+IFRoZXJlIGlzIGFsc28gcGF0
Y2ggdG8gZml4IHNpbWlsYXIgaXNzdWU6DQoNCkkgdGhpbmsgb25lIGNvdWxkIGF0dGVtcHQgdG8g
ZGlzYWJsZSBhbGwgaXJxIHNvdXJjZXMgaW4gdGhlIGRldmljZSB2aWENCml0cyByZWdpc3RlciBz
cGFjZSwgdGhlbiBlbmFibGUgdGhlIGludGVycnVwdC4gIEJ1dCB0aGlzIHNlZW1zIG1vcmUNCnNw
ZWNpZmljIHRvIGVhY2ggZGV2aWNlIHRoYW4gY2hhbmdpbmcgdGhlIHBhdHRlcm4gb2YgZGV2aWNl
DQpyZWdpc3RyYXRpb24sIHNvIElNSE8sIGl0J3Mgbm90IHJlYWxseSBiZXR0ZXIuDQoNCkkgZG8g
d29ycnkgdGhhdCBoYW5kbGluZyB0aGUgaXJxIGJlZm9yZSB0aGUgcnRjIGRldmljZSBpcyByZWdp
c3RlcmVkDQpjb3VsZCBzdGlsbCByZXN1bHQgaW4gYSBjcmFzaC4gIEZyb20gd2hhdCBJIHNhdywg
dGhlIGlycSBwYXRoIGluIHNudnMNCm9ubHkgdXNlcyBkcml2ZXIgc3RhdGUgbWVtYmVycyB0aGF0
IGFyZSBmdWxseSBpbml0aWFsaXplZCBmb3IgdGhlIG1vc3QNCnBhcnQsIGFuZCB0aGUgYWxsb2Nh
dGVkIGJ1dCB1bnJlZ2lzdGVyZWQgZGF0YS0+cnRjIGlzIG9ubHkgdXNlZCBpbiBvbmUNCmNhbGwg
dG8gcnRjX3VwZGF0ZV9pcnEoKSwgd2hpY2ggYXBwZWFycyB0byBiZSBvayB3aXRoIHRoaXMuDQoN
CkJ1dCBpdCBpcyBub3QgdGhhdCBoYXJkIHRvIGltYWdpbmUgdGhhdCBzb21ldGhpbmcgY291bGQg
Z28gaW50byB0aGUgcnRjDQpjb3JlIHRoYXQgYXNzdW1lcyBjYWxsIGxpa2UgcnRjX3VwZGF0ZV9p
cnEoKSBhcmUgb25seSBtYWRlIG9uDQpyZWdpc3RlcmVkIGRldmljZXMuDQoNCklmIHRoZXJlIHdh
cyBhIHdheSB0byBkbyBpdCwgSSB0aGluayBhbGxvY2F0aW5nIHRoZSBpcnEgaW4gYSBtYXNrZWQN
CnN0YXRlIGFuZCB0aGVuIHVubWFza2luZyBpdCBhcyBwYXJ0IG9mIHRoZSBmaW5hbCByZWdpc3Ry
YXRpb24gY2FsbCB0bw0KbWFrZSB0aGUgZGV2aWNlIGdvIGxpdmUgd291bGQgYmUgYSBzYWZlciBh
bmQgbW9yZSBnZW5lcmFsIHBhdHRlcm4uDQoNCj4g

