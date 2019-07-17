Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE4D6B9BB
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jul 2019 12:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbfGQKFT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 Jul 2019 06:05:19 -0400
Received: from mail-eopbgr10057.outbound.protection.outlook.com ([40.107.1.57]:18350
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726081AbfGQKFT (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 17 Jul 2019 06:05:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LiuOKV5RAHoLeNx20QQkZaCtqTB0o63hYmeJOxghCv4LmRlh4xclR6zygONkbkzdzZUsXYTa9p9sdvveprDHNXx5MsiJ6edujNETtlWoo96uKIPFL0MoOuCqxvkpTXdxH7dny6/J7s+Qa1F7aHwLvNXSFrl8eoH9vDV8ZhJsQ6HH/gnNCn8qgLGmsxvhIcmFNPWy8K/zVDGcx8sTNgeIwT01PIrvKlrbwgttUguFj2ye3Xg33ai4ICBV1IwCILlU1UYRKcNg42qnRA8LlULtMit2seBvN2hCuerZEk7pZR/3JuuWgjX8cYE+NPOMIyYOjdaJrQxS/pobybU8ylysjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8ma/4Iz6+5G6bhlX1h8gKiDTIZBjeQ1mXdPpQEGJWg=;
 b=MKYLld+VNC3mHArsdj7tGw2F6uY1Rnf4AOC3rXVfU4MfzeuzInykaVmU4r2/iED9BG6qoSpdEVRDzvgtCNFTi2rHhX6ZWVFlnG8l+EkYMPT8mN2HDJqr6VtjhghkHFmu/f7AX4onQcKAWqtiDC+kC6Hbij4fLKYe0DghAebXiAdsUCGq5bAJ9pjr9/tUXCd+Yz6g1GEitiWQEmpu/3kFUNYVMTyj9x7LEVTbcPR7VMbw8Ny1JsTb5MTUDG0FPxYLXXw9oRANH7NjSH36ZdYcarRBJqQi1FgKdgDyuQvZY6SdHteZcdN7yCAor7XDDWUG8rJPbrY4mlZVEcdebgRBqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8ma/4Iz6+5G6bhlX1h8gKiDTIZBjeQ1mXdPpQEGJWg=;
 b=WfoEmetNc7RTd/HBPXD6tMNarThkPNcWHprYriL+ZNwRuIFyV7PKFpcuxx/Qobs8s91a7Dg2YHlDWyOj8vABFUEKuOQTsefHrTFxp8BcWkLmkhWGj1BVXCgCWp+g0LdSJdH26oe0a72C0870ZvpiLU7F7aPI0o9WV1FJ2ZSifAU=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4425.eurprd04.prod.outlook.com (52.135.140.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Wed, 17 Jul 2019 10:05:13 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::413e:84ea:f3bb:40bd]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::413e:84ea:f3bb:40bd%5]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 10:05:13 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Leo Li <leoyang.li@nxp.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaobo Xie <xiaobo.xie@nxp.com>,
        Jiafei Pan <jiafei.pan@nxp.com>, Ran Wang <ran.wang_1@nxp.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [EXT] Re: [v5,2/2] Documentation: dt: binding: rtc: add binding
 for ftm alarm driver
Thread-Topic: [EXT] Re: [v5,2/2] Documentation: dt: binding: rtc: add binding
 for ftm alarm driver
Thread-Index: AQHVO8Dr35T1g9Ay0kmBOJl4h91+pKbN1RCAgAC7zAA=
Date:   Wed, 17 Jul 2019 10:05:13 +0000
Message-ID: <DB7PR04MB44902483232D323AF611D6298FC90@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190716101655.47418-1-biwen.li@nxp.com>
 <20190716101655.47418-2-biwen.li@nxp.com>
 <CAL_Jsq+U=W_51qUDvOMPgexMOLuqTyYua5H6G-cwFnKCh8YmPg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+U=W_51qUDvOMPgexMOLuqTyYua5H6G-cwFnKCh8YmPg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ca6bd29-f67d-4911-249c-08d70a9e42d4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB4425;
x-ms-traffictypediagnostic: DB7PR04MB4425:
x-microsoft-antispam-prvs: <DB7PR04MB4425F66AFAC6945D2C1F72688FC90@DB7PR04MB4425.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(346002)(136003)(366004)(376002)(199004)(189003)(476003)(486006)(8676002)(81166006)(9686003)(81156014)(6436002)(55016002)(229853002)(2906002)(6116002)(53936002)(11346002)(305945005)(33656002)(7736002)(74316002)(3846002)(4326008)(6246003)(66066001)(25786009)(71190400001)(68736007)(446003)(71200400001)(76176011)(99286004)(102836004)(186003)(26005)(64756008)(14454004)(6506007)(76116006)(66946007)(66476007)(66446008)(478600001)(44832011)(66556008)(53546011)(52536014)(7696005)(86362001)(8936002)(256004)(54906003)(14444005)(316002)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4425;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QgPL20U4aNww66clC04IkkdJ1+jLD8ztgqH4WXNdrN6/H+nNcg7UaW6B38i11QvAMnIa5KRYDzNulhqDORNoIPIGqVlVLkguB9GixBXJMnc4D0zXaHot62p5gj+OUkghuKitFh+oHVwqRr9THUQXoS+Js86m6JN1+NePJnBppsK79WNdfwq3nFAvUv1VMp6gr32OQJdBAhJcWqRT5yhpQbHR+BRAE8PiG8BymSGvFpyM/imgIvOEF9+MJlkNdchXSQ7Wz32tMI+M8YMN3qTJje8HjFf3WuIteIVqyzskXTQ9bnOA1aUdgz358cCI4Oh3Kg7zbx3T/yTdDlr3XvlEzkV8uiPwp+mxkds1Ali5t5F4Kb3MqTFzm4hY8nmbRhLhCrQNqSbTvcwQP8Q95ncYLKIw+YLjhniubO0ATnLMa1Y=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca6bd29-f67d-4911-249c-08d70a9e42d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 10:05:13.7634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biwen.li@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4425
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PiANCj4gQ2F1dGlvbjogRVhUIEVtYWlsDQo+IA0KPiBPbiBUdWUsIEp1bCAxNiwgMjAxOSBhdCA0
OjI2IEFNIEJpd2VuIExpIDxiaXdlbi5saUBueHAuY29tPiB3cm90ZToNCj4gPg0KPiA+IFRoZSBw
YXRjaCBhZGRzIGJpbmRpbmcgZm9yIGZ0bSBhbGFybSBkcml2ZXINCj4gDQo+IEJpbmRpbmdzIGFy
ZSBmb3IgaC93LCBub3QgZHJpdmVycy4uLg0KPiANCj4gJ2R0LWJpbmRpbmdzOiBydGM6IC4uLicg
Zm9yIHRoZSBzdWJqZWN0IHByZWZpeC4NCkkgd2lsbCBjb3JyZWN0IGl0IGluIHY2Lg0KPiANCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpd2VuIExpIDxiaXdlbi5saUBueHAuY29tPg0KPiA+IC0t
LQ0KPiA+IENoYW5nZSBpbiB2NToNCj4gPiAgICAgLSBOb25lDQo+ID4NCj4gPiBDaGFuZ2UgaW4g
djQ6DQo+ID4gICAgIC0gYWRkIG5vdGUgYWJvdXQgZHRzIGFuZCBrZXJuZWwgb3B0aW9ucw0KPiA+
ICAgICAtIGFkZCBhbGlhc2VzIGluIGV4YW1wbGUNCj4gPg0KPiA+IENoYW5nZSBpbiB2MzoNCj4g
PiAgICAgICAgIC0gcmVtb3ZlIHJlZy1uYW1lcyBwcm9wZXJ0eQ0KPiA+ICAgICAgICAgLSBjb3Jy
ZWN0IGNlbGxzIG51bWJlcg0KPiA+DQo+ID4gQ2hhbmdlIGluIHYyOg0KPiA+ICAgICAgICAgLSBy
ZXBsYWNlIGxzMTA0M2Egd2l0aCBsczEwODhhIGFzIGV4YW1wbGUNCj4gPiAgICAgICAgIC0gYWRk
IHJjcG0gbm9kZSBhbmQgZnNsLHJjcG0td2FrZXVwIHByb3BlcnR5DQo+ID4NCj4gPg0KPiA+ICAu
Li4vYmluZGluZ3MvcnRjL3J0Yy1mc2wtZnRtLWFsYXJtLnR4dCAgICAgICAgfCA0OSArKysrKysr
KysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspDQo+ID4g
IGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9ydGMvcnRjLWZzbC1mdG0tYWxhcm0udHh0DQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL3J0Yy1mc2wtZnRtLWFsYXJtLnR4
dA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9ydGMtZnNsLWZ0
bS1hbGFybS50eHQNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAw
MDAwMC4uZmIwMTgwNjU0MDZjDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvcnRjLWZzbC1mdG0tYWxhcm0udHh0DQo+ID4g
QEAgLTAsMCArMSw0OSBAQA0KPiA+ICtGcmVlc2NhbGUgRmxleFRpbWVyIE1vZHVsZSAoRlRNKSBB
bGFybQ0KPiA+ICsNCj4gPiArTm90ZToNCj4gPiArLSBUaGUgZHJpdmVyIGRlcGVuZHMgb24gUkNQ
TSBkcml2ZXINCj4gPiArICB0byB3YWtlIHVwIHN5c3RlbSBpbiBzbGVlcC4NCj4gPiArLSBOZWVk
IHN0b3AgdXNpbmcgUlRDX0hDVE9TWVMgb3IgdXNlIHRoZSBEVCBhbGlhc2VzDQo+ID4gKyAgdG8g
ZW5zdXJlIHRoZSBkcml2ZXIgaXMgbm90IHVzZWQgYXMgdGhlIHByaW1hcnkgUlRDLg0KPiA+ICsg
IChTZWxlY3QgRFQgYWxpYXNlcyBkZWZhdWx0bHkpDQo+IA0KPiBUaGlzIGlzIExpbnV4IHNwZWNp
ZmljIGFuZCBub3QgcmVsZXZhbnQgdG8gdGhlIGJpbmRpbmcuDQpPaywgSSB3aWxsIHJlbW92ZSBh
bGwgb2YgdGhlIE5vdGUgaW4gdjYuDQo+IA0KPiA+ICsNCj4gPiArUmVxdWlyZWQgcHJvcGVydGll
czoNCj4gPiArLSBjb21wYXRpYmxlIDogU2hvdWxkIGJlICJmc2wsPGNoaXA+LWZ0bS1hbGFybSIs
IHRoZQ0KPiA+ICsgICAgICAgICAgICAgIHN1cHBvcnRlZCBjaGlwcyBpbmNsdWRlDQo+ID4gKyAg
ICAgICAgICAgICAgImZzbCxsczEwMTJhLWZ0bS1hbGFybSINCj4gPiArICAgICAgICAgICAgICAi
ZnNsLGxzMTAyMWEtZnRtLWFsYXJtIg0KPiA+ICsgICAgICAgICAgICAgICJmc2wsbHMxMDI4YS1m
dG0tYWxhcm0iDQo+ID4gKyAgICAgICAgICAgICAgImZzbCxsczEwNDNhLWZ0bS1hbGFybSINCj4g
PiArICAgICAgICAgICAgICAiZnNsLGxzMTA0NmEtZnRtLWFsYXJtIg0KPiA+ICsgICAgICAgICAg
ICAgICJmc2wsbHMxMDg4YS1mdG0tYWxhcm0iDQo+ID4gKyAgICAgICAgICAgICAgImZzbCxsczIw
OHhhLWZ0bS1hbGFybSINCj4gPiArLSByZWcgOiBTcGVjaWZpZXMgYmFzZSBwaHlzaWNhbCBhZGRy
ZXNzIGFuZCBzaXplIG9mIHRoZSByZWdpc3RlciBzZXRzDQo+ID4gK2ZvciB0aGUNCj4gPiArICBG
bGV4VGltZXIgTW9kdWxlIGFuZCBiYXNlIHBoeXNpY2FsIGFkZHJlc3Mgb2YgSVAgUG93ZXJkb3du
DQo+ID4gK0V4Y2VwdGlvbiBDb250cm9sDQo+ID4gKyAgUmVnaXN0ZXIuDQo+ID4gKy0gaW50ZXJy
dXB0cyA6IFNob3VsZCBiZSB0aGUgRmxleFRpbWVyIE1vZHVsZSBpbnRlcnJ1cHQuDQo+ID4gKy0g
ZnNsLHJjcG0td2FrZXVwIHByb3BlcnR5IGFuZCByY3BtIG5vZGUgOiBQbGVhc2UgcmVmZXINCj4g
PiArICAgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvZnNsL3JjcG0u
dHh0DQo+ID4gKw0KPiA+ICtPcHRpb25hbCBwcm9wZXJ0aWVzOg0KPiA+ICstIGJpZy1lbmRpYW46
IElmIHRoZSBob3N0IGNvbnRyb2xsZXIgaXMgYmlnLWVuZGlhbiBtb2RlLCBzcGVjaWZ5IHRoaXMg
cHJvcGVydHkuDQo+ID4gKyAgVGhlIGRlZmF1bHQgZW5kaWFuIG1vZGUgaXMgbGl0dGxlLWVuZGlh
bi4NCj4gPiArDQo+ID4gK0V4YW1wbGU6DQo+ID4gK2FsaWFzZXMgew0KPiA+ICsgICAgICAgLi4u
DQo+ID4gKyAgICAgICBydGMxID0gZnRtX2FsYXJtMDsgLyogVXNlIGZsZXh0aW1lciBhbGFybSBk
cml2ZXIgYXMgL2Rldi9ydGMxICovDQo+ID4gKyAgICAgICAuLi4NCj4gPiArfTsNCj4gDQo+IERy
b3AgdGhlIGFsaWFzZXMgcGFydC4gSXQncyBub3QgZ29pbmcgdG8gd29yayB3aGVuIHRoaXMgaXMg
Y29udmVydGVkIHRvIERUIHNjaGVtYQ0KPiBhbmQgdGhlIGNvbW1lbnQgaXMgTGludXggc3BlY2lm
aWMuDQpTb3JyeSxJIGNhbid0IGRyb3AgdGhlIGFsaWFzZXMgcGFydC4gSWYgYW55IHVzZXIgdXNl
cyB0aGUgYWxhcm0gZHJpdmVyIGFzIHJ0YzAsDQp0aGUgdXNlciB3aWxsIGdldCB3cm9uZyB0aW1l
IGZyb20gL2Rldi9ydGMwLkl0IGlzIHZlcnkgaW1wb3J0YW50Lg0KPiANCj4gPiArDQo+ID4gK3Jj
cG06IHJjcG1AMWUzNDA0MCB7DQo+ID4gKyAgICAgICBjb21wYXRpYmxlID0gImZzbCxsczEwODhh
LXJjcG0iLCAiZnNsLHFvcmlxLXJjcG0tMi4xKyI7DQo+ID4gKyAgICAgICByZWcgPSA8MHgwIDB4
MWUzNDA0MCAweDAgMHgxOD47DQo+ID4gKyAgICAgICBmc2wsI3JjcG0td2FrZXVwLWNlbGxzID0g
PDY+Ow0KPiANCj4gQmVmb3JlIHRoZXJlIGFyZSBhbnkgdXNlcnMgb2YgdGhpcywgZWl0aGVyIGRy
b3AgaXQgaWYgaXQgaXMgbm90IHZhcmlhYmxlIG9yIHRoZSBjb3JyZWN0DQo+IGZvcm0gd291bGQg
YmUgJyNmc2wscmNwbS13YWtldXAtY2VsbHMnLg0KSSB3aWxsIHJlcGxhY2UgJ2ZzbCwjcmNwbS13
YWtldXAtY2VsbHMnIHdpdGggJyNmc2wscmNwbS13YWtldXAtY2VsbHMnIGluIHY2Lg0KPiANCj4g
PiArfTsNCj4gPiArDQo+ID4gK2Z0bV9hbGFybTA6IHRpbWVyQDI4MDAwMDAgew0KPiA+ICsgICAg
ICAgY29tcGF0aWJsZSA9ICJmc2wsbHMxMDg4YS1mdG0tYWxhcm0iOw0KPiA+ICsgICAgICAgcmVn
ID0gPDB4MCAweDI4MDAwMDAgMHgwIDB4MTAwMDA+Ow0KPiA+ICsgICAgICAgZnNsLHJjcG0td2Fr
ZXVwID0gPCZyY3BtIDB4MCAweDAgMHgwIDB4MCAweDQwMDAgMHgwPjsNCj4gPiArICAgICAgIGlu
dGVycnVwdHMgPSA8MCA0NCA0PjsNCj4gPiArfTsNCj4gPiAtLQ0KPiA+IDIuMTcuMQ0KPiA+DQo=
