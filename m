Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 211566C7F2
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2019 05:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387728AbfGRDdX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 Jul 2019 23:33:23 -0400
Received: from mail-eopbgr40063.outbound.protection.outlook.com ([40.107.4.63]:44711
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727653AbfGRDdX (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 17 Jul 2019 23:33:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csuDAoZbU1+wCwLhJmJiOpeMHjWZaMtq/txgoO5CJ+kX+pqlkisjRgb7c43AdS1UR9iFAapRy1kVO/qHANuAa+gQLHIujLX4FAThB9Sp/GjTav8Ec8irn4KNBRTAWJ5LI1hhG8DWpXmRAP7D1+yfNElxvG4Zv9+daYRi1ooPFNfG49kSMoQ9by1k37I+S9N9hgyYgu8Gtf/14Eat9Rf6bVWqFSG4+jVVgnOJdz+eKLiG/ndwxBHjeh46swJACfKhppbNLJZdiGrNU/WvLkR9U5xwLKnXpQD4XdspWhncsFe4F0msuzPC4oudx7WK7TU6vA4vO6aBoXKxe4U7o0UhhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j49crsTz4BYiHUUDCBx7obRwltu1h7jPMEZY12rSKiM=;
 b=QuuDShgGSZ+oiW3be90trHfn2MKzvrGyJGaGeByN+GcKDwezlFaD/9vZkf95+j3by00E1pmIyWW01VA0T9qHZqbvRs41xpI7c7Yj1hKx58mw0IusrB6VuzA0zfB/yI2lyqPbOcP0MKvlZCjCuJQzAlI7SmSCkzkYxaiTyAFfMp26Iupf4S6u7CdhGh2RIrZgYESoI1ZPUflnpql3K7nJ+J5NYrLYzaSWm9Nup2y1hxjeTssdzzos1QLmXAxRZva88pSidNogShhZn/T4xAfND/DjB3kxwYgJ60lhId3J2W8u+1ggAocuiCQJsIxru/gOdU7XAScS24bxCISTM95Sgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j49crsTz4BYiHUUDCBx7obRwltu1h7jPMEZY12rSKiM=;
 b=pERXNoZ9LZZX/5kHSvflcjLVe4vtZzOxQPfPEzc27/uOdT6EhmmP8hwARAkXAkAkRp9kd8S7E4vDvU2OfYH3gTLldGGLYCLcaSw7buC+cPGTF/cvw1G80jxIdCFLwwq+WK2swDCaDLR80UUojsv7I8joqr0kmydbNxb1gANvOz8=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB3995.eurprd04.prod.outlook.com (52.134.107.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Thu, 18 Jul 2019 03:33:18 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::413e:84ea:f3bb:40bd]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::413e:84ea:f3bb:40bd%5]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 03:33:18 +0000
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
Thread-Index: AQHVO8Dr35T1g9Ay0kmBOJl4h91+pKbN1RCAgAC7zACAAQ8lAIAAGejw
Date:   Thu, 18 Jul 2019 03:33:18 +0000
Message-ID: <DB7PR04MB4490BC5DDEC821E4DC25421C8FC80@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190716101655.47418-1-biwen.li@nxp.com>
 <20190716101655.47418-2-biwen.li@nxp.com>
 <CAL_Jsq+U=W_51qUDvOMPgexMOLuqTyYua5H6G-cwFnKCh8YmPg@mail.gmail.com>
 <DB7PR04MB44902483232D323AF611D6298FC90@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <CAL_JsqKdsZQFtn+Bd2rZFKgZN5pgcsgXZz-Cy0qAt=8ycT0VHA@mail.gmail.com>
In-Reply-To: <CAL_JsqKdsZQFtn+Bd2rZFKgZN5pgcsgXZz-Cy0qAt=8ycT0VHA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 522b9e87-61c2-47a2-6a4d-08d70b30acda
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB3995;
x-ms-traffictypediagnostic: DB7PR04MB3995:
x-microsoft-antispam-prvs: <DB7PR04MB3995F2E605D08275843CB49F8FC80@DB7PR04MB3995.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(199004)(189003)(229853002)(26005)(54906003)(76176011)(186003)(7696005)(102836004)(81156014)(6506007)(81166006)(6436002)(53546011)(86362001)(446003)(14454004)(33656002)(478600001)(316002)(6116002)(3846002)(8936002)(2906002)(8676002)(11346002)(476003)(7736002)(256004)(14444005)(68736007)(25786009)(486006)(44832011)(305945005)(4326008)(99286004)(66476007)(74316002)(6246003)(76116006)(66066001)(5660300002)(52536014)(66446008)(64756008)(66556008)(71200400001)(71190400001)(9686003)(53936002)(66946007)(55016002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB3995;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y6tql2tlgDNVtJUxPGU0UJpCLzWBKicudkhLfM+jz7SpteWpd8PjjsHdG0OdwyxGCkdPIyabI/utFwbC4YAt5zI8z3JPSyU4DgTaqZdiy6rEEP2sNsbkNBhWwCX5Ih2aGSHUFTkEeysgac0B7X3/rC3zx8XLctqnWjylXevoWpcIhuLMGCo7mnBcVNEDMqRRPb3Evd4MydPzWl7bvx/eBrJTw0HY0qfF3XFOlgnU5+eP32tmSuD/m/4iRzhBAXh6xdKmk81Ibw9uS1PHqfjZJXXOJW2b5zoDaEWqHoJ2lO8l1EKe1TX0LPFyuC76Cm4SsNWhsDoSEsB3nG6+aOywR1PMHkp7qysdOcfExUOxbrr/edbIpkfdY4ocKlx0M6IGoMNuI3g7a0kdrYPrT4ymrczxOE+urq1F1P0c1xvDM+4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 522b9e87-61c2-47a2-6a4d-08d70b30acda
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 03:33:18.2095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biwen.li@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB3995
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PiA+DQo+ID4gPg0KPiA+ID4gQ2F1dGlvbjogRVhUIEVtYWlsDQo+ID4gPg0KPiA+ID4gT24gVHVl
LCBKdWwgMTYsIDIwMTkgYXQgNDoyNiBBTSBCaXdlbiBMaSA8Yml3ZW4ubGlAbnhwLmNvbT4gd3Jv
dGU6DQo+ID4gPiA+DQo+ID4gPiA+IFRoZSBwYXRjaCBhZGRzIGJpbmRpbmcgZm9yIGZ0bSBhbGFy
bSBkcml2ZXINCj4gPiA+DQo+ID4gPiBCaW5kaW5ncyBhcmUgZm9yIGgvdywgbm90IGRyaXZlcnMu
Li4NCj4gPiA+DQo+ID4gPiAnZHQtYmluZGluZ3M6IHJ0YzogLi4uJyBmb3IgdGhlIHN1YmplY3Qg
cHJlZml4Lg0KPiA+IEkgd2lsbCBjb3JyZWN0IGl0IGluIHY2Lg0KPiA+ID4NCj4gPiA+ID4NCj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogQml3ZW4gTGkgPGJpd2VuLmxpQG54cC5jb20+DQo+ID4gPiA+
IC0tLQ0KPiA+ID4gPiBDaGFuZ2UgaW4gdjU6DQo+ID4gPiA+ICAgICAtIE5vbmUNCj4gPiA+ID4N
Cj4gPiA+ID4gQ2hhbmdlIGluIHY0Og0KPiA+ID4gPiAgICAgLSBhZGQgbm90ZSBhYm91dCBkdHMg
YW5kIGtlcm5lbCBvcHRpb25zDQo+ID4gPiA+ICAgICAtIGFkZCBhbGlhc2VzIGluIGV4YW1wbGUN
Cj4gPiA+ID4NCj4gPiA+ID4gQ2hhbmdlIGluIHYzOg0KPiA+ID4gPiAgICAgICAgIC0gcmVtb3Zl
IHJlZy1uYW1lcyBwcm9wZXJ0eQ0KPiA+ID4gPiAgICAgICAgIC0gY29ycmVjdCBjZWxscyBudW1i
ZXINCj4gPiA+ID4NCj4gPiA+ID4gQ2hhbmdlIGluIHYyOg0KPiA+ID4gPiAgICAgICAgIC0gcmVw
bGFjZSBsczEwNDNhIHdpdGggbHMxMDg4YSBhcyBleGFtcGxlDQo+ID4gPiA+ICAgICAgICAgLSBh
ZGQgcmNwbSBub2RlIGFuZCBmc2wscmNwbS13YWtldXAgcHJvcGVydHkNCj4gPiA+ID4NCj4gPiA+
ID4NCj4gPiA+ID4gIC4uLi9iaW5kaW5ncy9ydGMvcnRjLWZzbC1mdG0tYWxhcm0udHh0ICAgICAg
ICB8IDQ5DQo+ICsrKysrKysrKysrKysrKysrKysNCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0
OSBpbnNlcnRpb25zKCspDQo+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiA+ID4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9ydGMtZnNsLWZ0bS1hbGFybS50eHQN
Cj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdA0KPiA+ID4gPiBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9ydGMvcnRjLWZzbC1mdG0tYWxhcm0udHh0DQo+ID4gPiA+IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9ydGMtZnNsLWZ0bS1hbGFybS50eHQN
Cj4gPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAw
Li5mYjAxODA2NTQwNmMNCj4gPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL3J0Yy1mc2wtZnRtLWFsYXJtLnR4dA0K
PiA+ID4gPiBAQCAtMCwwICsxLDQ5IEBADQo+ID4gPiA+ICtGcmVlc2NhbGUgRmxleFRpbWVyIE1v
ZHVsZSAoRlRNKSBBbGFybQ0KPiA+ID4gPiArDQo+ID4gPiA+ICtOb3RlOg0KPiA+ID4gPiArLSBU
aGUgZHJpdmVyIGRlcGVuZHMgb24gUkNQTSBkcml2ZXINCj4gPiA+ID4gKyAgdG8gd2FrZSB1cCBz
eXN0ZW0gaW4gc2xlZXAuDQo+ID4gPiA+ICstIE5lZWQgc3RvcCB1c2luZyBSVENfSENUT1NZUyBv
ciB1c2UgdGhlIERUIGFsaWFzZXMNCj4gPiA+ID4gKyAgdG8gZW5zdXJlIHRoZSBkcml2ZXIgaXMg
bm90IHVzZWQgYXMgdGhlIHByaW1hcnkgUlRDLg0KPiA+ID4gPiArICAoU2VsZWN0IERUIGFsaWFz
ZXMgZGVmYXVsdGx5KQ0KPiA+ID4NCj4gPiA+IFRoaXMgaXMgTGludXggc3BlY2lmaWMgYW5kIG5v
dCByZWxldmFudCB0byB0aGUgYmluZGluZy4NCj4gPiBPaywgSSB3aWxsIHJlbW92ZSBhbGwgb2Yg
dGhlIE5vdGUgaW4gdjYuDQo+ID4gPg0KPiA+ID4gPiArDQo+ID4gPiA+ICtSZXF1aXJlZCBwcm9w
ZXJ0aWVzOg0KPiA+ID4gPiArLSBjb21wYXRpYmxlIDogU2hvdWxkIGJlICJmc2wsPGNoaXA+LWZ0
bS1hbGFybSIsIHRoZQ0KPiA+ID4gPiArICAgICAgICAgICAgICBzdXBwb3J0ZWQgY2hpcHMgaW5j
bHVkZQ0KPiA+ID4gPiArICAgICAgICAgICAgICAiZnNsLGxzMTAxMmEtZnRtLWFsYXJtIg0KPiA+
ID4gPiArICAgICAgICAgICAgICAiZnNsLGxzMTAyMWEtZnRtLWFsYXJtIg0KPiA+ID4gPiArICAg
ICAgICAgICAgICAiZnNsLGxzMTAyOGEtZnRtLWFsYXJtIg0KPiA+ID4gPiArICAgICAgICAgICAg
ICAiZnNsLGxzMTA0M2EtZnRtLWFsYXJtIg0KPiA+ID4gPiArICAgICAgICAgICAgICAiZnNsLGxz
MTA0NmEtZnRtLWFsYXJtIg0KPiA+ID4gPiArICAgICAgICAgICAgICAiZnNsLGxzMTA4OGEtZnRt
LWFsYXJtIg0KPiA+ID4gPiArICAgICAgICAgICAgICAiZnNsLGxzMjA4eGEtZnRtLWFsYXJtIg0K
PiA+ID4gPiArLSByZWcgOiBTcGVjaWZpZXMgYmFzZSBwaHlzaWNhbCBhZGRyZXNzIGFuZCBzaXpl
IG9mIHRoZSByZWdpc3Rlcg0KPiA+ID4gPiArc2V0cyBmb3IgdGhlDQo+ID4gPiA+ICsgIEZsZXhU
aW1lciBNb2R1bGUgYW5kIGJhc2UgcGh5c2ljYWwgYWRkcmVzcyBvZiBJUCBQb3dlcmRvd24NCj4g
PiA+ID4gK0V4Y2VwdGlvbiBDb250cm9sDQo+ID4gPiA+ICsgIFJlZ2lzdGVyLg0KPiA+ID4gPiAr
LSBpbnRlcnJ1cHRzIDogU2hvdWxkIGJlIHRoZSBGbGV4VGltZXIgTW9kdWxlIGludGVycnVwdC4N
Cj4gPiA+ID4gKy0gZnNsLHJjcG0td2FrZXVwIHByb3BlcnR5IGFuZCByY3BtIG5vZGUgOiBQbGVh
c2UgcmVmZXINCj4gPiA+ID4gKyAgICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc29jL2ZzbC9yY3BtLnR4dA0KPiA+ID4gPiArDQo+ID4gPiA+ICtPcHRpb25hbCBwcm9wZXJ0
aWVzOg0KPiA+ID4gPiArLSBiaWctZW5kaWFuOiBJZiB0aGUgaG9zdCBjb250cm9sbGVyIGlzIGJp
Zy1lbmRpYW4gbW9kZSwgc3BlY2lmeSB0aGlzDQo+IHByb3BlcnR5Lg0KPiA+ID4gPiArICBUaGUg
ZGVmYXVsdCBlbmRpYW4gbW9kZSBpcyBsaXR0bGUtZW5kaWFuLg0KPiA+ID4gPiArDQo+ID4gPiA+
ICtFeGFtcGxlOg0KPiA+ID4gPiArYWxpYXNlcyB7DQo+ID4gPiA+ICsgICAgICAgLi4uDQo+ID4g
PiA+ICsgICAgICAgcnRjMSA9IGZ0bV9hbGFybTA7IC8qIFVzZSBmbGV4dGltZXIgYWxhcm0gZHJp
dmVyIGFzIC9kZXYvcnRjMSAqLw0KPiA+ID4gPiArICAgICAgIC4uLg0KPiA+ID4gPiArfTsNCj4g
PiA+DQo+ID4gPiBEcm9wIHRoZSBhbGlhc2VzIHBhcnQuIEl0J3Mgbm90IGdvaW5nIHRvIHdvcmsg
d2hlbiB0aGlzIGlzIGNvbnZlcnRlZA0KPiA+ID4gdG8gRFQgc2NoZW1hIGFuZCB0aGUgY29tbWVu
dCBpcyBMaW51eCBzcGVjaWZpYy4NCj4gPiBTb3JyeSxJIGNhbid0IGRyb3AgdGhlIGFsaWFzZXMg
cGFydC4gSWYgYW55IHVzZXIgdXNlcyB0aGUgYWxhcm0gZHJpdmVyDQo+ID4gYXMgcnRjMCwgdGhl
IHVzZXIgd2lsbCBnZXQgd3JvbmcgdGltZSBmcm9tIC9kZXYvcnRjMC5JdCBpcyB2ZXJ5IGltcG9y
dGFudC4NCj4gDQo+IEkganVzdCBtZWFuIGRvbid0IHB1dCBpdCBpbiB0aGUgZXhhbXBsZS4gWW91
IGNhbiB1c2UgaXQgaW4geW91ciBkdHMgZmlsZS4NClRoYW5rIHlvdSBzbyBtdWNoLEkgbmVlZCBw
dXQgaXQgaW4gdGhlIGV4YW1wbGUgZm9yIGEgbm90ZShQbGVhc2Ugbm90IHVzZSBpdCBhcyBydGMw
KS4NCkkgdXNlIGl0IGFzIGEgbm90ZSBpbiB0aGUgZXhhbXBsZSB0byBhdm9pZCB0aGF0IHNvbWVv
bmUgdXNlIEZsZXhUaW1lciBtb2R1bGUgYXMgcnRjMC4gDQo=
