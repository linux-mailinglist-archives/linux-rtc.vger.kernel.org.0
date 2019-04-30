Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2CEBEE26
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Apr 2019 03:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729431AbfD3BJo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 29 Apr 2019 21:09:44 -0400
Received: from mail-eopbgr40057.outbound.protection.outlook.com ([40.107.4.57]:50661
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729238AbfD3BJn (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 29 Apr 2019 21:09:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2kuCRhfZsaGfO/ETmSAWP3/xuWp6nHY/GKB42yoH8o=;
 b=IBgG/Yb+Nlnj8hkdQvDfPWENAnHlL32000iTrg08dyaQJcrcRBwyAah7aJK93hlNhr4JH1BHX8HN2jLIcNAGw6GNMZUZT0geuCH2ewTyhNcQRxbXU1JTVQSxZFfSmwMQf6sfj5ji9xgxaP5W3UR1+JpPJgGLdA44sltdDpATd8I=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3660.eurprd04.prod.outlook.com (52.134.70.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.15; Tue, 30 Apr 2019 01:09:39 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e8ca:4f6b:e43:c170]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e8ca:4f6b:e43:c170%3]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 01:09:39 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Trent Piepho <tpiepho@impinj.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] rtc: snvs: Use __maybe_unused instead of #if
 CONFIG_PM_SLEEP
Thread-Topic: [PATCH] rtc: snvs: Use __maybe_unused instead of #if
 CONFIG_PM_SLEEP
Thread-Index: AQHU/lmEml9HNTGs9Ea7jhPERyCyyKZTYMSAgACEl+A=
Date:   Tue, 30 Apr 2019 01:09:39 +0000
Message-ID: <DB3PR0402MB3916EAD5ACF48F9FB1159444F53A0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1556521071-8981-1-git-send-email-Anson.Huang@nxp.com>
 <1556557953.31309.4.camel@impinj.com>
