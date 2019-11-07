Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C453EF2DAF
	for <lists+linux-rtc@lfdr.de>; Thu,  7 Nov 2019 12:46:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387468AbfKGLq2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 Nov 2019 06:46:28 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:56072 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbfKGLq1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 7 Nov 2019 06:46:27 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-23-5dc404112071
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id C4.C3.08102.11404CD5; Thu,  7 Nov 2019 12:46:25 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Thu, 7 Nov 2019 12:46:19 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] rtc: bd70528: Fix hour register mask
Thread-Topic: [PATCH 2/2] rtc: bd70528: Fix hour register mask
Thread-Index: AQHViZe1CIODvWe7/UeE9phbEbZ57Kd8zxeAgALB6ICAAAz+gA==
Date:   Thu, 7 Nov 2019 11:46:19 +0000
Message-ID: <0accbfe75df7b0b72f6880474d9013aad89daae6.camel@fi.rohmeurope.com>
References: <20191023114751.GA14100@localhost.localdomain>
         <20191105165317.GC8309@piout.net> <20191107105949.GA19195@dell>
In-Reply-To: <20191107105949.GA19195@dell>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8B02CB91A364B4AB5DDD44050772FD7@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLKsWRmVeSWpSXmKPExsVyYMXvjbqCLEdiDfoOCVosuXiV3aL93TJ2
        i/tfjzJaXN41h83i2OorbBZzlp5gcWDzmLem2mPnrLvsHneu7WHzmD7vJ5PH501yAaxR3DZJ
        iSVlwZnpefp2CdwZb6ZcYSp4wVWx6NMS1gbGI1xdjJwcEgImEp///WHvYuTiEBK4yihx4swc
        JgjnOKNEy/FPzF2MHBxsAjYSXTfZQRpEBEokjk85DVbDLPCMUaK97wErSI2wgK3Er9lGEDV2
        EpfetzND2E4SH780s4LYLAIqEsdfLAeL8wr4Sbw+1wM2U0igVqLj3ycmEJtTQEvi2bltbCA2
        o4CsRGfDO7A4s4C4xKZn31khjhaQWLLnPDOELSrx8vE/qLiSxN6fD1lAzmEW0JRYv0sfotVB
        4kXjHjYIW1FiSvdDdogTBCVOznzCMoFRbBaSDbMQumch6Z6FpHsWku4FjKyrGCVyEzNz0hNL
        Ug31ilJL9YryM3KBVHJ+7iZGSHR+2cH4/5DnIUYmDsZDjJIcTEqivMaHDsUK8SXlp1RmJBZn
        xBeV5qQWH2KU4GBWEuGN6TsYK8SbklhZlVqUD5OS5mBREudVfzgxVkgAZFd2ampBahFMVoaD
        Q0mC9znTkVghwaLU9NSKtMycEoQ0EwcnyHAuKZHi1LyU1KLE0pKMeFDyiC8Gpg+QFA/Q3rkg
        7bzFBYm5QFGI1lOM2hwTXs5dxMxxZO7SRcxCLHn5ealS4ry/QUoFQEozSvPgFr1iFOdgVBLm
        fcwIlOUBpmm4Oa+AVjABrTC4cQhkRUkiQkqqgTFghsU19wXhN/QeSL1f5nXlQXlhZOtX3jvL
        i9dfZylPXSzFF6Pes/FRqXT9w+l8tfyrxbN6Fq6dxPiAedLE16d+Xv8QveOP5S2Vkp93vLet
        XbPyyv7Zzxg0mZk77Bw/OQaqaSYs8rqYwVpjxtF7+O0d/mfsbzqF2PsO3jmue/CN7tdzy4Ju
        +S5SYinOSDTUYi4qTgQAkgLH05ADAAA=
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gVGh1LCAyMDE5LTExLTA3IGF0IDEwOjU5ICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6DQo+IE9u
IFR1ZSwgMDUgTm92IDIwMTksIEFsZXhhbmRyZSBCZWxsb25pIHdyb3RlOg0KPiANCj4gPiBPbiAy
My8xMC8yMDE5IDE0OjQ3OjUxKzAzMDAsIE1hdHRpIFZhaXR0aW5lbiB3cm90ZToNCj4gPiA+IFdo
ZW4gUlRDIGlzIHVzZWQgaW4gMjRIIG1vZGUgKGFuZCBpdCBpcyBieSB0aGlzIGRyaXZlcikgdGhl
DQo+ID4gPiBtYXhpbXVtDQo+ID4gPiBob3VyIHZhbHVlIGlzIDI0IGluIEJDRC4gVGhpcyBvY2N1
cGllcyBiaXRzIFs1OjBdIC0gd2hpY2ggbWVhbnMNCj4gPiA+IGNvcnJlY3QgbWFzayBmb3IgSE9V
UiByZWdpc3RlciBpcyAweDNmIG5vdCAweDFmLiBGaXggdGhlIG1hc2sNCj4gPiA+IA0KPiA+ID4g
Rml4ZXM6IDMyYTRhNGViZjc2OCAoInJ0YzogYmQ3MDUyODogSW5pdGlhbCBzdXBwb3J0IGZvciBS
T0hNDQo+ID4gPiBiZDcwNTI4IFJUQyIpDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aSBWYWl0
dGluZW4gPG1hdHRpLnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbQ0KPiA+ID4gPg0KPiA+ID4g
LS0tDQo+ID4gPiAgaW5jbHVkZS9saW51eC9tZmQvcm9obS1iZDcwNTI4LmggfCAyICstDQo+ID4g
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiAN
Cj4gPiBBcHBsaWVkLCB0aGFua3MuDQo+IA0KPiBZb3UgaGF2ZSBiZWVuIGR1cGVkLiBUaGlzIGlz
IGNsZWFybHkgbm90IGFuIFJUQyBwYXRjaC4NCg0KU29ycnkuIE15IGJhZC4gSSB1c2VkIHRoZSBy
dGM6IHByZWZpeCBhcyB0aGlzIGNsZWFybHkgaXMgUlRDIGZpeCAtDQphbHRob3VnaCB0aGUgaGVh
ZGVyIG1heSBiZSBNRkQgdGVycml0b3J5LiBJIHNob3VsZCBoYXZlIGtub3duIHRoYXQNCm1haW50
YWluaW5nIGlzIGRvbmUgcGVyIGZpbGUgYmFzaXMuIEkgdHJ5IHRvIGJlIG1vcmUgY2FyZWZ1bCBp
biB0aGUNCmZ1dHVyZS4NCg0KQnIsDQoJTWF0dGkgVmFpdHRpbmVuDQo=
