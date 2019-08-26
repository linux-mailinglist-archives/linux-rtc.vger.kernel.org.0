Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2EC39CCCF
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2019 11:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731077AbfHZJtz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 26 Aug 2019 05:49:55 -0400
Received: from mail-eopbgr70051.outbound.protection.outlook.com ([40.107.7.51]:5142
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729922AbfHZJtz (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 26 Aug 2019 05:49:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLllc4K+Z/upYmplz5p1zcDYjDODJUTxcZ3qHzNnUAOrG9h1Mi1R71zcCbWy9NAp6UrC5pV4FoL2sRHiGLWxiHPD3645pDaankHsaWCEa0U6XdQJ5YFuo2S1R0FkDC2HuY9MBH4m/EFH1tu6vlsgkCTlgbISDSAmyUIkk8n1qAEn6NxYBHwFh8jf+G2tOip4w9PUijElE7gmE6BMMH6PXrtKTUEeUEptGgdZEdgHFf+59Zo4xqRXxdw2cvigm8DAGq021bJAqrTluJGzci/8rgpHmhfGsfcuW1AqcFJ+W0NkZbmCSSAd2ScwW9JeugW4tzCM4N5z6ilhoeZ0mbAaiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48iuusULbNcUabk8y009wqFtkH6bY/E+yyzThumdzM0=;
 b=E75e7qkBuFYnrsm3kY4HT/YPIV/saj+Yb82v4ZxPkSenkz8DbCJC4PbEgeYEHfHtOV+8Rj3bKCjjXilfRPSkeVdNjDfDPvoIoH/BSlUi1/Q+2nyKxEnx9bK7uSIHfTiqt0d1qwDqwOKolUUBMrlLVpgZC3rujtrdlTx4ees6vGLN2jQv2z1yWf/5s2FgTbMgIVLoOuxXx0bHZBlPmTMD5+ZN/o1ajdKdw+qKypNf1Ely9tLcrO/KgGF17MNvwhkBIUg5PWsouhZcKj5pouVrJ/kjzFQRoCb4D/TskFbXBFp1I48wdyc9R0BzmxdnRyq4FAkKWUFHgfE8odi9KpJtlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48iuusULbNcUabk8y009wqFtkH6bY/E+yyzThumdzM0=;
 b=qE6rpYIhpsd99+PeInJarjMJS6H6owqP+cUNkroxBq2dpxuLb+aJiXjULDYBJWwnxhyL/KbH2z3JZN3OURPyQCDsKpht30+ro+8Iqtm+Ck1agy6aLvb+lNbuktQjcyKALr47haHCVpxS8A5UkS1nAfhYIGxE6EYY+6WLv29hOl0=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4043.eurprd04.prod.outlook.com (52.134.107.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 26 Aug 2019 09:49:49 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::3cd8:4bcf:8626:4254]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::3cd8:4bcf:8626:4254%3]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 09:49:49 +0000
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
Thread-Index: AQHVU944/chRI20GGkSPTXSrUh+lT6b9aqqAgACCWYCAAAqBgIAANb+AgAb78oCAB7jGEIAAVF2AgAAIeTA=
Date:   Mon, 26 Aug 2019 09:49:49 +0000
Message-ID: <DB7PR04MB449081DBB762BB30E2C55F638FA10@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190816024636.34738-1-biwen.li@nxp.com>
 <20190816080417.GB3545@piout.net>
 <CADRPPNRkqbWzGEvUJyi0Qff3oS6biO0v7BTrK1Jiz9AMnOYF=Q@mail.gmail.com>
 <20190816162825.GE3545@piout.net>
 <CADRPPNQwcGrVXLm8eHbXKmyecMhT6Mt9rNGnspJA1+MnV4K8oQ@mail.gmail.com>
 <ff198737-acb5-7186-7e14-a1e1cdc0f72c@vaisala.com>
 <DB7PR04MB4490614205732E4508B8A8B38FA10@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <21f417e3-db50-5930-ddc9-eed54f5d5893@vaisala.com>
In-Reply-To: <21f417e3-db50-5930-ddc9-eed54f5d5893@vaisala.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c31c4480-e2ae-40ed-9328-08d72a0abc39
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB4043;
x-ms-traffictypediagnostic: DB7PR04MB4043:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB40435E99C777F0D8097C57608FA10@DB7PR04MB4043.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(199004)(189003)(6116002)(305945005)(55016002)(9686003)(110136005)(229853002)(6306002)(64756008)(66446008)(76116006)(33656002)(74316002)(86362001)(6436002)(66476007)(186003)(66556008)(66946007)(7696005)(486006)(44832011)(11346002)(71200400001)(53936002)(446003)(8936002)(26005)(71190400001)(6246003)(476003)(5660300002)(4326008)(81166006)(99286004)(25786009)(81156014)(8676002)(53546011)(2906002)(6506007)(102836004)(14444005)(256004)(478600001)(966005)(7736002)(14454004)(54906003)(3846002)(66066001)(76176011)(52536014)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4043;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jzhWNMwQkHB8hYOirujWD5EsIZELSVGxdpVu4sRNB/DFvesE+2djNDTGfLoCl2RQl2Fh0WzqFXopR87OTzupc7FD25YbIZI7gjRPzgTWgmN3p/gJ5Uk4PSgIx3b3KNVqIkq+mPI1KjbaCzT1LQYeS+A6DTLodMYQd1PImxybaGMNUJ+7SaYs2mAZcVMUlkyUPyStzxtqDFZgIniKoCEa70FOIbJPpdmWR709rIsSoodRPa1v8oO4lGsibSnL9UmkMD16YUZHdd4ppQL6M7TxojqaGE8PC0CU9mhksChMG+XVMHGVfU0P7nb6xqltlRef9YoadUb3DSmWHIHNFGVcpAvZ2sLFepzfVbhQq9v63U378QKIltcOTjmhOqv8Kma9k8/NJew0YBQ9eLzCbz+BH+nfCmO/NvSbAST7a8TWyLI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c31c4480-e2ae-40ed-9328-08d72a0abc39
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 09:49:49.1744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WL7KZNVh2xE+ew2/APWKU4+9P9NzAYhakWzEWKPxDSaLVD2aAAl+oRkx0wbTynttiKbMHmUwbbdg5Gbq2z9wuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4043
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PiANCj4gT24gOC8yNi8xOSA3OjI5IEFNLCBCaXdlbiBMaSB3cm90ZToNCj4gPj4NCj4gPj4gT24g
OC8xNi8xOSAxMDo0MCBQTSwgTGkgWWFuZyB3cm90ZToNCj4gPj4+IE9uIEZyaSwgQXVnIDE2LCAy
MDE5IGF0IDExOjMwIEFNIEFsZXhhbmRyZSBCZWxsb25pDQo+ID4+PiA8YWxleGFuZHJlLmJlbGxv
bmlAYm9vdGxpbi5jb20+IHdyb3RlOg0KPiA+Pj4+DQo+ID4+Pj4gT24gMTYvMDgvMjAxOSAxMDo1
MDo0OS0wNTAwLCBMaSBZYW5nIHdyb3RlOg0KPiA+Pj4+PiBPbiBGcmksIEF1ZyAxNiwgMjAxOSBh
dCAzOjA1IEFNIEFsZXhhbmRyZSBCZWxsb25pDQo+ID4+Pj4+IDxhbGV4YW5kcmUuYmVsbG9uaUBi
b290bGluLmNvbT4gd3JvdGU6DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gT24gMTYvMDgvMjAxOSAxMDo0
NjozNiswODAwLCBCaXdlbiBMaSB3cm90ZToNCj4gPj4+Pj4+PiBJc3N1ZToNCj4gPj4+Pj4+PiAg
ICAgICAtICMgaHdjbG9jayAtdw0KPiA+Pj4+Pj4+ICAgICAgICAgaHdjbG9jazogUlRDX1NFVF9U
SU1FOiBJbnZhbGlkIGFyZ3VtZW50DQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBXaHk6DQo+ID4+Pj4+
Pj4gICAgICAgLSBSZWxhdGl2ZSBwYXRjaDoNCj4gPj4gaHR0cHM6Ly9sa21sLm9yZw0KPiA+PiAl
MkZsa21sJTJGMjAxOSUyRjQlMkYzJTJGNTUmYW1wO2RhdGE9MDIlN0MwMSU3Q2Jpd2VuLmxpJTQw
bg0KPiB4cC4NCj4gPj4NCj4gY29tJTdDZmY4Y2ViYzNmMTAzNGFlM2ZhOTYwOGQ3MjVmZjllNWUl
N0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OQ0KPiA+Pg0KPiBjNWMzMDE2MzUlN0MwJTdDMCU3QzYz
NzAxOTY1MjExMTkyMzczNiZhbXA7c2RhdGE9c3BZNmUyMllPa09GDQo+ID4+IDMlMkJGN2NyU00w
TTZ4UG1PaGdVTERxTVpMUXclMkJBbWRJJTNEJmFtcDtyZXNlcnZlZD0wICwNCj4gdGhpcyBwYXRj
aA0KPiA+Pj4+Pj4+ICAgICAgICAgd2lsbCBhbHdheXMgY2hlY2sgZm9yIHVud3JpdGFibGUgcmVn
aXN0ZXJzLCBpdCB3aWxsIGNvbXBhcmUgcmVnDQo+ID4+Pj4+Pj4gICAgICAgICB3aXRoIG1heF9y
ZWdpc3RlciBpbiByZWdtYXBfd3JpdGVhYmxlLg0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4gICAgICAg
LSBJbiBkcml2ZXJzL3J0Yy9ydGMtcGNmODUzNjMuYywgQ1RSTF9TVE9QX0VOIGlzIDB4MmUsIGJ1
dA0KPiA+PiBEVF8xMDBUSFMNCj4gPj4+Pj4+PiAgICAgICAgIGlzIDAsIG1heF9yZWdpdGVyIGlz
IDB4MmYsIHRoZW4gcmVnIHdpbGwgYmUgZXF1YWwgdG8gMHgzMCwNCj4gPj4+Pj4+PiAgICAgICAg
ICcweDMwIDwgMHgyZicgaXMgZmFsc2Usc28gcmVnbWFwX3dyaXRlYWJsZSB3aWxsIHJldHVybiBm
YWxzZS4NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+ICAgICAgIC0gUm9vdCBjYXVzZTogdGhlIGJ1Zltd
IHdhcyB3cml0dGVuIHRvIGEgd3JvbmcgcGxhY2UgaW4gdGhlIGZpbGUNCj4gPj4+Pj4+PiAgICAg
ICAgIGRyaXZlcnMvcnRjL3J0Yy1wY2Y4NTM2My5jDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+DQo+ID4+
Pj4+PiBUaGlzIGlzIG5vdCB0cnVlLCB0aGUgUlRDIHdyYXBzIHRoZSByZWdpc3RlciBhY2Nlc3Nl
cyBwcm9wZXJseQ0KPiA+Pj4+Pj4gYW5kIHRoaXMNCj4gPj4+Pj4NCj4gPj4+Pj4gVGhpcyBwZXJm
b3JtYW5jZSBoYWNrIHByb2JhYmx5IGRlc2VydmUgc29tZSBleHBsYW5hdGlvbiBpbiB0aGUNCj4g
Pj4+Pj4gY29kZSBjb21tZW50LiAgOikNCj4gPj4+Pj4NCj4gPj4+Pj4+IGlzIHByb2JhYmx5IHNv
bWV0aGluZyB0aGF0IHNob3VsZCBiZSBoYW5kbGVkIGJ5IHJlZ21hcF93cml0YWJsZS4NCj4gPj4+
Pj4NCj4gPj4+Pj4gVGhlIGFkZHJlc3Mgd3JhcHBpbmcgaXMgc3BlY2lmaWMgdG8gdGhpcyBSVEMg
Y2hpcC4gIElzIGl0IGFsc28NCj4gPj4+Pj4gY29tbW9ubHkgdXNlZCBieSBvdGhlciBJMkMgZGV2
aWNlcz8gIEknbSBub3Qgc3VyZSBpZg0KPiA+Pj4+PiByZWdtYXBfd3JpdGFibGUgc2hvdWxkIGhh
bmRsZSB0aGUgd3JhcHBpbmcgY2FzZSBpZiBpdCBpcyB0b28gc3BlY2lhbC4NCj4gPj4+Pj4NCj4g
Pj4+Pg0KPiA+Pj4+IE1vc3Qgb2YgdGhlIGkyYyBSVENzIGRvIGFkZHJlc3Mgd3JhcHBpbmcgd2hp
Y2ggaXMgc29tZXRpbWVzIHRoZQ0KPiA+Pj4+IG9ubHkgd2F5IHRvIHByb3Blcmx5IHNldCB0aGUg
dGltZS4NCj4gPj4+DQo+ID4+PiBBZGRpbmcgTWFyayBhbmQgTmFuZG9yIHRvIHRoZSBsb29wLg0K
PiA+Pj4NCj4gPj4+IFJlZ2FyZHMsDQo+ID4+PiBMZW8NCj4gPj4+DQo+ID4+DQo+ID4+IEhpLA0K
PiA+PiAgICAgYHJlZ21hcGAgcHJvdmlkZXMgY291cGxlIG9mIHdheXMgdG8gdmFsaWRhdGUgdGhl
IHJlZ2lzdGVyczoNCj4gPj4gbWF4X3JlZ2lzdGVyLCBjYWxsYmFjayBmdW5jdGlvbiBhbmQgd3Jp
dGUgdGFibGUuIEFsbCBvZiB0aGVzZSBhcmUNCj4gPj4gb3B0aW9uYWwsIHNvIGl0IGdpdmVzIHlv
dSB0aGUgZnJlZWRvbSB0byBjdXN0b21pemUgaXQgYXMgbmVlZGVkLg0KPiA+Pg0KPiA+PiBJbiB0
aGlzIHNpdHVhdGlvbiBwcm9iYWJseSB5b3UgY291bGQ6DQo+ID4+ICAgICAxLiBBdm9pZCB1c2lu
ZyB0aGUgd3JhcHBpbmcgZmVhdHVyZSBvZiBwY2Y4NTM2MyAoeW91IGNhbiBqdXN0DQo+ID4+IHBy
b3ZpZGUgc2VwYXJhdGUgY2FsbHMgZm9yIHN0b3AsIHJlc2V0IGFuZCB0aW1lIGNvbmZndXJhdGlv
bikuIEluDQo+ID4+IHRoaXMgd2F5IHRoZSBgbWF4X3JlZ2lzdGVyYCB2YWxpZGF0aW9uIG1ldGhv
ZCB3aWxsIHdvcmsgZmluZS4NCj4gPiBZZXMsIEkgdXNlIHRoaXMgd2F5LiBQYXRoIGFzIGZvbGxv
d3M6DQo+ID4gU3RvcCBhbmQgcmVzZXQgLSA+IHNldCB0aW1lID4gc3RvcA0KPiA+DQo+IA0KPiBT
b21lIG9mIHRoZSBjb25jZXJucyByZWdhcmRpbmcgdGhpcyBtZXRob2Qgd2FzIHRoYXQgaXQgbWln
aHQgbm90IGJlIHByZWNpc2UNCj4gZW5vdWdoLiBUaGF0IGJlY2F1c2UgeW91IG5lZWQgMiBJMkMg
b3BlcmF0aW9ucyAob25lIGZvciBzdG9wIGFuZCBvbmUgZm9yIHRpbWUNCj4gY29uZmlndXJhdGlv
bikuIE5vdCBzdXJlIGFib3V0IHlvdXIgY2FzZSBpZiB0aGlzIGlzIGEgcHJvYmxlbSBvciBub3Qu
DQpPaywgZ290IGl0LCB0aGFua3MuDQo+IA0KPiA+PiAgICAgMi4gUmVwbGFjZSBgbWF4X3JlZ2lz
dGVyYCBtZXRob2QgdmFsaWRhdGlvbiB3aXRoIGBjYWxsYmFjaw0KPiA+PiBmdW5jdGlvbmAgdmFs
aWRhdGlvbiBtZXRob2QsIHdlcmUgeW91IGNvdWxkIG1ha2UgeW91ciBvd24gdmFsaWRhdGlvbi4N
Cj4gPiBJdCBpcyBub3Qgd29yaywgc2hvdyB0aGUgY29kZSBpbiBhcyBmb2xsb3dzOg0KPiA+DQo+
ID4gYm9vbCByZWdtYXBfd3JpdGVhYmxlKHN0cnVjdCByZWdtYXAgKm1hcCwgdW5zaWduZWQgaW50
IHJlZykgew0KPiA+ICAgICAgICAgIGlmIChtYXAtPm1heF9yZWdpc3RlciAmJiByZWcgPiBtYXAt
Pm1heF9yZWdpc3RlcikNCj4gPiAgICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4gPiBD
YWxsYmFjayBmdW5jdGlvbiAod3JpdGVhYmxlX3JlZykgd2lsbCBub3QgYmUgY2FsbGVkLg0KPiA+
ICAgICAgICAgIGlmIChtYXAtPndyaXRlYWJsZV9yZWcpDQo+ID4gICAgICAgICAgICAgICAgICBy
ZXR1cm4gbWFwLT53cml0ZWFibGVfcmVnKG1hcC0+ZGV2LCByZWcpOw0KPiANCj4gSGkgTGksDQo+
ICAgICBJZiB5b3UgKnJlcGxhY2UqIHRoZSBgbWF4X3JlZ2lzdGVyYCBtZXRob2Qgd2l0aCBgY2Fs
bGJhY2sgZnVuY3Rpb25gIGl0DQo+IHNob3VsZCB3b3JrLiBUaGUgY29kZSBhYm92ZSB3aWxsIHVz
ZSBldmVyeSBtZXRob2QgKmlmIHByb3ZpZGVkKi4gSW4gb3RoZXINCj4gd29yZHMgaWYgYG1hcC0+
bWF4X3JlZ2lzdGVyYCBpcyAwIHdpbGwgZ28gdG8gdGhlIG5leHQgc3RlcCBhbmQgY2hlY2sNCj4g
YG1hcC0+d3JpdGVhYmxlX3JlZ2AuIFJpZ2h0Pw0KWWVzLCB5b3UgYXJlIHJpZ2h0LiBUaGFua3Mu
DQo+IA0KPiANCj4gDQo+IFJlZ2FyZHMsDQo+ICAgICAgTmFuZG9yDQo=
