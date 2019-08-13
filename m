Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F31068B401
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Aug 2019 11:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbfHMJWq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 13 Aug 2019 05:22:46 -0400
Received: from mail-eopbgr30088.outbound.protection.outlook.com ([40.107.3.88]:43491
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725781AbfHMJWq (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 13 Aug 2019 05:22:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iozqqSmnATYMomgpVw01UViuT/ayy8/3g26n7vVehsa9m+pgtcvJC73DjnOq6qa63PjXlNoB1HnIXDFFvRqhpN1gfVwdSXQxgHl7gPiC/7dYB10MtzPle/RN/SJCsZfI/9+Xfzp7G6X5DioimLi9Owy5LRFcyB3UnVar4P8JJGGeSHZlPtY0fCLJKb8th8V+DcYMXhCf6NO5h8UnI+0TZ2dgT9Epb2CanodyM8OqmitK0jnoLyywDx1iWNRc9Xaw/sBkaIhDtl6O53WBHCeeaoEfiwmtrZqlSd5KL1zqtZvaK8yYf7eO546AtWat18/sFTHZWCu/oBf1uYie9trpIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ske4cpPNIZrp9ItfEaSJBukJ/yHBcFZDWzd6Hqbz66s=;
 b=HpJ+i8gQna37xdgmc+QHs2jT6XNFDxYKSgdephgU5Duxsy94ePIiBRcX1AOUkuua14FuZy3YzrgRY3bkl3IPJ8i028IqqboREcwQy7QzpOB9GS34VSZNVtr3qG7YZ3ovygesD7OjQWzQ7G6/5Kz0Wp+E8Tsvnw0UHUhApar4j0d5zfcQQpnSouBHXVUYNRobTJY6cIL0+/6lcW82R98F3KNUnoHnSVYYxKHdA+ogAsGCyJJoNV7ASWV97KL/smMO1weOcSgdh0wqBIvAxyxHxSsegVMqHmYXNW7WeSzk5qmE0/i8dirNpjVMVGtzto4k4ZPMIaQlB6uQNeApgqHdgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ske4cpPNIZrp9ItfEaSJBukJ/yHBcFZDWzd6Hqbz66s=;
 b=ET9cM/omhxSPWi2TkH1l1PN0cwDWASD1KNmIiy145KRrj4i9BjOAgDRl+hT9QGR/19C4lYl+ySNdTiB2+3VyH8yD6lK3eTyU3WYl9yCyIevv4f0LLjU0TFSKNoTAd6R1Nh6Jyyf8pCZC628g7Q6UP76qo1ulbWMyAj9H4GI9GFw=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3836.eurprd04.prod.outlook.com (52.134.71.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Tue, 13 Aug 2019 09:22:39 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::7cdf:bddc:212c:f77e]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::7cdf:bddc:212c:f77e%4]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 09:22:39 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Trent Piepho <tpiepho@impinj.com>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] rtc: snvs: fix possible race condition
Thread-Topic: [PATCH] rtc: snvs: fix possible race condition
Thread-Index: AQHVO6gHgDF/BlJMPUyX9VGe8rSFO6bOpJgAgAAyYBCAAN3WgIAA4I4AgACuAJCAAQ7fgIABoLiAgCUFpHA=
Date:   Tue, 13 Aug 2019 09:22:39 +0000
Message-ID: <DB3PR0402MB39160B49C7CDD99F546E98DCF5D20@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190716071858.36750-1-Anson.Huang@nxp.com>
 <AM0PR04MB421167283C950557E231181480C90@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <DB3PR0402MB39164D0022E25706D2B871C7F5C90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <AM0PR04MB421114F025F27AF2BC5FA21980C80@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <1563467526.2343.80.camel@impinj.com>
 <DB3PR0402MB3916053E6344520416BC976BF5CB0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <1563563060.2343.88.camel@impinj.com> <20190720195551.GB3271@piout.net>
