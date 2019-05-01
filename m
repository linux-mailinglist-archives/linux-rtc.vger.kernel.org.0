Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41AED10BCB
	for <lists+linux-rtc@lfdr.de>; Wed,  1 May 2019 19:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbfEARLz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 1 May 2019 13:11:55 -0400
Received: from mail-eopbgr770113.outbound.protection.outlook.com ([40.107.77.113]:61102
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726005AbfEARLz (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 1 May 2019 13:11:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=impinj.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kojW7S+AlG1rx3CFD8ID9aPv2p0VvWWrcMoljH3m8Ik=;
 b=jNSlPJSYueMMqpo7dHLXaFUPCgdqrFHuXreClNhB3Z7G0ihqQFLpFXTIK/FIhyR/JIW8Dl2HXe/RPbBqCN4B0TQzvznh+sl6srsoZKHzSN5JFRJ5Kj0s4SXaCM/sdKFY18eZ226zKG2BiBMtcofFgi1tlOQjlgZNYS2E1oO/1VI=
Received: from MWHPR0601MB3708.namprd06.prod.outlook.com (10.167.236.38) by
 MWHPR0601MB3596.namprd06.prod.outlook.com (10.167.236.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Wed, 1 May 2019 17:11:50 +0000
Received: from MWHPR0601MB3708.namprd06.prod.outlook.com
 ([fe80::2d6d:7e4b:d2ff:5e29]) by MWHPR0601MB3708.namprd06.prod.outlook.com
 ([fe80::2d6d:7e4b:d2ff:5e29%3]) with mapi id 15.20.1856.008; Wed, 1 May 2019
 17:11:44 +0000
From:   Trent Piepho <tpiepho@impinj.com>
To:     "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "patrice.chotard@st.com" <patrice.chotard@st.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] rtc: st-lpc: remove unnecessary check
Thread-Topic: [PATCH] rtc: st-lpc: remove unnecessary check
Thread-Index: AQHU/5H32hcx4X+jhEK8dI4HvkdrpqZVSbiAgAEKhICAAC6FgA==
Date:   Wed, 1 May 2019 17:11:44 +0000
Message-ID: <1556730703.31309.53.camel@impinj.com>
References: <20190430201834.12634-1-alexandre.belloni@bootlin.com>
         <1556663479.31309.36.camel@impinj.com> <20190501142513.GK11339@piout.net>
In-Reply-To: <20190501142513.GK11339@piout.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=tpiepho@impinj.com; 
x-originating-ip: [216.207.205.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f998f5b-d709-4b3a-6e6f-08d6ce58165b
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR0601MB3596;
x-ms-traffictypediagnostic: MWHPR0601MB3596:
x-microsoft-antispam-prvs: <MWHPR0601MB359624CB2F7E7F44721D9C8ED33B0@MWHPR0601MB3596.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(39850400004)(136003)(366004)(376002)(189003)(199004)(91956017)(68736007)(186003)(71190400001)(6246003)(478600001)(71200400001)(446003)(26005)(2501003)(86362001)(53936002)(229853002)(11346002)(6512007)(2616005)(476003)(76116006)(73956011)(66476007)(25786009)(8936002)(2906002)(486006)(54906003)(5640700003)(81156014)(66556008)(6916009)(36756003)(305945005)(6116002)(5660300002)(64756008)(66446008)(3846002)(99286004)(2351001)(66066001)(103116003)(6506007)(14454004)(14444005)(81166006)(102836004)(6486002)(8676002)(66946007)(256004)(7736002)(6436002)(316002)(4326008)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR0601MB3596;H:MWHPR0601MB3708.namprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: impinj.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CdNHVVc3M3BSSAHRBa9grt07cs2ZjPhftO1uO/+0uYkQPei6up/y+ihObIZGm0EqdY588gXnLBtSe4GydW8sim1scm58cRInN4FnSEZ8KKIoFMUrhsoOjp6hdK/xJUpv8p7arWHc0DY/BttQiC4AVyqT9RT/NtiGii4sNUNoSXiKf9/WlGSYqFXBpS78MiQvOdubKRksVnuIbxb+TlPghL1ai47nPH0IoHiEtgCepWbNPqTtJigZgn+h1hndMaTa+h2WBbfaKumCzPsLflsDkjxg+2p+YNavAGzC0BQVbnwGn7XEEfBr0tZ9TXNamnnTC4qauUn36hhwjMwK5DuUF5Stic3UaJ8rqn9g4B1MDAUNIXX7lKTi5kRzM0oFY0gUN7QG1qkYKhgTYB7ZdWwBgVjAXIwMCUBv9VzPOy/a3EA=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49FCA81B3B0C5042BD02E5EC95515723@namprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: impinj.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f998f5b-d709-4b3a-6e6f-08d6ce58165b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 17:11:44.6117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6de70f0f-7357-4529-a415-d8cbb7e93e5e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0601MB3596
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gV2VkLCAyMDE5LTA1LTAxIGF0IDE2OjI1ICswMjAwLCBBbGV4YW5kcmUgQmVsbG9uaSB3cm90
ZToNCj4gT24gMzAvMDQvMjAxOSAyMjozMToxOSswMDAwLCBUcmVudCBQaWVwaG8gd3JvdGU6DQo+
ID4gT24gVHVlLCAyMDE5LTA0LTMwIGF0IDIyOjE4ICswMjAwLCBBbGV4YW5kcmUgQmVsbG9uaSB3
cm90ZToNCj4gPiA+IFRoZSBSVEMgY29yZSBhbHJlYWR5IGVuc3VyZXMgdGhlIGFsYXJtIGlzIHNl
dCB0byBhIHRpbWUgaW4gdGhlIGZ1dHVyZSwgaXQNCj4gPiA+IGlzIG5vdCBuZWNlc3NhcnkgdG8g
Y2hlY2sgYWdhaW4gaW4gdGhlIGRyaXZlci4NCj4gPiANCj4gPiBNeSByZWFkaW5nIG9mIHRoZSBy
dGMgY29yZSBjb2RlIGlzIHRoYXQgaXQgY2hlY2tzIGlmIHRoZSBhbGFybSBpcyBpbg0KPiA+IHRo
ZSBmdXR1cmUgKnR3aWNlKiBiZWZvcmUgaGFuZGluZyBvZmYgdGhlIHNldCBjYWxsIHRvIHRoZSBk
cml2ZXIsIHdoaWNoDQo+ID4gcG9zc2libHkgY2hlY2tzIGEgM3JkIHRpbWUgKGFzIHNlZW4gaGVy
ZSkuDQo+ID4gDQo+ID4gSG93ZXZlciwgYWxsIHRoZXNlIGNoZWNrcyBhcmUgZG9uZSAqYmVmb3Jl
KiBzZXR0aW5nIHRoZSBhbGFybS4gIEl0DQo+ID4gc3RpbGwgcG9zc2libGUgdG8gaGF2ZSBhIHJh
Y2UgYW5kIHNldCB0aGUgYWxhcm0gYWZ0ZXIgdGhlIHRpbWUgaGFzDQo+ID4gYWxyZWFkeSBwYXNz
ZWQsIGluIHdoaWNoIGNhc2UgdGhlIGFsYXJtIHdpbGwgbmV2ZXIgZmlyZS4NCj4gPiANCj4gDQo+
IEkgYWdyZWUgdGhlIGNvcmUgbmVlZCB0byBoYW5kbGUgdGhhdCBwb3NzaWJsZSByYWNlIGJldHRl
ciBhbmQgdGhpcyBpcw0KPiBzb21ldGhpbmcgSSdtIHBsYW5uaW5nIHRvIHdvcmsgb24uDQo+IA0K
PiA+IFRoZSB3YXkgdG8gZml4IHRoZSByYWNlIHdvdWxkIGJlIHRvIGhhdmUgdGhlIGRyaXZlciBj
aGVjayB0aGUgYWxhcm0NCj4gPiAqYWZ0ZXIqIHNldHRpbmcgaXQuICBJbiBwcmVjaXNlbHkgdGhp
cyBvcmRlciwgZG8gdGhlc2Ugc3RlcHM6DQo+ID4gDQo+ID4gMS4gU2V0IGFsYXJtIGluIFJUQywg
dG8gVGFsYXJtDQo+ID4gMi4gR2V0IHRpbWUgZnJvbSBSVEMsIGFzIFRjdXJyZW50DQo+ID4gMy4g
R2V0IGFsYXJtIHN0YXR1cyBmcm9tIFJUQw0KPiA+IA0KPiA+IElmIFRhbGFybSA8IFRjdXJyZW50
LCBhbGFybSB3YXMgc2V0IHRvIGZ1dHVyZSB0aW1lLCBubyBlcnJvcg0KPiANCj4gVGhpcyBzaG91
bGQgYmUgVGFsYXJtID4gVGN1cnJlbnQsIHJpZ2h0Pw0KDQpZZXMuICBJIHdyb3RlIHRoYXQgYmFj
a3dhcmQuDQoNCj4gPiBFbHNlDQo+ID4gICBJZiBzdGF0dXMgPT0gZmlyZWQsIGFsYXJtIHdhcyBz
ZXQgYW5kIGhhcyBzaW5jZSBmaXJlZCwgbm8gZXJyb3INCj4gPiAgIEVsc2Ugc3RhdHVzID09IG5v
dCBmaXJlZCwgYWxhcm0gd2FzIHNldCBpbiBwYXN0LCBFSU5WQUwNCj4gPiANCj4gPiBUaGlzIHNo
b3VsZCBiZSByYWNlIGZyZWUuDQo+ID4gDQo+ID4gDQo+ID4gPiAgDQo+ID4gPiAtCS8qIEludmFs
aWQgYWxhcm0gdGltZSAqLw0KPiA+ID4gLQlpZiAobm93X3NlY3MgPiBhbGFybV9zZWNzKQ0KPiA+
ID4gLQkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gPiAtDQo+ID4gPiAgCW1lbWNweSgmcnRjLT5hbGFy
bSwgdCwgc2l6ZW9mKHN0cnVjdCBydGNfd2thbHJtKSk7DQo+ID4gPiAgDQo+ID4gPiAgCS8qIE5v
dyBtYW55IHNlY3MgdG8gZmlyZSAqLw0KPiA+IA0KPiA+ICAgICAgICAgYWxhcm1fc2VjcyAtPSBu
b3dfc2VjczsNCj4gPiAgICAgICAgIGxwYSA9ICh1bnNpZ25lZCBsb25nIGxvbmcpYWxhcm1fc2Vj
cyAqIHJ0Yy0+Y2xrcmF0ZTsNCj4gPiANCj4gPiBXaGlsZSBpdCdzIHRydWUgdGhlIHRpbWUgd291
bGRuJ3Qgbm9ybWFsbHkgYmUgaW4gcGFzdCwgaXQgc3RpbGwgcmFjZXMsDQo+ID4gYXMgZGVzY3Jp
YmUgYWJvdmUuIEluIHRoYXQgY2FzZSwgdGhlIG1hdGggaGVyZSB1bmRlcmZsb3dzIGFsYXJtX3Nl
Y3MsDQo+ID4gc28gaXQgcHJvYmFibHkgc3RpbGwgbWFrZXMgc2Vuc2UgdG8gY2hlY2suDQo+IA0K
PiBJIGNhbid0IGJlbGlldmUgeW91IGNhbiBwb3NzaWJseSBoYXZlIG1vcmUgdGhhbiBvbmUgc2Vj
b25kIGJldHdlZW4gdGhlDQo+IGNoZWNrIGluIHRoZSBjb3JlIGFuZCB0aGUgY2hlY2sgaW4gdGhl
IGRyaXZlciwgaXQgZG9lc24ndCBtYWtlIG11Y2gNCj4gc2Vuc2UgdG8gY2hlY2ssIGV2ZW4gaW4g
dGhlIGN1cnJlbnQgc3RhdGUgb2YgdGhlIGNvcmUuDQoNCkl0J3MgY2VydGFpbmx5IHBvc3NpYmxl
IHRvIGhhdmUgbXVsdGlwbGUgc2Vjb25kcyBwYXNzLiAgRm9yIGFuIGV4dGVybmFsDQpkZXZpY2Ug
b3ZlciBTUEkgb3IgSTJDLCBvbmUgaGFzIHRvIHdhaXQgZm9yIHRoZSBidXMgdG8gYmVjb21lIGZy
ZWUuIA0KQW5kIG9uIFNQSSB0aGF0IHJlcXVpcmVzIHRoZSBrZXJuZWwgdGhyZWFkIHJ1bm5pbmcg
dGhlIGJ1cyB0byBiZSANCnNjaGVkdWxlZC4gIEp1c3QgcHV0IGluIHNvbWUgcmVhbC10aW1lIHRh
c2tzIGFuZCBtYXliZSBhIGJpZyB0cmFuc2Zlcg0KdG8gYSBmbGFzaCBjaGlwIGFuZCBpdCBjb3Vs
ZCBiZSBhIHdoaWxlIGJlZm9yZSB0aGF0IGhhcHBlbnMuDQoNCkkgZG9uJ3QgdGhpbmsgdGhpcyBk
ZXZpY2UgaGFzIHRoYXQgaXNzdWUgYXMgSSBkb24ndCB0aGluayBpdCdzDQpleHRlcm5hbC4gIEFu
ZCBldmVyIGZvciBhIGRldmljZSBvbiBhbiBleHRlcm5hbCBidXMsIGRlbGF5cyA+IDEgc2Vjb25k
DQphcmUgdW5saWtlbHkuICBQb3NzaWJsZSwgYnV0IHVubGlrZWx5Lg0KDQpZb3UgY2FuIGFsc28g
Z2V0IHRoZW0gd2hlbiBMaW51eCBpcyBydW5uaW5nIHVuZGVyIGEgaHlwZXJ2aXNvciwgaS5lLiBh
DQpMaW51eCBWTS4gIEJ1dCBhbHNvIHNvbWV0aGluZyBsaWtlIGFuIE5NSSBhbmQgQUNQSSBCSU9T
LiAgSWYgdGhlIExpbnV4DQpndWVzdCBpcyBub3Qgc2NoZWR1bGVkIHRvIHJ1biBmb3Igd2hpbGUg
YW55dGhpbmcgdGhhdCBpcyBzdXBwb3NlZCB0byBiZQ0KYmFzZWQgb24gcmVhbCB0aW1lLCBsaWtl
IHRoZSB2YWx1ZSByZXR1cm5lZCBieSBhbiBSVEMsIHdpbGwgc3RpbGwNCmFkdmFuY2UuICBJdCBp
cyBwb3NzaWJsZSB0aGF0IG11bHRpcGxlIHNlY29uZHMgZWxhcHNlIGZyb20gdGhlIGd1ZXN0DQpD
UFUgZXhlY3V0aW5nIG9uZSBpbnN0cnVjdGlvbiB0byB0aGUgbmV4dC4NCg0KQnV0IGV2ZW4gaWdu
b3JpbmcgdGhhdCwgZG9lcyBpdCByZXF1aXJlID4gMSBzZWNvbmQgdG8gZWxhcHNlLiAgQ2FuJ3Qg
aXQNCmhhcHBlbiB3aGVuIHRoZSBjbG9jayB0aWNrcyBmcm9tIG9uZSBzZWNvbmQgdG8gdGhlIG5l
eHQsIHdoaWNoIGhhcHBlbnMNCmVmZmVjdGl2ZWx5IGluc3RhbnRseT8NCg0KSWYgdGhlIHRpbWUg
ZnJvbSB0aGUgY2hlY2sgdG8gdGhlIHRpbWUgd2hlbiB0aGUgYWxhcm0gaXMgc2V0IGlzIDENCm1p
Y3Jvc2Vjb25kLCBhbmQgdGhlIHRpbWUgdGhpcyBjYWxsIHRvIHNldCB0aGUgYWxhcm0gaXMgbWFk
ZSBpcw0KcmFuZG9tbHkgZG9uZSBhbmQgbm90IHN5bmNocm9uaXplZCB0byB0aGUgUlRDLCB0aGVu
IGlzbid0IHRoZXJlIGEgMSBvdXQNCm9mIDEgbWlsbGlvbiBjaGFuY2UgKDEgbWljcm9zZWNvbmQg
LyAxIHNlY29uZCksIHRoYXQgdGhlIG9uY2UgcGVyDQpzZWNvbmQgY2xvY2sgdGljayB3aWxsIGhp
dCBvdXIgMSB1cyB3aW5kb3c/