In-Reply-To: <1556557953.31309.4.camel@impinj.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6db5452f-1a3e-43ed-7d1f-08d6cd0884d5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3660;
x-ms-traffictypediagnostic: DB3PR0402MB3660:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DB3PR0402MB3660D1DCDEF5460AAF53E3CAF53A0@DB3PR0402MB3660.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(39860400002)(366004)(136003)(396003)(189003)(199004)(13464003)(8936002)(99286004)(6506007)(6306002)(71190400001)(71200400001)(76176011)(6246003)(966005)(97736004)(4326008)(9686003)(2906002)(2201001)(86362001)(316002)(52536014)(7696005)(110136005)(229853002)(186003)(53546011)(66066001)(53936002)(25786009)(33656002)(5660300002)(45080400002)(74316002)(44832011)(55016002)(2501003)(14454004)(66476007)(81166006)(66556008)(66946007)(73956011)(3846002)(66446008)(26005)(6116002)(76116006)(14444005)(256004)(64756008)(7736002)(68736007)(81156014)(8676002)(486006)(446003)(476003)(478600001)(305945005)(6436002)(102836004)(11346002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3660;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uvt5BcGuLuDPckyVwQ8OIY3WZBaC5Sk7teaECPtr7Sqn54TP5+fkAXApXRnT/gt3VX2lqbnt7cxcWtzR5m2iL08R3lY3sfDv7LOgkS6LFGLNSk8P/TPrdCKLhYKprI9ehi4O3ZMrvZxFcNynsReeLbPOfia7VLs+tYdQS1ABGrW2m/1AbHTT0um6tJunFUEgb6HSmCVo2w986L0WFRW34zsip/15B1Xm8xe2G14hGSC8rUXhQH06CS1RkpZO0HyTbwtHoGG8fD1t5WjRHWoGYRNJ1YlNM4BxJTyKZYiNdw3SkDPIvm+iL7oU1zsyxQ3SDmOUsYGr4Ha2c5DtqGVPueaJN/+qqX5i4laxOYEWXnOK/Fp60Y43pz0msS31+bHh4qzJEMUfX3T3GoZxSTTh8aRhHkvqCDlvthCLOSDVTqo=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db5452f-1a3e-43ed-7d1f-08d6cd0884d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 01:09:39.0579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3660
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGksIFRyZW50DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVHJlbnQg
UGllcGhvIFttYWlsdG86dHBpZXBob0BpbXBpbmouY29tXQ0KPiBTZW50OiBUdWVzZGF5LCBBcHJp
bCAzMCwgMjAxOSAxOjEzIEFNDQo+IFRvOiBsaW51eC1ydGNAdmdlci5rZXJuZWwub3JnOyBBbnNv
biBIdWFuZyA8YW5zb24uaHVhbmdAbnhwLmNvbT47DQo+IGEuenVtbW9AdG93ZXJ0ZWNoLml0OyBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBhbGV4YW5kcmUuYmVsbG9uaUBib290bGlu
LmNvbQ0KPiBDYzogZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSF0gcnRjOiBzbnZzOiBVc2UgX19tYXliZV91bnVzZWQgaW5zdGVhZCBvZiAjaWYN
Cj4gQ09ORklHX1BNX1NMRUVQDQo+IA0KPiBPbiBNb24sIDIwMTktMDQtMjkgYXQgMDc6MDIgKzAw
MDAsIEFuc29uIEh1YW5nIHdyb3RlOg0KPiA+IFVzZSBfX21heWJlX3VudXNlZCBmb3IgcG93ZXIg
bWFuYWdlbWVudCByZWxhdGVkIGZ1bmN0aW9ucyBpbnN0ZWFkIG9mDQo+ID4gI2lmIENPTkZJR19Q
TV9TTEVFUCB0byBzaW1wbHkgdGhlIGNvZGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnNv
biBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gDQo+IFRoaXMgd2lsbCByZXN1bHQgaW4g
dGhlIGZ1bmN0aW9ucyBhbHdheXMgYmVpbmcgaW5jbHVkZWQsIGV2ZW4gaWYgUE1fU0xFRVAgaXMN
Cj4gb2ZmLi4uDQo+IA0KPiA+DQo+ID4gQEAgLTM4NywxNCArMzg1LDYgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBkZXZfcG1fb3BzIHNudnNfcnRjX3BtX29wcw0KPiA9IHsNCj4gPiAgCS5yZXN1bWVf
bm9pcnEgPSBzbnZzX3J0Y19yZXN1bWVfbm9pcnEsICB9Ow0KPiANCj4gLi4uYmVjYXVzZSB0aGV5
IHdpbGwgYWx3YXlzIGJlIHVzZWQgYnkgdGhlIGRlZmluaXRpb24gb2Ygc252c19ydGNfcG1fb3Bz
DQo+IGhlcmUuDQoNCllvdSBhcmUgcmlnaHQsIEkgbWlzc2VkIHRoaXMgcGFydCwgaGF2ZSBzZW50
IG91dCBWMiBwYXRjaCB3aXRoIA0KU0VUX05PSVJRX1NZU1RFTV9TTEVFUF9QTV9PUFMoKSB1c2Vk
IHRvIGRlZmluZSB0aGUgb3BzLCBwbGVhc2UgaGVscCByZXZpZXcuDQoNClRoYW5rcywNCkFuc29u
Lg0KDQo+IA0KPiBJbiBvcmRlciBmb3IgdGhpcyB0byB3b3JrLCBTSU1QTEVfREVWX1BNX09QUygp
IG5lZWRzIHRvIGJlIHVzZWQsIHNvIHRoYXQNCj4gdGhlIGRldl9wbV9vcHMgc3RydWN0IGlzIGVt
cHR5IHdoZW4gUE0gaXMgb2ZmIGFuZCB0aGUgZnVuY3Rpb25zIGRvbid0IGdldA0KPiByZWZlcmVu
Y2VkLiBTZWU6DQo+IGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5j
b20vP3VybD1odHRwcyUzQSUyRiUyRmxrbWwubw0KPiByZyUyRmxrbWwlMkYyMDE5JTJGMSUyRjE3
JTJGMzc2JmFtcDtkYXRhPTAyJTdDMDElN0NhbnNvbi5odWFuDQo+IGclNDBueHAuY29tJTdDNWI1
YWVhOGQyNzZkNGEzZTE5NTAwOGQ2Y2NjNWUxYjUlN0M2ODZlYTFkM2JjMmI0DQo+IGM2ZmE5MmNk
OTljNWMzMDE2MzUlN0MwJTdDMSU3QzYzNjkyMTU0NzU5OTc4NzYxNyZhbXA7c2RhdGE9Szhqdg0K
PiBLWFRDSVB3NElEZ3g4YUEyTm4lMkZzNjRGaVNwbWY3R1Z1enVYdWxiSSUzRCZhbXA7cmVzZXJ2
ZWQ9MA0K
