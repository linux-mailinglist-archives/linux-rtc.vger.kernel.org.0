Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BED19C864
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2019 06:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729707AbfHZE3S (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 26 Aug 2019 00:29:18 -0400
Received: from mail-eopbgr140052.outbound.protection.outlook.com ([40.107.14.52]:52899
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725270AbfHZE3R (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 26 Aug 2019 00:29:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pe1QXMQabT/quTwcLrHR02LGHa3zj+TDxtzNcMQ9/dsnQB80EFbWI45IdS3be3bk2Dq7/od1e/S8VJL617h/DcwSuRD6YZE9nCT2cb3UYjCO7Frcq3CNcH1oQ6o4YwWdiuz1fBaTZZB2Q/8zLTYiEF4ZgErf41rz7hzlD2BeYlBo6j7vsENkMOxeVuYZ8m8wwXtmACzEQeHBCr6+Jb8Rvpx129qinzjHCr0cGz7beSUVMS3L1SYea14eKnlToAvA6BB1F7AKYUntalxVH/+r0DBSBCzz/tiOc/neDEYHyVKP9Mam8efXett9eJbLjKcZ7GgUAgZKoApVfHt0W3ua3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unhZxP3dMFJ1p0ucN361bbA9dxauvkBU3W8IKR3+kGM=;
 b=jqIUeYD43dRgYcsUe8ehg9YBNvCtI+YqAq34JVGXAr/Cuz7fZ7651QXVhWbO/PQ2/CF8c5Ho0y96GOXq9ScfpHpt4IImHD8CjFtVdKhGFrLeedNl/5OYMliVk4VMBuh2F77G6XZiykI3qtbz69Ak1GChBNgZ262yyA21dhjTnb5gNFPU7vxjoQ03vNuXgGb3kIa/U1/vb+m2VjRBmGr/JHSm4+KjYt1uskgXPNH/DVg5tRqlxDW+U+QryqrnSSCETdKLj4bmiuT9R5d1Y350wOtaIhCdyFNlPyt64RrUGIaTpquIOu8u7VefGIb3uBRYrgkB9c3TH9YMDRB/o9OhVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unhZxP3dMFJ1p0ucN361bbA9dxauvkBU3W8IKR3+kGM=;
 b=Qb0T8Q8jP8kyxOCdfTV6siNOU9++rxyWV2uQ8A8cYN/jx+ihX0y4L/BeJEDhd2k5z3c95KWwdFB6IJWAL/GvJeSkVSqSS9/Zq30ei1z0x0QVyBH1xBgSNFDeuSxTMDay+h5aZbzpFKd+Nk3gPkcw4PKkH9nCO4WqzMTekeWSJd4=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4908.eurprd04.prod.outlook.com (20.176.234.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Mon, 26 Aug 2019 04:29:13 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::3cd8:4bcf:8626:4254]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::3cd8:4bcf:8626:4254%3]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 04:29:13 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Nandor Han <nandor.han@vaisala.com>, Leo Li <leoyang.li@nxp.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Brown <broonie@kernel.org>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [v2] rtc: pcf85363/pcf85263: fix error that failed to
 run hwclock -w
Thread-Topic: [EXT] Re: [v2] rtc: pcf85363/pcf85263: fix error that failed to
 run hwclock -w
Thread-Index: AQHVU944/chRI20GGkSPTXSrUh+lT6b9aqqAgACCWYCAAAqBgIAANb+AgAb78oCAB7jGEA==
Date:   Mon, 26 Aug 2019 04:29:13 +0000
Message-ID: <DB7PR04MB4490614205732E4508B8A8B38FA10@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190816024636.34738-1-biwen.li@nxp.com>
 <20190816080417.GB3545@piout.net>
 <CADRPPNRkqbWzGEvUJyi0Qff3oS6biO0v7BTrK1Jiz9AMnOYF=Q@mail.gmail.com>
 <20190816162825.GE3545@piout.net>
 <CADRPPNQwcGrVXLm8eHbXKmyecMhT6Mt9rNGnspJA1+MnV4K8oQ@mail.gmail.com>
 <ff198737-acb5-7186-7e14-a1e1cdc0f72c@vaisala.com>
In-Reply-To: <ff198737-acb5-7186-7e14-a1e1cdc0f72c@vaisala.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bff9d7ed-bfe1-435c-746f-08d729ddf2b3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB4908;
x-ms-traffictypediagnostic: DB7PR04MB4908:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4908960215A0CEA884409D768FA10@DB7PR04MB4908.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(199004)(189003)(6436002)(110136005)(71190400001)(6246003)(76116006)(8936002)(305945005)(74316002)(7736002)(64756008)(66066001)(66446008)(66556008)(71200400001)(5660300002)(6306002)(316002)(66476007)(7696005)(76176011)(229853002)(256004)(14444005)(86362001)(53936002)(44832011)(4326008)(55016002)(14454004)(33656002)(66946007)(54906003)(81166006)(8676002)(81156014)(9686003)(186003)(26005)(476003)(6116002)(966005)(99286004)(486006)(11346002)(446003)(478600001)(2906002)(6506007)(102836004)(3846002)(52536014)(25786009)(45080400002)(53546011);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4908;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: R6ymDz1nOJzVbYr5ZYmpFG2b7U6K47OHg2L6yrdxtIEG7DraVfjgd5o47FrKQNqXt9V91IViQuh9FhxVU7Hl01pQrQAaYwo5xph6qyZBSKjaiC1mSWNxLXOaQHw1pli86vhWS9e/rf/OrHKkZbc1sVYaQpcOmbp3tJHwWxE331LVn3ob2RoTZlc+9HjgRpv4vWXTC8BLg9oj5O+35ySZiSo9R45XLFPlrEqHvjTxKWf7QCAG5PalwMrMz5vdDPneCk35WVKwtv+uhm9xUvxm4PybzT+QncqakPFYvtaWLGvXJRjXfYs5X8x8t9X3/2jy45whV7R56Y/CJxrphYlzgIICKK6kAg6fNp21ut/Ia5XXQ0E2mucfQWaThQO6cT9QfhF74Mi/YXWI3aS6RYUc6A7fjzHLlWwYLMMWn6zlFeU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bff9d7ed-bfe1-435c-746f-08d729ddf2b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 04:29:13.0883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BImAJl83jcq+CqzXgXjmDTFuvPalnES52nJ7oAwLkg0kNCQOf0FqE4eWxaFbHB8M1h+S/BrUuYPXykg04+4w2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4908
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PiANCj4gT24gOC8xNi8xOSAxMDo0MCBQTSwgTGkgWWFuZyB3cm90ZToNCj4gPiBPbiBGcmksIEF1
ZyAxNiwgMjAxOSBhdCAxMTozMCBBTSBBbGV4YW5kcmUgQmVsbG9uaQ0KPiA+IDxhbGV4YW5kcmUu
YmVsbG9uaUBib290bGluLmNvbT4gd3JvdGU6DQo+ID4+DQo+ID4+IE9uIDE2LzA4LzIwMTkgMTA6
NTA6NDktMDUwMCwgTGkgWWFuZyB3cm90ZToNCj4gPj4+IE9uIEZyaSwgQXVnIDE2LCAyMDE5IGF0
IDM6MDUgQU0gQWxleGFuZHJlIEJlbGxvbmkNCj4gPj4+IDxhbGV4YW5kcmUuYmVsbG9uaUBib290
bGluLmNvbT4gd3JvdGU6DQo+ID4+Pj4NCj4gPj4+PiBPbiAxNi8wOC8yMDE5IDEwOjQ2OjM2KzA4
MDAsIEJpd2VuIExpIHdyb3RlOg0KPiA+Pj4+PiBJc3N1ZToNCj4gPj4+Pj4gICAgICAtICMgaHdj
bG9jayAtdw0KPiA+Pj4+PiAgICAgICAgaHdjbG9jazogUlRDX1NFVF9USU1FOiBJbnZhbGlkIGFy
Z3VtZW50DQo+ID4+Pj4+DQo+ID4+Pj4+IFdoeToNCj4gPj4+Pj4gICAgICAtIFJlbGF0aXZlIHBh
dGNoOg0KPiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91
cmw9aHR0cHMlM0ElMkYlMkZsa21sLm9yZw0KPiAlMkZsa21sJTJGMjAxOSUyRjQlMkYzJTJGNTUm
YW1wO2RhdGE9MDIlN0MwMSU3Q2Jpd2VuLmxpJTQwbnhwLg0KPiBjb20lN0NmZjhjZWJjM2YxMDM0
YWUzZmE5NjA4ZDcyNWZmOWU1ZSU3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5DQo+IGM1YzMwMTYz
NSU3QzAlN0MwJTdDNjM3MDE5NjUyMTExOTIzNzM2JmFtcDtzZGF0YT1zcFk2ZTIyWU9rT0YNCj4g
MyUyQkY3Y3JTTTBNNnhQbU9oZ1VMRHFNWkxRdyUyQkFtZEklM0QmYW1wO3Jlc2VydmVkPTAgLCB0
aGlzDQo+IHBhdGNoDQo+ID4+Pj4+ICAgICAgICB3aWxsIGFsd2F5cyBjaGVjayBmb3IgdW53cml0
YWJsZSByZWdpc3RlcnMsIGl0IHdpbGwgY29tcGFyZSByZWcNCj4gPj4+Pj4gICAgICAgIHdpdGgg
bWF4X3JlZ2lzdGVyIGluIHJlZ21hcF93cml0ZWFibGUuDQo+ID4+Pj4+DQo+ID4+Pj4+ICAgICAg
LSBJbiBkcml2ZXJzL3J0Yy9ydGMtcGNmODUzNjMuYywgQ1RSTF9TVE9QX0VOIGlzIDB4MmUsIGJ1
dA0KPiBEVF8xMDBUSFMNCj4gPj4+Pj4gICAgICAgIGlzIDAsIG1heF9yZWdpdGVyIGlzIDB4MmYs
IHRoZW4gcmVnIHdpbGwgYmUgZXF1YWwgdG8gMHgzMCwNCj4gPj4+Pj4gICAgICAgICcweDMwIDwg
MHgyZicgaXMgZmFsc2Usc28gcmVnbWFwX3dyaXRlYWJsZSB3aWxsIHJldHVybiBmYWxzZS4NCj4g
Pj4+Pj4NCj4gPj4+Pj4gICAgICAtIFJvb3QgY2F1c2U6IHRoZSBidWZbXSB3YXMgd3JpdHRlbiB0
byBhIHdyb25nIHBsYWNlIGluIHRoZSBmaWxlDQo+ID4+Pj4+ICAgICAgICBkcml2ZXJzL3J0Yy9y
dGMtcGNmODUzNjMuYw0KPiA+Pj4+Pg0KPiA+Pj4+DQo+ID4+Pj4gVGhpcyBpcyBub3QgdHJ1ZSwg
dGhlIFJUQyB3cmFwcyB0aGUgcmVnaXN0ZXIgYWNjZXNzZXMgcHJvcGVybHkgYW5kDQo+ID4+Pj4g
dGhpcw0KPiA+Pj4NCj4gPj4+IFRoaXMgcGVyZm9ybWFuY2UgaGFjayBwcm9iYWJseSBkZXNlcnZl
IHNvbWUgZXhwbGFuYXRpb24gaW4gdGhlIGNvZGUNCj4gPj4+IGNvbW1lbnQuICA6KQ0KPiA+Pj4N
Cj4gPj4+PiBpcyBwcm9iYWJseSBzb21ldGhpbmcgdGhhdCBzaG91bGQgYmUgaGFuZGxlZCBieSBy
ZWdtYXBfd3JpdGFibGUuDQo+ID4+Pg0KPiA+Pj4gVGhlIGFkZHJlc3Mgd3JhcHBpbmcgaXMgc3Bl
Y2lmaWMgdG8gdGhpcyBSVEMgY2hpcC4gIElzIGl0IGFsc28NCj4gPj4+IGNvbW1vbmx5IHVzZWQg
Ynkgb3RoZXIgSTJDIGRldmljZXM/ICBJJ20gbm90IHN1cmUgaWYgcmVnbWFwX3dyaXRhYmxlDQo+
ID4+PiBzaG91bGQgaGFuZGxlIHRoZSB3cmFwcGluZyBjYXNlIGlmIGl0IGlzIHRvbyBzcGVjaWFs
Lg0KPiA+Pj4NCj4gPj4NCj4gPj4gTW9zdCBvZiB0aGUgaTJjIFJUQ3MgZG8gYWRkcmVzcyB3cmFw
cGluZyB3aGljaCBpcyBzb21ldGltZXMgdGhlIG9ubHkNCj4gPj4gd2F5IHRvIHByb3Blcmx5IHNl
dCB0aGUgdGltZS4NCj4gPg0KPiA+IEFkZGluZyBNYXJrIGFuZCBOYW5kb3IgdG8gdGhlIGxvb3Au
DQo+ID4NCj4gPiBSZWdhcmRzLA0KPiA+IExlbw0KPiA+DQo+IA0KPiBIaSwNCj4gICAgYHJlZ21h
cGAgcHJvdmlkZXMgY291cGxlIG9mIHdheXMgdG8gdmFsaWRhdGUgdGhlIHJlZ2lzdGVyczoNCj4g
bWF4X3JlZ2lzdGVyLCBjYWxsYmFjayBmdW5jdGlvbiBhbmQgd3JpdGUgdGFibGUuIEFsbCBvZiB0
aGVzZSBhcmUgb3B0aW9uYWwsIHNvIGl0DQo+IGdpdmVzIHlvdSB0aGUgZnJlZWRvbSB0byBjdXN0
b21pemUgaXQgYXMgbmVlZGVkLg0KPiANCj4gSW4gdGhpcyBzaXR1YXRpb24gcHJvYmFibHkgeW91
IGNvdWxkOg0KPiAgICAxLiBBdm9pZCB1c2luZyB0aGUgd3JhcHBpbmcgZmVhdHVyZSBvZiBwY2Y4
NTM2MyAoeW91IGNhbiBqdXN0IHByb3ZpZGUNCj4gc2VwYXJhdGUgY2FsbHMgZm9yIHN0b3AsIHJl
c2V0IGFuZCB0aW1lIGNvbmZndXJhdGlvbikuIEluIHRoaXMgd2F5IHRoZQ0KPiBgbWF4X3JlZ2lz
dGVyYCB2YWxpZGF0aW9uIG1ldGhvZCB3aWxsIHdvcmsgZmluZS4NClllcywgSSB1c2UgdGhpcyB3
YXkuIFBhdGggYXMgZm9sbG93czoNClN0b3AgYW5kIHJlc2V0IC0gPiBzZXQgdGltZSA+IHN0b3AN
Cg0KPiAgICAyLiBSZXBsYWNlIGBtYXhfcmVnaXN0ZXJgIG1ldGhvZCB2YWxpZGF0aW9uIHdpdGgg
YGNhbGxiYWNrIGZ1bmN0aW9uYA0KPiB2YWxpZGF0aW9uIG1ldGhvZCwgd2VyZSB5b3UgY291bGQg
bWFrZSB5b3VyIG93biB2YWxpZGF0aW9uLg0KSXQgaXMgbm90IHdvcmssIHNob3cgdGhlIGNvZGUg
aW4gYXMgZm9sbG93czoNCg0KYm9vbCByZWdtYXBfd3JpdGVhYmxlKHN0cnVjdCByZWdtYXAgKm1h
cCwgdW5zaWduZWQgaW50IHJlZykNCnsNCiAgICAgICAgaWYgKG1hcC0+bWF4X3JlZ2lzdGVyICYm
IHJlZyA+IG1hcC0+bWF4X3JlZ2lzdGVyKQ0KICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsN
CkNhbGxiYWNrIGZ1bmN0aW9uICh3cml0ZWFibGVfcmVnKSB3aWxsIG5vdCBiZSBjYWxsZWQuDQog
ICAgICAgIGlmIChtYXAtPndyaXRlYWJsZV9yZWcpDQogICAgICAgICAgICAgICAgcmV0dXJuIG1h
cC0+d3JpdGVhYmxlX3JlZyhtYXAtPmRldiwgcmVnKTsNCg0KICAgICAgICBpZiAobWFwLT53cl90
YWJsZSkNCiAgICAgICAgICAgICAgICByZXR1cm4gcmVnbWFwX2NoZWNrX3JhbmdlX3RhYmxlKG1h
cCwgcmVnLCBtYXAtPndyX3RhYmxlKTsNCg0KICAgICAgICByZXR1cm4gdHJ1ZTsNCn0NCg0KPiAN
Cj4gDQo+IFJlZ2FyZHMsDQo+ICAgICBOYW5kb3INCj4gDQoNCg==
