Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 655CF9C7FE
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2019 05:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729566AbfHZDht (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 25 Aug 2019 23:37:49 -0400
Received: from mail-eopbgr50082.outbound.protection.outlook.com ([40.107.5.82]:22339
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726215AbfHZDht (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 25 Aug 2019 23:37:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMNwNFakIst8CqKgmF0vQJqsHN+hSzku5btSwSkdtxqOHmSuyekY56MO4IgUDpanrbqBboa3LbYrDSjWd64RhoyqbPxpIShMSJmkAtwjEDkA6xbwmSZYrLK6B6ku5uYlxyPUKT4vWPD5SDicOLYqVbHgxM/KFUlTLRz9yIgOytfQ9551MHRXI5KykYVyofcT9753o4vahdTFx+JsfF4Y464tEkIx8we4ctkmdUrDFr5F+UozHqKwLHUihX+iW+TaK84Ir+m29+5aS1If0Oy3AsjUg5+ZGRHBzBaG8zecQ1AM6SUitT7LNKMu8/ty7ORFU700rvsjBif6mOfaDwBung==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dd4/O9ORxgwd/betCcSZypsrMzzPltx6jwPJWNYx4bw=;
 b=durZWxR8y3oOToPElJzsw0NyZFX5p3sB0Mpfu7lBIJzloDUpGHP5ox8SDFj0eJY9dzFH2iaQnvIbecMuGxSkRB6xxByp+zn3pqcpBRya+kaJe+kyAY7GmC8lx4x2kApsKY05XJRRPwtpjxgzVZutXL3/j6H/UZJPN7jnKDlMhhzmjwKwYV3ug5xwd5GSSS801pZU8pdl1MsMVtJ5gIKrNvCwhM3MW/zOgYHIsGeZqJ3lRMAiGdgi/moWe+4NVzceQz72qyhllKedfAQ6Rk1so7yo8KG27OB7Yvpr9ev+tdnPBbjfMCre1ibc1PuFYRtCrGeCXaOQ3fsmFhYxlvKLvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dd4/O9ORxgwd/betCcSZypsrMzzPltx6jwPJWNYx4bw=;
 b=qYQydgeNppUoleXcrwnledLPDagxEBlYyUXoe7e/8rlSTJEBhqZdlN398hlMyxPPgJXy38FErYhbXCIgy7oHo0u9yodcwu2rdVJr8cBuaEyoYwkWMSO6E8veIbBEDjOqOnc0Xul9Nc5oWrsQlYVbU8qhBQyhIrabY72td/bzuC8=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4313.eurprd04.prod.outlook.com (52.135.131.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 03:37:43 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::3cd8:4bcf:8626:4254]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::3cd8:4bcf:8626:4254%3]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 03:37:43 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Trent Piepho <tpiepho@impinj.com>, Leo Li <leoyang.li@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [EXT] Re: [1/3] rtc/fsl: support flextimer for lx2160a
Thread-Topic: [EXT] Re: [1/3] rtc/fsl: support flextimer for lx2160a
Thread-Index: AQHVWZqkS7VqFcEexkmgcQwv8J5Ri6cI9DMAgAPWNrA=
Date:   Mon, 26 Aug 2019 03:37:43 +0000
Message-ID: <DB7PR04MB4490B7AD75C6EE49F5208F738FA10@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190823095740.12280-1-biwen.li@nxp.com>
 <1566579388.5029.8.camel@impinj.com>
In-Reply-To: <1566579388.5029.8.camel@impinj.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 455464d6-d1e7-412a-31de-08d729d6c0f0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB4313;
x-ms-traffictypediagnostic: DB7PR04MB4313:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB43134C121C11AA673A65B3008FA10@DB7PR04MB4313.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(199004)(189003)(102836004)(186003)(256004)(52536014)(81156014)(81166006)(6436002)(8676002)(8936002)(66066001)(26005)(54906003)(76176011)(33656002)(2201001)(7696005)(316002)(7736002)(99286004)(229853002)(305945005)(74316002)(110136005)(86362001)(486006)(25786009)(71200400001)(71190400001)(446003)(11346002)(66476007)(76116006)(66946007)(66446008)(64756008)(66556008)(3846002)(476003)(2501003)(2906002)(44832011)(478600001)(9686003)(55016002)(4326008)(6116002)(53936002)(5660300002)(14454004)(6506007)(6246003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4313;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3LagQpKrbLv4Zn/XZk6qfyM5a1hovwtD2MrBP4AdQV22ERquvhRPz8pl7Yw1WfHhkX9KCb/C2/aQ6NLxmPhXCgyt+5s7wQda2Q4KXMeDSjBTm09P6GyrD9Kaetep1zVtKNXGemuFKT48OEEZnyhI5VuZQLoJa2j+sORQgCyJGqXWjyXs0ukujpzVx2SajnAYb6+PvpKit6BIp904XMFMk/rRg1/Nr4M63mH2cI4lCrO2lrPzZKXLtKEx18ucJJxvDwpJoDpARtGcNU9FE4w1jsA5P8r8Mof6nB3Pe/ELJkmHmqqAsGM+SbtXlVgCtmF9txjEu9WoZmV+RR8BEbgUwEF1YfFxYAoVcfz/jn8KkFXnq/bOajS3eEk52dMA5hKwhNddJY4Cwh5EMyeGxlSUOswICP7gWj1rjgyJ9gorD2U=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 455464d6-d1e7-412a-31de-08d729d6c0f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 03:37:43.2441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /0+03KxBMGDBIY5HkVpm9C9JhgYsJO4QD8l8LrkHGmCen6nWWtri6XsfBPmyAhXfs4EA2u/wP0vzPgqdbw105g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4313
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PiANCj4gT24gRnJpLCAyMDE5LTA4LTIzIGF0IDE3OjU3ICswODAwLCBCaXdlbiBMaSB3cm90ZToN
Cj4gPiBUaGUgcGF0Y2ggc3VwcG9ydHMgZmxleHRpbWVyIGZvciBseDIxNjBhDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBCaXdlbiBMaSA8Yml3ZW4ubGlAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAg
ZHJpdmVycy9ydGMvcnRjLWZzbC1mdG0tYWxhcm0uYyB8IDEgKw0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMt
ZnNsLWZ0bS1hbGFybS5jIGIvZHJpdmVycy9ydGMvcnRjLWZzbC0NCj4gPiBmdG0tYWxhcm0uYyBp
bmRleCA0ZjcyNTljMmQ2YTMuLjJiODE1MjVmNmRiOCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L3J0Yy9ydGMtZnNsLWZ0bS1hbGFybS5jDQo+ID4gKysrIGIvZHJpdmVycy9ydGMvcnRjLWZzbC1m
dG0tYWxhcm0uYw0KPiA+IEBAIC0zMTMsNiArMzEzLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgZnRtX3J0Y19tYXRjaFtdID0NCj4gPiB7DQo+ID4gICAgICAgeyAuY29tcGF0
aWJsZSA9ICJmc2wsbHMxMDg4YS1mdG0tYWxhcm0iLCB9LA0KPiA+ICAgICAgIHsgLmNvbXBhdGli
bGUgPSAiZnNsLGxzMjA4eGEtZnRtLWFsYXJtIiwgfSwNCj4gPiAgICAgICB7IC5jb21wYXRpYmxl
ID0gImZzbCxsczEwMjhhLWZ0bS1hbGFybSIsIH0sDQo+ID4gKyAgICAgeyAuY29tcGF0aWJsZSA9
ICJmc2wsbHgyMTYwYS1mdG0tYWxhcm0iLCB9LA0KPiA+ICAgICAgIHsgfSwNCj4gPiAgfTsNCj4g
Pg0KPiANCj4gU2luY2UgdGhlcmUncyBubyBkYXRhIGFzc29jaWF0ZWQgd2l0aCBlYWNoIGNvbXBh
dGlibGUsIGl0IGRvZXNuJ3Qgc2VlbSBsaWtlDQo+IHRoZXJlJ3MgYW55IG5lZWQgdG8gYWRkIGEg
bmV3IG9uZS4NCj4gDQo+IFdoYXQncyBub3JtYWxseSBkb25lIGlzIGFkZCB0d28gY29tcGF0aWJs
ZXMgaW4gdGhlIGR0cywgdGhlIGJhc2UgdmVyc2lvbiBhbmQNCj4gdGhlIHNwZWNpZmljIHZlcnNp
b24sIGUuZy46DQo+IA0KPiArICAgICAgICAgICAgICAgcmNwbTogcmNwbUAxZTM0MDQwIHsNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmc2wsbHgyMTYwYS1yY3BtIiwN
Cj4gKyAiZnNsLHFvcmlxLWNwbS0yLjErIjsNCj4gDQo+IE9yIGluIHRoaXMgY2FzZSwgY29tcGF0
aWJsZSA9ICJmc2wsbHgyMTYwYS1mdG0tYWxhcm0iLCAiZnNsLGxzMTA4OGEtZnRtLWFsYXJtIjsN
Cj4gDQo+IFRoZW4gdGhlcmUncyBubyBuZWVkIHRvIGFkZCB0byB0aGUgZHJpdmVyIGxpc3QuDQpZ
ZXMsIGl0IHdpbGwgYmUgd29yay4gQnV0IGl0IHdpbGwgYmUgY29uZnVzaW5nLiBJcyBsczEwODhh
IHNhbWUgd2l0aCBseDIxNjBhPyBOby4NCg==
