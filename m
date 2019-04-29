Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7DBCE880
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Apr 2019 19:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728771AbfD2RMj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 29 Apr 2019 13:12:39 -0400
Received: from mail-eopbgr820103.outbound.protection.outlook.com ([40.107.82.103]:6126
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728520AbfD2RMi (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 29 Apr 2019 13:12:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=impinj.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fB6tjOKj0Z9AukhUTQohof/FE3IbFFHpjFF0AFsy1o=;
 b=GwmbbJ8miwHAZ2nkphaETJZRnK5mTC6BLMOYZgIANm28UXHq5oOP1E2T+ccENsU0nCGDUcYopfRb3tmVEbIcoFoSLHosqLqbOe0YGhgF+12nclGn3JQ7+rtFAk+prWdnOcoFTI8ITulgyiHVXQ937rE28q8jxku4mq+VzncmgRI=
Received: from MWHPR0601MB3708.namprd06.prod.outlook.com (10.167.236.38) by
 MWHPR0601MB3658.namprd06.prod.outlook.com (10.167.236.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Mon, 29 Apr 2019 17:12:35 +0000
Received: from MWHPR0601MB3708.namprd06.prod.outlook.com
 ([fe80::2d6d:7e4b:d2ff:5e29]) by MWHPR0601MB3708.namprd06.prod.outlook.com
 ([fe80::2d6d:7e4b:d2ff:5e29%3]) with mapi id 15.20.1835.018; Mon, 29 Apr 2019
 17:12:34 +0000
From:   Trent Piepho <tpiepho@impinj.com>
To:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "anson.huang@nxp.com" <anson.huang@nxp.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "linux-imx@nxp.com" <linux-imx@nxp.com>
Subject: Re: [PATCH] rtc: snvs: Use __maybe_unused instead of #if
 CONFIG_PM_SLEEP
Thread-Topic: [PATCH] rtc: snvs: Use __maybe_unused instead of #if
 CONFIG_PM_SLEEP
Thread-Index: AQHU/lmEml9HNTGs9Ea7jhPERyCyyKZTYMSA
Date:   Mon, 29 Apr 2019 17:12:34 +0000
Message-ID: <1556557953.31309.4.camel@impinj.com>
References: <1556521071-8981-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1556521071-8981-1-git-send-email-Anson.Huang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=tpiepho@impinj.com; 
x-originating-ip: [216.207.205.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 153c713e-f07c-4566-887f-08d6ccc5df7a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR0601MB3658;
x-ms-traffictypediagnostic: MWHPR0601MB3658:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR0601MB3658D5D9A6E0B0E5E519D2F3D3390@MWHPR0601MB3658.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39840400004)(376002)(346002)(136003)(396003)(199004)(189003)(26005)(6306002)(486006)(229853002)(6506007)(6246003)(14454004)(25786009)(476003)(71190400001)(53936002)(71200400001)(102836004)(6512007)(186003)(2906002)(4326008)(103116003)(36756003)(2501003)(91956017)(305945005)(76116006)(64756008)(66446008)(66556008)(66946007)(2201001)(5660300002)(68736007)(7736002)(99286004)(3846002)(6116002)(66476007)(73956011)(76176011)(8676002)(81156014)(81166006)(97736004)(8936002)(6436002)(966005)(66066001)(2616005)(478600001)(6486002)(14444005)(256004)(446003)(86362001)(316002)(11346002)(110136005)(4744005);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR0601MB3658;H:MWHPR0601MB3708.namprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: impinj.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ogJIyIiSvmfztsdw+6kTcDFpL1RdDzsF0Ya4PT9TijEtSouCXUkj2pPh+b7yF40Y7OADcbDmmfL8a/70p6g/Lije02Nif7BewHTMIKF6DPv1Zj4ejhimc/GV7cXq6qYcJTZuotMT5oHPZT0yWly+/w6tD5EJVZH+M3HDfRrfJqad+SIDpwI09XKgCasIVlQAOzPfcPfq01SGyXEs9eYeC7Mdagv/y84Jw+TksOcCSVvPVcTXIIfqDHnmAk54S6d9lKpoQTIzXBgtfIeUhSePWbxM5Zo21C2bw2NXogoLqz53BpNtCcHI7Y8ezgGHwGnStJfVsi41wsHwWmvXtohf8u6yYXCxZNMXUiIY39vERnp2DUrZBHJR+XGkfzddY3Q929IB9rvMvj6Iu17+TY2R8WveCLah2ivZzgHuquaxrw8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3CEA9D2E6B6E741858AAAB4819F3480@namprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: impinj.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 153c713e-f07c-4566-887f-08d6ccc5df7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 17:12:34.7835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6de70f0f-7357-4529-a415-d8cbb7e93e5e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0601MB3658
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gTW9uLCAyMDE5LTA0LTI5IGF0IDA3OjAyICswMDAwLCBBbnNvbiBIdWFuZyB3cm90ZToNCj4g
VXNlIF9fbWF5YmVfdW51c2VkIGZvciBwb3dlciBtYW5hZ2VtZW50IHJlbGF0ZWQgZnVuY3Rpb25z
DQo+IGluc3RlYWQgb2YgI2lmIENPTkZJR19QTV9TTEVFUCB0byBzaW1wbHkgdGhlIGNvZGUuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCg0K
VGhpcyB3aWxsIHJlc3VsdCBpbiB0aGUgZnVuY3Rpb25zIGFsd2F5cyBiZWluZyBpbmNsdWRlZCwg
ZXZlbiBpZg0KUE1fU0xFRVAgaXMgb2ZmLi4uDQoNCj4gIA0KPiBAQCAtMzg3LDE0ICszODUsNiBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgc252c19ydGNfcG1fb3BzID0gew0KPiAg
CS5yZXN1bWVfbm9pcnEgPSBzbnZzX3J0Y19yZXN1bWVfbm9pcnEsDQo+ICB9Ow0KDQouLi5iZWNh
dXNlIHRoZXkgd2lsbCBhbHdheXMgYmUgdXNlZCBieSB0aGUgZGVmaW5pdGlvbiBvZg0Kc252c19y
dGNfcG1fb3BzIGhlcmUuDQoNCkluIG9yZGVyIGZvciB0aGlzIHRvIHdvcmssIFNJTVBMRV9ERVZf
UE1fT1BTKCkgbmVlZHMgdG8gYmUgdXNlZCwNCnNvIHRoYXQgdGhlIGRldl9wbV9vcHMgc3RydWN0
IGlzIGVtcHR5IHdoZW4gUE0gaXMgb2ZmIGFuZCB0aGUgZnVuY3Rpb25zDQpkb24ndCBnZXQgcmVm
ZXJlbmNlZC4gU2VlOiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS8xLzE3LzM3Ng0K
