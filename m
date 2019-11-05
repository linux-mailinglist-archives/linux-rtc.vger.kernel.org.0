Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8E08F04C5
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Nov 2019 19:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390571AbfKESNK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 Nov 2019 13:13:10 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:52076 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388711AbfKESNK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 Nov 2019 13:13:10 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-a9-5dc1bbb37621
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 8B.97.08102.3BBB1CD5; Tue,  5 Nov 2019 19:13:08 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Tue, 5 Nov 2019 19:13:07 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
Subject: Re: [PATCH 2/2] rtc: bd70528: Fix hour register mask
Thread-Topic: [PATCH 2/2] rtc: bd70528: Fix hour register mask
Thread-Index: AQHViZe1CIODvWe7/UeE9phbEbZ57Kd8zxeAgAABJYCAABUoAA==
Date:   Tue, 5 Nov 2019 18:13:07 +0000
Message-ID: <da654ce1fc62ae4e4a5e1f79b68a0d64353cba4a.camel@fi.rohmeurope.com>
References: <20191023114751.GA14100@localhost.localdomain>
         <20191105165317.GC8309@piout.net> <20191105165723.GD8309@piout.net>
In-Reply-To: <20191105165723.GD8309@piout.net>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [176.93.201.147]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D28510E20B61D14CA40CB3F580A30A86@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHKsWRmVeSWpSXmKPExsVyYMXvTbpbdh+MNdjxi9liycWr7Bbt75ax
        W9z/epTR4vKuOWwWx1ZfYbOYs/QEiwObx7w11R47Z91l97hzbQ+bx/R5P5k8Pm+SC2CN4rZJ
        SiwpC85Mz9O3S+DO+H6njangFG/F5TXHWRsY5/B2MXJySAiYSCyZM4uxi5GLQ0jgKqPEhEeL
        mSCc44wSy34/Zu9i5OBgE7CR6LrJDtIgIuAsMe98GwtIDbPAVCaJt39WsIHUCAvYSvyabQRR
        Yydx6X07M4TtJLFu8R02EJtFQEViTcN+FhCbV8BP4vbldVC7Ghkl1r/bBFbEKaAncfHWXrBl
        jAKyEp0N75hAbGYBcYlNz76zQlwtILFkz3lmCFtU4uXjf1BxJYk9P0Ee4ACq15RYv0sfotVB
        4t/9aewQtqLElO6H7BA3CEqcnPmEZQKj2CwkG2YhdM9C0j0LSfcsJN0LGFlXMUrkJmbmpCeW
        pBrqFaWW6hXlZ+QCqeT83E2MkPj8soPx/yHPQ4xMHIyHGCU5mJREeb0yD8YK8SXlp1RmJBZn
        xBeV5qQWH2KU4GBWEuGN6QPK8aYkVlalFuXDpKQ5WJTEedUfTowVEgDZlZ2aWpBaBJOV4eBQ
        kuB9vgOoUbAoNT21Ii0zpwQhzcTBCTKcS0qkODUvJbUosbQkIx6UPuKLgQkEJMUDtNd7J8je
        4oLEXKAoROspRm2OCS/nLmLmODJ36SJmIZa8/LxUKXGIUgGQ0ozSPLhFrxjFORiVhHlPg2R5
        gIkabs4roBVMQCt8Hu8DWVGSiJCSamCMSfrqrF5g+EmziFd+ssKTlsObznSldVbx8iwT5y0+
        cvbnsRfiib7ZAv1qt1kKYwveS796NLn3Nf/vrXbfD7f13XYRdO6cUZB1zENa1bWo6a4791fu
        00eYuydPEPlvmNbcGuugtZZRNtQqUr3g6elbDP+eVjx9e/bL6cRV+fXXC0ztrvKZn1diKc5I
        NNRiLipOBABFQh79kQMAAA==
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGVsbG8gQWxleGFuZHJlLA0KDQpJJ2QgZXhwZWN0IHRoZSBCRDcxODI4IHN1cHBvcnQgdG8gc3Rp
bGwgdGFrZSBhIHdoaWxlLiBJIGRvbid0IGV4cGVjdCBpdA0KdG8gbGFuZCBpbiBuZXh0IGtlcm5l
bCByZWxlYXNlLiBJJ2QgcHJlZmVyIGdldHRpbmcgdGhpcyBmaXggaW4gbm93IChhbmQNCkkgaG9w
ZSBpdCBtaWdodCBhbHNvIGdldCBtZXJnZWQgdG8gZWFybGllciByZWxlYXNlcyBieSB0aGUgJ2Zp
eGVzJw0KdGFnKS4gU28gaWYgaXQncyBub3QgYSBwcm9ibGVtIGZvciB5b3UgdGhlbiBwbGVhc2Ug
YXBwbHkgdGhpcyBmaXggbm93IC0NCkkgY2FuIHJlYmFzZSB0aGUgQkQ3MTgyOCBzdXBwb3J0IHdo
ZW4gdGhpcyBmaXggaXMgb3V0IDopDQoNCkJyLA0KCU1hdHRpIFZhaXR0aW5lbg0KDQpPbiBUdWUs
IDIwMTktMTEtMDUgYXQgMTc6NTcgKzAxMDAsIEFsZXhhbmRyZSBCZWxsb25pIHdyb3RlOg0KPiBP
biAwNS8xMS8yMDE5IDE3OjUzOjE4KzAxMDAsIEFsZXhhbmRyZSBCZWxsb25pIHdyb3RlOg0KPiA+
IE9uIDIzLzEwLzIwMTkgMTQ6NDc6NTErMDMwMCwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0KPiA+
ID4gV2hlbiBSVEMgaXMgdXNlZCBpbiAyNEggbW9kZSAoYW5kIGl0IGlzIGJ5IHRoaXMgZHJpdmVy
KSB0aGUNCj4gPiA+IG1heGltdW0NCj4gPiA+IGhvdXIgdmFsdWUgaXMgMjQgaW4gQkNELiBUaGlz
IG9jY3VwaWVzIGJpdHMgWzU6MF0gLSB3aGljaCBtZWFucw0KPiA+ID4gY29ycmVjdCBtYXNrIGZv
ciBIT1VSIHJlZ2lzdGVyIGlzIDB4M2Ygbm90IDB4MWYuIEZpeCB0aGUgbWFzaw0KPiA+ID4gDQo+
ID4gPiBGaXhlczogMzJhNGE0ZWJmNzY4ICgicnRjOiBiZDcwNTI4OiBJbml0aWFsIHN1cHBvcnQg
Zm9yIFJPSE0NCj4gPiA+IGJkNzA1MjggUlRDIikNCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1hdHRp
IFZhaXR0aW5lbiA8bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tDQo+ID4gPiA+DQo+
ID4gPiAtLS0NCj4gPiA+ICBpbmNsdWRlL2xpbnV4L21mZC9yb2htLWJkNzA1MjguaCB8IDIgKy0N
Cj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4g
PiA+IA0KPiA+IEFwcGxpZWQsIHRoYW5rcy4NCj4gPiANCj4gDQo+IEFjdHVhbGx5LCBpcyB0aGVy
ZSBhbnkgcG9pbnQgaW4gZG9pbmcgdGhhdCBzaW5jZSAicnRjOiBiZDcwNTI4IGFkZA0KPiBCRDcx
ODI4IHN1cHBvcnQiIHdpbGwgY29uZmxpY3Qgd2l0aCBpdCBhbmQgY29ycmVjdCB0aGUgaXNzdWUg
YW55d2F5Pw0KPiANCg0K