In-Reply-To: <20190720195551.GB3271@piout.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3219f376-bec8-406b-0c59-08d71fcfc99f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3836;
x-ms-traffictypediagnostic: DB3PR0402MB3836:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB38367F0687430D231EE47424F5D20@DB3PR0402MB3836.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(189003)(199004)(74316002)(6506007)(55016002)(99286004)(86362001)(9686003)(76176011)(33656002)(7696005)(6306002)(2906002)(3846002)(81166006)(81156014)(8676002)(53936002)(66946007)(4326008)(6246003)(26005)(186003)(305945005)(6116002)(102836004)(25786009)(7736002)(52536014)(14444005)(6436002)(66556008)(76116006)(66066001)(476003)(486006)(54906003)(64756008)(229853002)(66476007)(256004)(66446008)(44832011)(11346002)(446003)(316002)(966005)(478600001)(8936002)(5660300002)(14454004)(71190400001)(110136005)(71200400001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3836;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KskRT+LfNF4NBwqwWrFsU4aVkIxiEEBnup5lAs3yJ2fS3B9mPaGFlqu6tPmM9NV6AmSJNuLaBc7bm2HvwR5J8cslRaBVHTEtghLP7BJyI3yx0REKs3BSVSvA3F+SnmS0Eii03SdBm0ZKAV9JM9Z8V+2VYMWAonwB3OfpLvsb4k9LVIiZSkEEiuudKkS31la4FXGJzHpjiwR4esh+tZLbhPRu+U7Z8zDXh4uWrAJ3oEJhDMoQdN8NCOV/IOVXYuRzA3mZk4/arZDK3b9mfkwkyopJwgKdTc3EiNrSp6lqJZUpZ4lXvdTayJM/PXvSOrFFu2fWcTWz4l4VWNwnmeHqN3t9kH2cZtZ3Z8fw9URIfEkmolAcn3JMO7fAZaIdEQJhXt0oDCkTEImFZnBy7dRWHsxucIXTR23qURAXxx1hQbI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3219f376-bec8-406b-0c59-08d71fcfc99f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 09:22:39.6410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k9QhFf45YZBbNaNbahGgCLUKyPjVqbyP4ACwFoaCISWN/Wc5fvYH9IfABhkJA0beYwSeTq9sPzvyO84DSiJnXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3836
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGksIEFsZXhhbmRyZQ0KDQo+IE9uIDE5LzA3LzIwMTkgMTk6MDQ6MjErMDAwMCwgVHJlbnQgUGll
cGhvIHdyb3RlOg0KPiA+IE9uIEZyaSwgMjAxOS0wNy0xOSBhdCAwMjo1NyArMDAwMCwgQW5zb24g
SHVhbmcgd3JvdGU6DQo+ID4gPg0KPiA+ID4gPiBJIGRvIHdvcnJ5IHRoYXQgaGFuZGxpbmcgdGhl
IGlycSBiZWZvcmUgdGhlIHJ0YyBkZXZpY2UgaXMNCj4gPiA+ID4gcmVnaXN0ZXJlZCBjb3VsZCBz
dGlsbCByZXN1bHQgaW4gYSBjcmFzaC4gIEZyb20gd2hhdCBJIHNhdywgdGhlDQo+ID4gPiA+IGly
cSBwYXRoIGluIHNudnMgb25seSB1c2VzIGRyaXZlciBzdGF0ZSBtZW1iZXJzIHRoYXQgYXJlIGZ1
bGx5DQo+ID4gPiA+IGluaXRpYWxpemVkIGZvciB0aGUgbW9zdCBwYXJ0LCBhbmQgdGhlIGFsbG9j
YXRlZCBidXQgdW5yZWdpc3RlcmVkDQo+ID4gPiA+IGRhdGEtPnJ0YyBpcyBvbmx5IHVzZWQgaW4g
b25lIGNhbGwgdG8gcnRjX3VwZGF0ZV9pcnEoKSwgd2hpY2ggYXBwZWFycyB0bw0KPiBiZSBvayB3
aXRoIHRoaXMuDQo+ID4gPiA+DQo+ID4gPiA+IEJ1dCBpdCBpcyBub3QgdGhhdCBoYXJkIHRvIGlt
YWdpbmUgdGhhdCBzb21ldGhpbmcgY291bGQgZ28gaW50bw0KPiA+ID4gPiB0aGUgcnRjIGNvcmUg
dGhhdCBhc3N1bWVzIGNhbGwgbGlrZSBydGNfdXBkYXRlX2lycSgpIGFyZSBvbmx5IG1hZGUgb24N
Cj4gcmVnaXN0ZXJlZCBkZXZpY2VzLg0KPiA+ID4gPg0KPiA+ID4gPiBJZiB0aGVyZSB3YXMgYSB3
YXkgdG8gZG8gaXQsIEkgdGhpbmsgYWxsb2NhdGluZyB0aGUgaXJxIGluIGENCj4gPiA+ID4gbWFz
a2VkIHN0YXRlIGFuZCB0aGVuIHVubWFza2luZyBpdCBhcyBwYXJ0IG9mIHRoZSBmaW5hbA0KPiA+
ID4gPiByZWdpc3RyYXRpb24gY2FsbCB0byBtYWtlIHRoZSBkZXZpY2UgZ28gbGl2ZSB3b3VsZCBi
ZSBhIHNhZmVyIGFuZCBtb3JlDQo+IGdlbmVyYWwgcGF0dGVybi4NCj4gPiA+DQo+ID4gPiBJdCBt
YWtlcyBzZW5zZSwgSSB0aGluayB3ZSBjYW4ganVzdCBtb3ZlIHRoZSBkZXZtX3JlcXVlc3RfaXJx
KCkgdG8NCj4gPiA+IGFmdGVyIHJ0Y19yZWdpc3Rlcl9kZXZpY2UoKSwgSXQgd2lsbCBtYWtlIHN1
cmUgZXZlcnl0aGluZyBpcyByZWFkeSBiZWZvcmUNCj4gSVJRIGlzIGVuYWJsZWQuIFdpbGwgc2Vu
ZCBvdXQgYSBWMiBwYXRjaC4NCj4gPg0KPiA+IFRoYXQgd2lsbCBtZWFuIHJlZ2lzdGVyaW5nIHRo
ZSBydGMsIHRoZW4gdW5yZWdpc3RlcmluZyBpdCBpZiB0aGUgaXJxDQo+ID4gcmVxdWVzdCBmYWls
cy4gIE1vcmUgb2YgYSBwYWluIHRvIHdyaXRlIHRoaXMgZmFpbHVyZSBwYXRoLg0KPiA+DQo+ID4g
QWxleGFuZHJlLCBpcyBpdCBwYXJ0IG9mIHJ0YyBjb3JlIGRlc2lnbiB0aGF0IHJ0Y191cGRhdGVf
aXJxKCkgbWlnaHQNCj4gPiBiZSBjYWxsZWQgb24gYSBydGMgZGV2aWNlIHRoYXQgaXMgcHJvcGVy
bHkgYWxsb2NhdGVkLCBidXQgbm90DQo+ID4gcmVnaXN0ZXJlZCB5ZXQ/DQo+IA0KPiBZZXMsIHRo
ZSBtYWluIHJlYXNvbiBvZiB0aGUgY2hhbmdlIG9mIEFQSSB3YXMgZXhhY3RseSB0byBoYW5kbGUg
dGhpcy4NCg0KV2hhdCBhYm91dCB0aGlzIHBhdGNoJ3Mgc3RhdHVzPyBTaG91bGQgd2UgY29udGlu
dWUgb3IgYW55IGNoYW5nZSBuZWVkZWQ/DQoNCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cGF0Y2gvMTEzMjQ4MS8NCg0KVGhhbmtzLA0KQW5zb24NCg0K
