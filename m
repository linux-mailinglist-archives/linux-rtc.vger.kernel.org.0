Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFF519E17D
	for <lists+linux-rtc@lfdr.de>; Tue, 27 Aug 2019 10:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731469AbfH0IMS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 27 Aug 2019 04:12:18 -0400
Received: from mail-eopbgr20054.outbound.protection.outlook.com ([40.107.2.54]:28775
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730285AbfH0IMS (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 27 Aug 2019 04:12:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLO0X5ryPLkudFuyQrDR/7Tb9JS/Jm4oLpnZhatDWJ/+N/axw3CP6KPp/ntDhMAqfbNLwdt2jQ8IrFP0DOhGvY9bOXJ4rx4q8M5WOlQnJ82z7aTOcT53vQjtQ0bgmkaVItjqBDjqLgDnTqvxbXVBt3o1Qy/Y+GnvNgzCnyCgo5Ui3w05AZiSDn4sWSE2o44AyhLPYUCzhDc3J4q75tDeSrzTWipdk5LMii3sr/F0pCn9utEyBu46W657G7YsHi+/mlfF5IwDzmQsQH8eLClrTBZjO9R1lCnmYjXFYU9zPxAWcDJHXfU6qhvGNLOqvsQ9cjU7gnFSPw3lpYCyP0w0NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2ARKlJkhbpcUc/LcscdFIYHYj0orvOhKJY4M1p/Hck=;
 b=doXVegem/mNNpm5sgU3Qz3zjemPCKbcFlnzf2F7nICpgVotH/DOaLkzWEjdk4p8YFBDsaermavs1rxf3pOUDqb92pmWNV5oU4zZQCtzseCh+7IJXv//FAox2QxQnqOWsiy8b6UmgTlNZuZ8deg8WMZDL/D+OkK0d2OPj26hcq4/FNgV3jDb6pg/bVO1gS1CcJzVLji8AgUM24dfNAST7yG1LyosrGA/9SrUbtPqU0zETwPb+GjIOZM/iV9GMBmAMYT0oVUpCpL8ztSwVGqphRMccXYH7aPV1n2Ux/89cnDiE0ifKngG3RUEUZC17mSvDR6FgyCRrbh1RtY/ajqTi8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2ARKlJkhbpcUc/LcscdFIYHYj0orvOhKJY4M1p/Hck=;
 b=ou24idicBedA7nTfpkSNAKEBOflCeuWq0yWz20BfPrTml4YfZ0f+ctOJro2yh3C/eFCbqZxwbA1AmOL62YppL4/B3ZwW3vTVpr7q7LMLUSblUqZiMCk7aMJZgjfD2YLUvmdnzZYJsG+uYkqFY6Eqx67LY5IbnXGiLnohLbuQQmk=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4153.eurprd04.prod.outlook.com (52.134.111.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Tue, 27 Aug 2019 08:12:14 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::3cd8:4bcf:8626:4254]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::3cd8:4bcf:8626:4254%3]) with mapi id 15.20.2199.021; Tue, 27 Aug 2019
 08:12:12 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Nandor Han <nandor.han@vaisala.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        Leo Li <leoyang.li@nxp.com>,
        "broonie@kernel.org" <broonie@kernel.org>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [v4] rtc: pcf85363/pcf85263: fix error that failed to
 run hwclock -w
Thread-Topic: [EXT] Re: [v4] rtc: pcf85363/pcf85263: fix error that failed to
 run hwclock -w
Thread-Index: AQHVXJKQHF/rfq3lnkKORRBaxuIvrKcOo8UAgAABInA=
Date:   Tue, 27 Aug 2019 08:12:12 +0000
Message-ID: <DB7PR04MB4490EEEEF3E813A1EC34D1C68FA00@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190827043735.31231-1-biwen.li@nxp.com>
 <2b49e282-fc03-ee59-2719-5a3c1ce573ce@vaisala.com>
