Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11B7D6D936
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Jul 2019 04:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbfGSC50 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 18 Jul 2019 22:57:26 -0400
Received: from mail-eopbgr10077.outbound.protection.outlook.com ([40.107.1.77]:55270
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726015AbfGSC50 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 18 Jul 2019 22:57:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVxBa2WajzHcix4QotDaEkFj9JRDR/kkTqIkvilgZB9zNusHYdvHPMbSa7dCtJDLoBZb76IJhgQD9D3o+yg3u4yNJIYFfSW/Xdfb3byQ/itM07l825USU3frnviH3R3Rfq0ENzLgz6AaUsKRZuvfWMV64a7FEDJ5+Mvn7uptxolJ/bHTN+2QStfmIbUmR2o4jVITjf5A1GGQOIXcaFs+7Yl194BDob9sQj9//85wdlJKMWR63tD6qVNkt7fOg/JMFuBqa2Sw4g6Ffph7qTFXHr4AeIQxUSwCB3Jqk7F+fsJDh2/rIcqFKpZuE614v2h2bQS1ZLrwoolfXoyVFvfSbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xg25Odx5olzbIu9bBPs86cWuciJWim95pBDoddpkFa0=;
 b=MPYzTmvUcFQ4VvK6c9Z9R4Qr03HVgAhD8GkyR1P2Vsr9j0Cnl6MB/hlHMZYgijCm1xIxZDEw7DDfTObhUrgUt6vjrZqd5N5xiguMYklrWHlkfjuxwMC+jVyTnmYHc8LQfvH8GA/oiIv3sfqJyW3ZQRlisPilWIGXbna+OatVbRR9R+Qik+n8Z9twaUyoyoEM4kGeAkxR9A7QxYL0bnInMqyQqYPolBrdKy6+6Z61YvGRMj1gRFEbz+rig8dgplsiUCnC9mKDDegmLIK9XtBK1a5CMl9/NxHumGUi4Dn0xxrfgnM7WHd77VZpvtzo07p+A0hQ7foxzB5WfdHOSnsdXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xg25Odx5olzbIu9bBPs86cWuciJWim95pBDoddpkFa0=;
 b=QNeDwuAt4JHm1eqPG3La4923u2HNPpDuz73WUJ4qf9tUdTC2JcR1XqhBEZBRsb++MNU/mf6CurNMOX7SNpgEiRij+D0yOd171al5YqVtv20Eau2SsD5qfBFHPfMLOEU73C8Y4id8MaRPfIhK0l8ZdJqkkgUAWlQuidsQbCc4Kkk=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3740.eurprd04.prod.outlook.com (52.134.71.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Fri, 19 Jul 2019 02:57:20 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::7cdf:bddc:212c:f77e]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::7cdf:bddc:212c:f77e%4]) with mapi id 15.20.2094.013; Fri, 19 Jul 2019
 02:57:20 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Trent Piepho <tpiepho@impinj.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        Aisheng Dong <aisheng.dong@nxp.com>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] rtc: snvs: fix possible race condition
Thread-Topic: [PATCH] rtc: snvs: fix possible race condition
Thread-Index: AQHVO6gHgDF/BlJMPUyX9VGe8rSFO6bOpJgAgAAyYBCAAN3WgIAA4I4AgACuAJA=
Date:   Fri, 19 Jul 2019 02:57:20 +0000
Message-ID: <DB3PR0402MB3916053E6344520416BC976BF5CB0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190716071858.36750-1-Anson.Huang@nxp.com>
         <AM0PR04MB421167283C950557E231181480C90@AM0PR04MB4211.eurprd04.prod.outlook.com>
         <DB3PR0402MB39164D0022E25706D2B871C7F5C90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
         <AM0PR04MB421114F025F27AF2BC5FA21980C80@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <1563467526.2343.80.camel@impinj.com>
