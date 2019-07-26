Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D40377102
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2019 20:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727958AbfGZSMV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 26 Jul 2019 14:12:21 -0400
Received: from us-smtp-delivery-168.mimecast.com ([63.128.21.168]:32155 "EHLO
        us-smtp-delivery-168.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725899AbfGZSMV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 26 Jul 2019 14:12:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=impinj.com;
        s=mimecast20190405; t=1564164739;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S0ASaP+usu9NWvw/creIEBm0kn6ukR5j9YEQCgQAvms=;
        b=MUWNOdY/3DQj5WLO0YFngFuMmdbprcSJ66vVp4ojFaPxbn1CSb61qpi7KdN1p8+hvss6R6
        W74K7IfbuxppEyub+WTEHs4eDCATVpoAfUzy3dWDo4/itLdokhkejEXYd++wzc9g8h818z
        FJ3nX/W1Nqiq7ZAS2HS+Qk+re8q2zgo=
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03lp2055.outbound.protection.outlook.com [104.47.40.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-TI9CPUNMN3i5du-vW4e14g-1; Fri, 26 Jul 2019 14:12:18 -0400
Received: from MWHPR0601MB3708.namprd06.prod.outlook.com (10.167.236.38) by
 MWHPR0601MB3753.namprd06.prod.outlook.com (10.167.236.146) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Fri, 26 Jul 2019 18:12:12 +0000
Received: from MWHPR0601MB3708.namprd06.prod.outlook.com
 ([fe80::2d66:fca6:b053:764f]) by MWHPR0601MB3708.namprd06.prod.outlook.com
 ([fe80::2d66:fca6:b053:764f%6]) with mapi id 15.20.2094.017; Fri, 26 Jul 2019
 18:12:11 +0000
From:   Trent Piepho <tpiepho@impinj.com>
To:     "socketcan@hartkopp.net" <socketcan@hartkopp.net>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        "932845@bugs.debian.org" <932845@bugs.debian.org>
Subject: Re: Bug#932845: TS-219 RTC issue with Debian Buster
Thread-Topic: Bug#932845: TS-219 RTC issue with Debian Buster
Thread-Index: AQHVQ4OumHuWTYO3EESf3ZhBVWG4lqbcoZOAgAADiICAAAzvgIAAB5sAgAB6nYA=
Date:   Fri, 26 Jul 2019 18:12:11 +0000
Message-ID: <1564164731.2343.130.camel@impinj.com>
References: <9992cfcd-e51b-e002-4843-b16da8e2e119@hartkopp.net>
         <20190724070704.GA5983@taurus.defre.kleine-koenig.org>
         <9992cfcd-e51b-e002-4843-b16da8e2e119@hartkopp.net>
         <806117df-54ac-88f2-06a0-20a7502202ff@hartkopp.net>
         <20190726072759.uxx7i2hrl5qr4oux@pengutronix.de>
         <ec38f0ea-2113-5054-b98a-a4798eb61c82@hartkopp.net>
         <20190726093949.GA3962@piout.net>
         <c9bf6730-1cbe-96ad-6800-5a91ccd4040d@hartkopp.net>
         <69cfdfbc-c2cf-9b78-bbbc-3dcb33d64316@hartkopp.net>
In-Reply-To: <69cfdfbc-c2cf-9b78-bbbc-3dcb33d64316@hartkopp.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [216.207.205.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ff10200-979e-4be9-88fb-08d711f4c7ea
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR0601MB3753;
x-ms-traffictypediagnostic: MWHPR0601MB3753:
x-microsoft-antispam-prvs: <MWHPR0601MB375329E2FCE4AD0BA260D80CD3C00@MWHPR0601MB3753.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(136003)(376002)(396003)(366004)(39840400004)(52314003)(76094002)(189003)(199004)(3846002)(6116002)(68736007)(81166006)(81156014)(229853002)(8936002)(8676002)(25786009)(91956017)(316002)(478600001)(14444005)(76116006)(99286004)(5660300002)(86362001)(486006)(66946007)(110136005)(54906003)(256004)(66446008)(64756008)(66556008)(66476007)(186003)(6506007)(103116003)(4326008)(26005)(53936002)(2616005)(476003)(6512007)(6246003)(6486002)(446003)(102836004)(11346002)(305945005)(6436002)(71200400001)(71190400001)(66066001)(2906002)(76176011)(7736002)(36756003)(2501003)(14454004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR0601MB3753;H:MWHPR0601MB3708.namprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5NeWOlXhJE9dXrvjhFzzPftssysCwRcRy7e6ordpHM3QuxdfEH4S6yri6c3rEJPasL8kRGth0uoFUqkF+7fG/NXpagX5nq4tIM8ewGoTrYFDEaO1iADsKR1Xfu1hKKrNDZUkWr84P81uH76yvmOGMn/hILJp/MhAGk2g91hUxp7UuWvjJucTkGREwab6bjY/Aqw/emMT+Rig5uXpg+X2GgD+hBwKeQCxAFHsS3c/tRHUF5R6ogTJGJaVzf+5OY0G2UU1Q6kjFMl9UDUnMmBV+34mh1vLlI3bOXrv0sZamAMt5RUYyhGpBD/knUEcrZrUu5xg0SGDyxwRDy1DiYQkyrtyq5TLC1CteCh+pY4cfHB2Dfvy+4nvJN5UoMW7dq30TpKbjnvVS+Zk8yK++9GmBVC3oWmwenLFiLZcNV0SjVA=
Content-ID: <715AC0E9FCF1D64AB50CE915FFB0DABC@namprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: impinj.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff10200-979e-4be9-88fb-08d711f4c7ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 18:12:11.8374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6de70f0f-7357-4529-a415-d8cbb7e93e5e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tpiepho@impinj.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0601MB3753
X-MC-Unique: TI9CPUNMN3i5du-vW4e14g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gRnJpLCAyMDE5LTA3LTI2IGF0IDEyOjUzICswMjAwLCBPbGl2ZXIgSGFydGtvcHAgd3JvdGU6
DQo+IEp1c3QgYSB0aG91Z2h0Og0KPiANCj4gVGhlcmUgYXJlIHNvbWUgb2YgdGhlc2UgcnRjIGRy
aXZlcnMgdGhhdCBzZXQNCj4gDQo+IHJ0Yy0+cnRjLT51aWVfdW5zdXBwb3J0ZWQgPSAxOw0KPiAN
Cj4gaW4gdGhlIGNhc2UgdGhhdCB0aGV5IGNhbid0IGFzc2lnbiBhbiBpcnEgbGluZS4NCj4gDQo+
IEJ1dCBvdGhlcnMgc2V0DQo+IA0KPiBydGMtPnJ0Yy0+dWllX3Vuc3VwcG9ydGVkID0gMTsNCj4g
DQo+IHdoZW4gdGhleSBkb24ndCBzdXBwb3J0IGFuIChhbGFybSkgdHJpZ2dlciB3aXRoIDEgc2Vj
IGFjY3VyYWN5Lg0KPiANCj4gV291bGRuJ3QgaXQgbWFrZSBzZW5zZSB0byBwdXQNCj4gDQo+ICsg
ICAgICAgc2VsZWN0IFJUQ19JTlRGX0RFVg0KPiArICAgICAgIHNlbGVjdCBSVENfSU5URl9ERVZf
VUlFX0VNVUwNCj4gDQo+IGluIHRoZSBLY29uZmlnIGVudHJpZXMgb2YgdGhlIGxhdHRlciBkZXZp
Y2VzPw0KDQpUaGUgaHdjbG9jayBpbiBidXN5Ym94IGRvZXMgbm90IHVzZSBVSUUuICBJcyBpdCB0
aGUgdXRpbC1saW51eCB2ZXJzaW9uDQp0aGF0IHVzZXMgaXQ/ICBPciBzeXN0ZW1kIHRpbWVkYXRl
Pw0KDQpJIGtub3cgdGhhdCBjaHJvbnkncyBsaW51eCBSVEMgc3VwcG9ydCByZXF1aXJlcyBVSUUs
IG9yIFVJRSBlbXVsYXRpb24sDQp0byB3b3JrLiAgY2hyb255IGRvZXMgbm90IGRldGVjdCBsYWNr
IG9mIHRoaXMgdmVyeSB3ZWxsIGFuZCB0aGUgUlRDDQpzdXBwb3J0IGp1c3QgImRvZXNuJ3QgaGFw
cGVuIiB3aXRoIG5vIGVycm9ycy4gIEkgaGFkIHRvIHN0cmFjZSBpdCB0bw0KZmlndXJlIG91dCBp
dCB3YXMgd2FpdGluZyBmb3IgVUlFIGludGVycnVwdHMgdGhhdCBuZXZlciBjYW1lLg0KDQpBbnl3
YXksIHlvdSBkb24ndCByZWFsbHkgbmVlZCBVSUUgYXQgYWxsIHRvIHVzZSBhbiBydGMgaW4gYSBu
dW1iZXIgb2YNCndheXMuICBUaGUga2VybmVsICJydGMgdG8gc3lzdGVtIGNsb2NrIG9uIGJvb3Qi
IGZlYXR1cmUgZG9lc24ndCBuZWVkDQppdC4gIFRoZSBrZXJuZWwgYXV0byBzeW5jIHRoZSBydGMg
ZXZlcnkgMTEgbWlucyBmcm9tIE5UUCBzeW5jZWQgc3lzdGVtDQpjbG9jayBmZWF0dXJlIGRvZXNu
J3QgbmVlZCBpdC4gIGJ1c3lib3ggaHdjbG9jayBkb2Vzbid0IG5lZWQgaXQuDQoNClNvIEkgc3Vz
cGVjdCBpdCdzIG9wdGlvbmFsIGJlY2F1c2UgaXQncyBub3QgYWx3YXlzIG5lZWRlZC4NCg==