In-Reply-To: <2b49e282-fc03-ee59-2719-5a3c1ce573ce@vaisala.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f994cc01-333a-4151-7ef2-08d72ac643f3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB4153;
x-ms-traffictypediagnostic: DB7PR04MB4153:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB415399811BB521400EA328048FA00@DB7PR04MB4153.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(199004)(189003)(53936002)(54906003)(110136005)(76176011)(44832011)(86362001)(14454004)(7696005)(4326008)(6506007)(25786009)(316002)(3846002)(2201001)(99286004)(66476007)(66946007)(64756008)(71190400001)(6116002)(76116006)(66446008)(66556008)(229853002)(478600001)(55016002)(6246003)(71200400001)(52536014)(305945005)(2906002)(33656002)(102836004)(6436002)(26005)(186003)(476003)(486006)(11346002)(7736002)(2501003)(14444005)(256004)(5660300002)(81156014)(81166006)(9686003)(8936002)(66066001)(8676002)(53546011)(446003)(74316002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4153;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: F1NDSbbe5sEOzL9NKeB4+DjmaVDNcxHBW5FmR6nz+gDkNB8ltPuppO3+t+QOIhqrC68ssQP9wsbRCJG9fnGtNvz3kShqAyum312Xnjd1vanogJzF+FrHUg8OuTjv7KuylIMqlNQJ5TlpGy5TRCZlJZ9+iTew4YY/LFsgtBLJlIOaMaYBkBzVTgM5hUM53VQPUeS2fJOSMVBRRVyin8uDpd6EbHHhZBlAizZlxD/NVAcsNNzzTjmFFrU8I4co7E4e2qns+zZpr1XlEqgpBOX920RwAsaE2YdoeYe0FC2qd6cCZds/iSV55lupH80kINM3cnovURqRm9RbzcBVP9swhGAA/7GlYj7Lies/7DqFHN5UynQzCIzqMq6+TbS6UpzWErl7Mqn87GbtAzpp3AR1hVbX22Zxkirw9LigSzTscmk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f994cc01-333a-4151-7ef2-08d72ac643f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 08:12:12.6667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7ScnTmrSYeJNO1LcGyQ8xQIxq2UCW5AZ13YLNl5YTrJf+B2zfH0656IOvXBGXzpeIysq4EZ7qmJ5V+0ldTPL9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4153
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PiANCj4gT24gOC8yNy8xOSA3OjM3IEFNLCBCaXdlbiBMaSB3cm90ZToNCj4gPiAgIC0gSW4gZHJp
dmVycy9ydGMvcnRjLXBjZjg1MzYzLmMsIENUUkxfU1RPUF9FTiBpcyAweDJlLCBidXQgRFRfMTAw
VEhTDQo+ID4gICAgICAgIGlzIDAsIG1heF9yZWdpdGVyIGlzIDB4MmYsIHRoZW4gcmVnIHdpbGwg
YmUgZXF1YWwgdG8gMHgzMCwNCj4gPiAgICAgICAgJzB4MzAgPCAweDJmJyBpcyBmYWxzZSxzbyBy
ZWdtYXBfd3JpdGVhYmxlIHdpbGwgcmV0dXJuIGZhbHNlLg0KPiA+DQo+ID4gICAgICAtIFRoZSBw
Y2Y4NTM2My9wY2Y4NTI2MyBoYXMgdGhlIGNhcGFiaWxpdHkgb2YgYWRkcmVzcyB3cmFwcGluZw0K
PiA+ICAgICAgICB3aGljaCBtZWFucyBpZiB5b3UgYWNjZXNzIGEgY29udGludW91cyBhZGRyZXNz
IHJhbmdlIGFjcm9zcyBhDQo+ID4gICAgICAgIGNlcnRhaW4gYm91bmRhcnkobWF4X3JlZ2lzdGVy
IG9mIHN0cnVjdCByZWdtYXBfY29uZmlnKSB0aGUNCj4gPiAgICAgICAgaGFyZHdhcmUgYWN0dWFs
bHkgd3JhcHMgdGhlIGFjY2VzcyB0byBhIGxvd2VyIGFkZHJlc3MuIEJ1dCB0aGUNCj4gPiAgICAg
ICAgYWRkcmVzcyB2aW9sYXRpb24gY2hlY2sgb2YgcmVnbWFwIHJlamVjdHMgc3VjaCBhY2Nlc3Mu
DQo+IA0KPiBuaXRwaWNrOiBUaGlzIDIgcGFyYWdyYXBocyBjb3VsZCBiZSBjb21iaW5lZCB0byBj
bGVhciB1cCB0aGUgaXNzdWU6DQo+IA0KPiBgDQo+IFRoZSBwY2Y4NTM2My9wY2Y4NTI2MyBoYXMg
dGhlIGNhcGFiaWxpdHkgb2YgYWRkcmVzcyB3cmFwcGluZyB3aGljaCBtZWFucyBpZg0KPiB5b3Ug
YWNjZXNzIGFuIGFkZHJlc3Mgb3V0c2lkZSB0aGUgYWxsb3dlZCByYW5nZQ0KPiAoMHgwMC0weDJm
KSB0aGUgaGFyZHdhcmUgYWN0dWFsbHkgd3JhcHMgdGhlIGFjY2VzcyB0byBhIGxvd2VyIGFkZHJl
c3MuDQo+IFRoZSBydGMtcGY4NTM2MyBkcml2ZXIgd2lsbCB1c2UgdGhpcyBmZWF0dXJlIHRvIGNv
bmZpZ3VyZSB0aGUgdGltZSBhbmQgZXhlY3V0ZSAyDQo+IGFjdGlvbnMgaW4gdGhlIHNhbWUgaTJj
IHdyaXRlIG9wZXJhdGlvbiAoc3RvcHBpbmcgdGhlIGNsb2NrIGFuZCBjb25maWd1cmUgdGhlDQo+
IHRpbWUpLiBIb3dldmVyIHRoZSBkcml2ZXIgaGFzIGFsc28gY29uZmlndXJlZCB0aGUgYHJlZ21h
cCBtYXhyZWdpc3RlcmANCj4gcHJvdGVjdGlvbiBtZWNoYW5pc20gdGhhdCB3aWxsIGJsb2NrIGFj
Y2Vzc2luZyBhZGRyZXNzZXMgb3V0c2lkZSB2YWxpZCByYW5nZQ0KPiAoMHgwMC0weDJmKS4NCj4g
YA0KPiANCj4gbml0cGljazogSSB3b3VsZCBhbHNvIHVzZSBzZXBhcmF0ZSBidWZmZXJzIGZvciB0
aGlzIGFjdGlvbnMuIFVwIHRvIHlvdSA6KQ0KPiANCj4gT3RoZXJ3aXNlIExHVE0gKzENClRoYW5r
cywgaXQncyBhIGJlYXV0aWZ1bCBleHBsYW5hdGlvbi4NCj4gDQo+IE5hbmRvcg0K
