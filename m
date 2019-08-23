Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF709B4F3
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2019 18:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730532AbfHWQ4g (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Aug 2019 12:56:36 -0400
Received: from us-smtp-delivery-168.mimecast.com ([216.205.24.168]:60760 "EHLO
        us-smtp-delivery-168.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729212AbfHWQ4g (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 23 Aug 2019 12:56:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=impinj.com;
        s=mimecast20190405; t=1566579395;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tNGQZG0MaK5D5PV6OvBC2tWAbsDx8KCpuqSoA/QVh2g=;
        b=JPDZS28ow+PFRsINNY1Z5Vnt6npjZcDqbVKj/nUX0bCnE0ar43GhwM27SwV3ZMjkIx+4s8
        GCsXoLWw7GxmFq/OuqGAH1Fjqdz8OETIrsTWeSv08qT1BX5YqDgA6xCyBOmHw0qROVIW5i
        M7YdZa5f/TmJAUkw+WtMsczT9+yT7GY=
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05lp2059.outbound.protection.outlook.com [104.47.48.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-OWICPnAKMEmQuXkwUKRBlw-1; Fri, 23 Aug 2019 12:56:33 -0400
Received: from MWHPR0601MB3708.namprd06.prod.outlook.com (10.167.236.38) by
 MWHPR0601MB3739.namprd06.prod.outlook.com (10.167.236.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Fri, 23 Aug 2019 16:56:29 +0000
Received: from MWHPR0601MB3708.namprd06.prod.outlook.com
 ([fe80::1c8:1be2:2f2a:1cde]) by MWHPR0601MB3708.namprd06.prod.outlook.com
 ([fe80::1c8:1be2:2f2a:1cde%2]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 16:56:29 +0000
From:   Trent Piepho <tpiepho@impinj.com>
To:     "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "biwen.li@nxp.com" <biwen.li@nxp.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [1/3] rtc/fsl: support flextimer for lx2160a
Thread-Topic: [1/3] rtc/fsl: support flextimer for lx2160a
Thread-Index: AQHVWZqlHeXpJlnWHEW4zoEmDhv/8qcI9DMA
Date:   Fri, 23 Aug 2019 16:56:28 +0000
Message-ID: <1566579388.5029.8.camel@impinj.com>
References: <20190823095740.12280-1-biwen.li@nxp.com>
In-Reply-To: <20190823095740.12280-1-biwen.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [216.207.205.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6eb7bd08-c138-440d-236f-08d727ead7c2
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR0601MB3739;
x-ms-traffictypediagnostic: MWHPR0601MB3739:
x-microsoft-antispam-prvs: <MWHPR0601MB3739E8865DA468ADE0388311D3A40@MWHPR0601MB3739.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39850400004)(396003)(376002)(136003)(346002)(366004)(199004)(189003)(3846002)(5660300002)(2616005)(64756008)(66556008)(446003)(11346002)(476003)(186003)(6116002)(91956017)(76116006)(229853002)(8676002)(486006)(66946007)(76176011)(25786009)(66476007)(81166006)(36756003)(256004)(4326008)(66446008)(305945005)(7736002)(99286004)(478600001)(86362001)(53936002)(316002)(2501003)(6436002)(14454004)(81156014)(2906002)(6512007)(6486002)(103116003)(66066001)(8936002)(6506007)(102836004)(26005)(54906003)(71190400001)(6246003)(110136005)(71200400001)(2201001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR0601MB3739;H:MWHPR0601MB3708.namprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PhC6vAhMXpGMpoMrquQT7nlkw1+ch9v84QGbD0+eeUp5c6E9Xmm6YykK54p8WGl1x/5lsqnp6fia0ANSR7CPA+tABxm+BZzhk/hwUAkJQ9vNt3k4libpXWZYCf8lVkNyedrdMnRAZpKin3Yz+sWI/PfJg3d/nZ+z0p73n2LGjt/0VwavvNHa87+IvpdL7QdvwfY9ZlSpPxydT8O6aKzcKFPmMh0i1gjTgMRI8fDQg5UcOQed0RJgJswSEcatE7MYtZUFOaNIBhapEB6cVLkBdoRw1Ba6jQ+rN9ZPlgoOvy05i+LSXTvkvfJzABX9ty1u8DHufyirIZ4e5RTCxJKn/rwddTA09Abio0qsajhRRsS3y60d488rGIQ+M1Qy5gZeq+BJfLzrwYmCjAjVr+cyFBXH83jZgwM/wTzFyqy8r7Y=
x-ms-exchange-transport-forked: True
Content-ID: <3C3797AA81BCF84B8CB1E3A7DE501830@namprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: impinj.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb7bd08-c138-440d-236f-08d727ead7c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 16:56:28.9151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6de70f0f-7357-4529-a415-d8cbb7e93e5e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dTweQXnKOB0xWWPxfUJPkxk4qwnueorL16SQqzEihGeqwVPrC0aNCLL2pRlJwAtkafEPEkV/mNbys9RdL0xe2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0601MB3739
X-MC-Unique: OWICPnAKMEmQuXkwUKRBlw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gRnJpLCAyMDE5LTA4LTIzIGF0IDE3OjU3ICswODAwLCBCaXdlbiBMaSB3cm90ZToNCj4gVGhl
IHBhdGNoIHN1cHBvcnRzIGZsZXh0aW1lciBmb3IgbHgyMTYwYQ0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQml3ZW4gTGkgPGJpd2VuLmxpQG54cC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ydGMvcnRj
LWZzbC1mdG0tYWxhcm0uYyB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLWZzbC1mdG0tYWxhcm0uYyBiL2Ry
aXZlcnMvcnRjL3J0Yy1mc2wtDQo+IGZ0bS1hbGFybS5jDQo+IGluZGV4IDRmNzI1OWMyZDZhMy4u
MmI4MTUyNWY2ZGI4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3J0Yy9ydGMtZnNsLWZ0bS1hbGFy
bS5jDQo+ICsrKyBiL2RyaXZlcnMvcnRjL3J0Yy1mc2wtZnRtLWFsYXJtLmMNCj4gQEAgLTMxMyw2
ICszMTMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBmdG1fcnRjX21hdGNo
W10NCj4gPSB7DQo+ICAJeyAuY29tcGF0aWJsZSA9ICJmc2wsbHMxMDg4YS1mdG0tYWxhcm0iLCB9
LA0KPiAgCXsgLmNvbXBhdGlibGUgPSAiZnNsLGxzMjA4eGEtZnRtLWFsYXJtIiwgfSwNCj4gIAl7
IC5jb21wYXRpYmxlID0gImZzbCxsczEwMjhhLWZ0bS1hbGFybSIsIH0sDQo+ICsJeyAuY29tcGF0
aWJsZSA9ICJmc2wsbHgyMTYwYS1mdG0tYWxhcm0iLCB9LA0KPiAgCXsgfSwNCj4gIH07DQo+ICAN
Cg0KU2luY2UgdGhlcmUncyBubyBkYXRhIGFzc29jaWF0ZWQgd2l0aCBlYWNoIGNvbXBhdGlibGUs
IGl0IGRvZXNuJ3Qgc2VlbQ0KbGlrZSB0aGVyZSdzIGFueSBuZWVkIHRvIGFkZCBhIG5ldyBvbmUu
DQoNCldoYXQncyBub3JtYWxseSBkb25lIGlzIGFkZCB0d28gY29tcGF0aWJsZXMgaW4gdGhlIGR0
cywgdGhlIGJhc2UNCnZlcnNpb24gYW5kIHRoZSBzcGVjaWZpYyB2ZXJzaW9uLCBlLmcuOg0KDQor
CQlyY3BtOiByY3BtQDFlMzQwNDAgew0KKwkJCWNvbXBhdGlibGUgPSAiZnNsLGx4MjE2MGEtcmNw
bSIsICJmc2wscW9yaXEtY3BtLTIuMSsiOw0KDQpPciBpbiB0aGlzIGNhc2UsIGNvbXBhdGlibGUg
PSAiZnNsLGx4MjE2MGEtZnRtLWFsYXJtIiwgImZzbCxsczEwODhhLWZ0bS1hbGFybSI7DQoNClRo
ZW4gdGhlcmUncyBubyBuZWVkIHRvIGFkZCB0byB0aGUgZHJpdmVyIGxpc3Qu

