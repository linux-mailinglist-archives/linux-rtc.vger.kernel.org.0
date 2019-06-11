Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66BC941671
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2019 22:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406162AbfFKUvq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 11 Jun 2019 16:51:46 -0400
Received: from us-smtp-delivery-168.mimecast.com ([63.128.21.168]:54829 "EHLO
        us-smtp-delivery-168.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2406104AbfFKUvp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 11 Jun 2019 16:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=impinj.com;
        s=mimecast20190405; t=1560286303;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tZJI8JGdaiRefhCxahVuZzeWNJpxVME+msCpQoaQ87U=;
        b=EsPllGjfVGLilLLuZrN6tRKbPB/vhHc8ANG/KJcw8zwVMxABIFnjNzL2cKvW9p6vyePq6c
        LylHxv4Y69YpahLvXkKnZJj1QumKKn/ap5PJQtwopAUIntZUbqCWbDradygFNw2duiYxd/
        GynTsRVFbWTZJx2qeTnH6rNgv+4IZe8=
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2056.outbound.protection.outlook.com [104.47.38.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-bdqTYNRGMlySrZspClMRyw-1; Tue, 11 Jun 2019 16:45:35 -0400
Received: from MWHPR0601MB3708.namprd06.prod.outlook.com (10.167.236.38) by
 MWHPR0601MB3673.namprd06.prod.outlook.com (10.167.236.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Tue, 11 Jun 2019 20:45:31 +0000
Received: from MWHPR0601MB3708.namprd06.prod.outlook.com
 ([fe80::88d1:40e0:d1be:1daf]) by MWHPR0601MB3708.namprd06.prod.outlook.com
 ([fe80::88d1:40e0:d1be:1daf%7]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 20:45:31 +0000
From:   Trent Piepho <tpiepho@impinj.com>
To:     "festevam@gmail.com" <festevam@gmail.com>,
        "Anson.Huang@nxp.com" <Anson.Huang@nxp.com>
CC:     "aisheng.dong@nxp.com" <aisheng.dong@nxp.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "Linux-imx@nxp.com" <Linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "daniel.baluta@nxp.com" <daniel.baluta@nxp.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Subject: Re: [PATCH 2/3] rtc: imx-sc: Make compatible string more generic
Thread-Topic: [PATCH 2/3] rtc: imx-sc: Make compatible string more generic
Thread-Index: AQHVIB9pLfrzWsaWqUqp88lz3VFaBaaW6UGAgAADtgA=
Date:   Tue, 11 Jun 2019 20:45:31 +0000
Message-ID: <1560285930.2354.8.camel@impinj.com>
References: <20190611063333.48501-1-Anson.Huang@nxp.com>
         <20190611063333.48501-2-Anson.Huang@nxp.com>
         <CAOMZO5BCuBKHs1jXkm3qFD84_xcB=0NSwE3SLJHx9kq4Stbd_A@mail.gmail.com>
In-Reply-To: <CAOMZO5BCuBKHs1jXkm3qFD84_xcB=0NSwE3SLJHx9kq4Stbd_A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [216.207.205.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53857865-7ec4-436d-3cd9-08d6eeadbecd
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR0601MB3673;
x-ms-traffictypediagnostic: MWHPR0601MB3673:
x-microsoft-antispam-prvs: <MWHPR0601MB367358AF176EFC206A27CFC8D3ED0@MWHPR0601MB3673.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(396003)(366004)(39850400004)(376002)(136003)(346002)(189003)(199004)(86362001)(6506007)(53546011)(8676002)(81166006)(81156014)(102836004)(25786009)(478600001)(6486002)(26005)(68736007)(186003)(316002)(256004)(229853002)(99286004)(76176011)(14444005)(66066001)(6512007)(5660300002)(14454004)(8936002)(53936002)(54906003)(110136005)(6246003)(2906002)(6436002)(66946007)(76116006)(66556008)(64756008)(91956017)(66476007)(73956011)(66446008)(3846002)(6116002)(7416002)(446003)(4326008)(103116003)(476003)(486006)(2616005)(11346002)(71190400001)(2501003)(71200400001)(7736002)(36756003)(305945005)(41533002)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR0601MB3673;H:MWHPR0601MB3708.namprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nFppgJnFMfNsTzT7QOgDM8RaEWMgvIXCTUG7RUzqPPzP2/6BlOV9gkZOnGVrO7z35ws9LrMY/tOJyPt653iw83mK4uVLEw2VEDb/4Gr8m1jeiV49zS+gJjm10ScxrCoBioK1ejd8x2oaJjBEBRzyH/tsmKCpTOKc8k/h6ZAZaf7V5xsnGsqVD1DFbCqqCMFseK+pzzi44zb2EpeMZ2oZWWS37rhFJgyPzVCuzFFiAnu0+Reup6Irc7M6pvDGVo0Q+uvZGvk7F1LaGNeQLzLavPyKgmxTaUoU1p/vb6m7vemuoQ4eeREnmNEA1bx9pLGfjuQ3MaR9TbuHVjvtc4Q7ldlnLwIMQNvKJSrFDPaLC/9vsqBo6ko8//n9ClFiV+8hTSx0O4za5G4W1uWLWIjPxqvUaT26ZLqyvIpZJHO5XY8=
Content-ID: <DC1328CED465FC4189CCE1BF075530CC@namprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: impinj.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53857865-7ec4-436d-3cd9-08d6eeadbecd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 20:45:31.4759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6de70f0f-7357-4529-a415-d8cbb7e93e5e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tpiepho@impinj.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0601MB3673
X-MC-Unique: bdqTYNRGMlySrZspClMRyw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gVHVlLCAyMDE5LTA2LTExIGF0IDE3OjMyIC0wMzAwLCBGYWJpbyBFc3RldmFtIHdyb3RlOg0K
PiBIaSBBbnNvbiwNCj4gDQo+IE9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0IDM6MzEgQU0gPEFuc29u
Lkh1YW5nQG54cC5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IEZyb206IEFuc29uIEh1YW5nIDxBbnNv
bi5IdWFuZ0BueHAuY29tPg0KPiA+IA0KPiA+IGkuTVggc3lzdGVtIGNvbnRyb2xsZXIgUlRDIGRy
aXZlciBjYW4gc3VwcG9ydCBhbGwgaS5NWCBTb0NzDQo+ID4gd2l0aCBzeXN0ZW0gY29udHJvbGxl
ciBpbnNpZGUsIHRoaXMgcGF0Y2ggbWFrZXMgdGhlIGNvbXBhdGlibGUNCj4gPiBzdHJpbmcgbW9y
ZSBnZW5lcmljIHRvIHN1cHBvcnQgb3RoZXIgaS5NWCBTb0NzIHdpdGggc3lzdGVtDQo+ID4gY29u
dHJvbGxlciBpbnNpZGUsIHN1Y2ggYXMgaS5NWDhRTSBldGMuLg0KPiA+IA0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBk
cml2ZXJzL3J0Yy9ydGMtaW14LXNjLmMgfCAyICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3J0Yy9ydGMtaW14LXNjLmMgYi9kcml2ZXJzL3J0Yy9ydGMtaW14LXNjLmMNCj4gPiBpbmRleCBj
OTMzMDQ1Li4zOGVmM2NhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvcnRjL3J0Yy1pbXgtc2Mu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvcnRjL3J0Yy1pbXgtc2MuYw0KPiA+IEBAIC0xNzgsNyArMTc4
LDcgQEAgc3RhdGljIGludCBpbXhfc2NfcnRjX3Byb2JlKHN0cnVjdA0KPiA+IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikNCj4gPiAgfQ0KPiA+IA0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBpbXhfc2NfZHRfaWRzW10gPSB7DQo+ID4gLSAgICAgICB7IC5jb21wYXRpYmxlID0g
ImZzbCxpbXg4cXhwLXNjLXJ0YyIsIH0sDQo+ID4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gImZz
bCxpbXgtc2MtcnRjIiwgfSwNCj4gDQo+IFdoYXQgaXMgd3Jvbmcgd2l0aCB0aGUgY3VycmVudCBj
b21wYXRpYmxlIHN0cmluZz8NCj4gDQo+IElmIHlvdSB3YW50IHRvIHN1cHBvcnQgaS5NWDhRTSBq
dXN0IGFkZCBpbiBpdHMgZHRzaToNCj4gDQo+IGNvbXBhdGlibGUgPSAiZnNsLGlteDhxbS1zYy1y
dGMiLCAiZnNsLGlteDhxeHAtc2MtcnRjIg0KPiANCj4gYW5kIGFkZCBhIGR0LWJpbmRpbmdzIGVu
dHJ5IGZvciAiZnNsLGlteDhxbS1zYy1ydGMiDQoNClllcywgSSB0aG91Z2h0IHRoaXMgaXMgKHdh
cz8pIHRoZSByZWNvbW1lbmRlZCBwcmFjdGljZSBmb3IgSVAgYmxvY2tzIGluDQpTb0NzIHRoYXQg
ZG9uJ3QgaGF2ZSB0aGVpciBvd24gdmVyc2lvbiAodnMgc29tZXRoaW5nIGxpa2UgYSBTeW5vcHNp
cw0KYmxvY2sgdXNlZCBtYW55IHBsYWNlcyk6DQoNCiogVXNlIHRoZSBmaXJzdCBTb0MgdG8gaGF2
ZSB0aGUgYmxvY2sgYXMgdGhlIGJhc2UgY29tcGF0aWJsZSBmb3IgdGhlDQpibG9jay4NCiogQWx3
YXlzIGFkZCB0aGUgY3VycmVudCBTb0MsIGluIGFkZGl0aW9uYWwgdG8gdGhlIGJhc2UsIGluIHRo
ZSBTb0Mncw0KZHRzJ3MgbGlzdCBvZiBjb21wYXRpYmxlcy4gIEV2ZW4gaWYgdW5uZWVkZWQgYXQg
dGhlIHByZXNlbnQuDQoqIFRoZSBkcml2ZXIgd2lsbCBsaXN0IHRoZSBiYXNlIGNvbXBhdGlibGUg
aW4gdGhlIG1hdGNoIHRhYmxlLCBhbmQgd2lsbA0KYWRkIG5ldyBvbmVzIGZvciBzcGVjaWZpYyBz
b2NzIGlmL3doZW4gdGhlcmUgaXMgYSBuZWVkIGZvciBpdC4NCg==