In-Reply-To: <1563467526.2343.80.camel@impinj.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5736e7af-6646-4041-89e5-08d70bf4d144
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3740;
x-ms-traffictypediagnostic: DB3PR0402MB3740:
x-microsoft-antispam-prvs: <DB3PR0402MB374070AB378C9917D6000C96F5CB0@DB3PR0402MB3740.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(199004)(189003)(14454004)(229853002)(14444005)(256004)(66556008)(66476007)(64756008)(52536014)(66446008)(7736002)(9686003)(66946007)(44832011)(2201001)(99286004)(486006)(71190400001)(71200400001)(316002)(76116006)(6636002)(86362001)(110136005)(5660300002)(66066001)(26005)(6436002)(25786009)(2501003)(186003)(102836004)(7696005)(68736007)(4326008)(478600001)(76176011)(3846002)(2906002)(6506007)(53936002)(305945005)(33656002)(6116002)(55016002)(8936002)(11346002)(8676002)(81166006)(81156014)(476003)(74316002)(446003)(6246003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3740;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ume8/c/ZmWurLwt9hXyns0aCJ/UJ/jfyu3w9ncMvNCWy3ijPNETVC8Ps37oHeHE+Qnaz+Z7HANKyp6FaBiZqQ1WmDPAZcRtYGyAhLgPMsVO+EG6833sQtixQs1PqG41UJc/S4TlZOsHAM1eTYiGWs0YKopT+FWi8fHGHylbwDO19AdxPh/sCb0cwJiONkpxTWyGHmBlaxeCAUlVfYO+rsFhdldmQAwe3X+vqnVbSE4KaZ7+nUvpC74WEFuvkiZ3cvACjqQ3I4/3MABszQVQuneQ8J6St5VrcDjKwZWnBO3RhU7c+TLesqFS0NLazIjyBKBTX/dVBYITuDtxtTbHSB8CIxqorhX3HrHA3Oxvigs2eegxWWGV0d+0UQS1PKruRGOga0JQlzMvjJz+malDNQHse36E2ZPONBWMDfQ0IdG8=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5736e7af-6646-4041-89e5-08d70bf4d144
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 02:57:20.5780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: anson.huang@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3740
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGksIFRyZW50DQoNCj4gT24gVGh1LCAyMDE5LTA3LTE4IGF0IDAzOjA4ICswMDAwLCBBaXNoZW5n
IERvbmcgd3JvdGU6DQo+ID4gPiBGcm9tOiBBbnNvbiBIdWFuZw0KPiA+ID4gU2VudDogV2VkbmVz
ZGF5LCBKdWx5IDE3LCAyMDE5IDk6NTggUE0+IEhpLCBBaXNoZW5nDQo+ID4gPg0KPiA+ID4gPiA+
IEZyb206IEFuc29uLkh1YW5nQG54cC5jb20gPEFuc29uLkh1YW5nQG54cC5jb20+DQo+ID4gPiA+
ID4gU2VudDogVHVlc2RheSwgSnVseSAxNiwgMjAxOSAzOjE5IFBNDQo+ID4gPiA+ID4NCj4gPiA+
ID4gPiBUaGUgUlRDIElSUSBpcyByZXF1ZXN0ZWQgYmVmb3JlIHRoZSBzdHJ1Y3QgcnRjX2Rldmlj
ZSBpcw0KPiA+ID4gPiA+IGFsbG9jYXRlZCwgdGhpcyBtYXkgbGVhZCB0byBhIE5VTEwgcG9pbnRl
ciBkZXJlZmVyZW5jZSBpbiBJUlENCj4gPiA+ID4gPiBoYW5kbGVyLg0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4gVG8gZml4IHRoaXMgaXNzdWUsIGFsbG9jYXRpbmcgdGhlIHJ0Y19kZXZpY2Ugc3RydWN0
IGJlZm9yZQ0KPiA+ID4gPiA+IHJlcXVlc3RpbmcgdGhlIFJUQyBJUlEgdXNpbmcgZGV2bV9ydGNf
YWxsb2NhdGVfZGV2aWNlLCBhbmQgdXNlDQo+ID4gPiA+ID4gcnRjX3JlZ2lzdGVyX2RldmljZSB0
byByZWdpc3RlciB0aGUgUlRDIGRldmljZS4NCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBJ
IHNhdyBvdGhlciBydGMgZHJpdmVycyBkaWQgdGhlIHNhbWUgd2F5IGFzIHVzLCBzbyB0aGlzIGxv
b2tzIGxpa2UNCj4gPiA+ID4gYSBjb21tb24gcHJvYmxlbS4NCj4gPiA+ID4gTXkgcXVlc3Rpb24g
aXMgaWYgd2UgY2FuIGNsZWFyIGludGVycnVwdCBzdGF0dXMgYmVmb3JlIHJlZ2lzdGVyIHRvDQo+
ID4gPiA+IGF2b2lkIHRoaXMgaXNzdWUgYXMgb3RoZXIgcnRjIGRyaXZlcnM/DQo+ID4gPg0KPiA+
ID4gSSB0aGluayB3ZSBjYW4gTk9UIHByZWRpY3Qgd2hlbiB0aGUgSVJRIHdpbGwgYmUgcGVuZGlu
ZywgSVJRIGNvdWxkDQo+ID4gPiBhcnJpdmUgYXQgYW55IHRpbWUsIHRoZSBtb3N0IHNhZmUgd2F5
IGlzIHRvIHByZXBhcmUgZXZlcnl0aGluZw0KPiA+ID4gYmVmb3JlIHJlcXVlc3RpbmcvZW5hYmxp
bmcgSVJRLg0KPiA+ID4gVGhlcmUgaXMgYWxzbyBwYXRjaCB0byBmaXggc2ltaWxhciBpc3N1ZToN
Cj4gDQo+IEkgdGhpbmsgb25lIGNvdWxkIGF0dGVtcHQgdG8gZGlzYWJsZSBhbGwgaXJxIHNvdXJj
ZXMgaW4gdGhlIGRldmljZSB2aWEgaXRzDQo+IHJlZ2lzdGVyIHNwYWNlLCB0aGVuIGVuYWJsZSB0
aGUgaW50ZXJydXB0LiAgQnV0IHRoaXMgc2VlbXMgbW9yZSBzcGVjaWZpYyB0bw0KPiBlYWNoIGRl
dmljZSB0aGFuIGNoYW5naW5nIHRoZSBwYXR0ZXJuIG9mIGRldmljZSByZWdpc3RyYXRpb24sIHNv
IElNSE8sIGl0J3MNCj4gbm90IHJlYWxseSBiZXR0ZXIuDQo+IA0KPiBJIGRvIHdvcnJ5IHRoYXQg
aGFuZGxpbmcgdGhlIGlycSBiZWZvcmUgdGhlIHJ0YyBkZXZpY2UgaXMgcmVnaXN0ZXJlZCBjb3Vs
ZCBzdGlsbA0KPiByZXN1bHQgaW4gYSBjcmFzaC4gIEZyb20gd2hhdCBJIHNhdywgdGhlIGlycSBw
YXRoIGluIHNudnMgb25seSB1c2VzIGRyaXZlciBzdGF0ZQ0KPiBtZW1iZXJzIHRoYXQgYXJlIGZ1
bGx5IGluaXRpYWxpemVkIGZvciB0aGUgbW9zdCBwYXJ0LCBhbmQgdGhlIGFsbG9jYXRlZCBidXQN
Cj4gdW5yZWdpc3RlcmVkIGRhdGEtPnJ0YyBpcyBvbmx5IHVzZWQgaW4gb25lIGNhbGwgdG8gcnRj
X3VwZGF0ZV9pcnEoKSwgd2hpY2gNCj4gYXBwZWFycyB0byBiZSBvayB3aXRoIHRoaXMuDQo+IA0K
PiBCdXQgaXQgaXMgbm90IHRoYXQgaGFyZCB0byBpbWFnaW5lIHRoYXQgc29tZXRoaW5nIGNvdWxk
IGdvIGludG8gdGhlIHJ0YyBjb3JlDQo+IHRoYXQgYXNzdW1lcyBjYWxsIGxpa2UgcnRjX3VwZGF0
ZV9pcnEoKSBhcmUgb25seSBtYWRlIG9uIHJlZ2lzdGVyZWQgZGV2aWNlcy4NCj4gDQo+IElmIHRo
ZXJlIHdhcyBhIHdheSB0byBkbyBpdCwgSSB0aGluayBhbGxvY2F0aW5nIHRoZSBpcnEgaW4gYSBt
YXNrZWQgc3RhdGUgYW5kDQo+IHRoZW4gdW5tYXNraW5nIGl0IGFzIHBhcnQgb2YgdGhlIGZpbmFs
IHJlZ2lzdHJhdGlvbiBjYWxsIHRvIG1ha2UgdGhlIGRldmljZSBnbw0KPiBsaXZlIHdvdWxkIGJl
IGEgc2FmZXIgYW5kIG1vcmUgZ2VuZXJhbCBwYXR0ZXJuLg0KDQpJdCBtYWtlcyBzZW5zZSwgSSB0
aGluayB3ZSBjYW4ganVzdCBtb3ZlIHRoZSBkZXZtX3JlcXVlc3RfaXJxKCkgdG8gYWZ0ZXIgcnRj
X3JlZ2lzdGVyX2RldmljZSgpLA0KSXQgd2lsbCBtYWtlIHN1cmUgZXZlcnl0aGluZyBpcyByZWFk
eSBiZWZvcmUgSVJRIGlzIGVuYWJsZWQuIFdpbGwgc2VuZCBvdXQgYSBWMiBwYXRjaC4gDQoNClRo
YW5rcywNCkFuc29uDQoNCg==
