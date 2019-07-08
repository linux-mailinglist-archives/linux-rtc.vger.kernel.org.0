Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B04361F84
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Jul 2019 15:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731267AbfGHNYx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 8 Jul 2019 09:24:53 -0400
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:54084 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731258AbfGHNYx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 8 Jul 2019 09:24:53 -0400
X-AuditID: c0a8fbf4-519ff700000014c1-af-5d234423726f
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id DF.DA.05313.324432D5; Mon,  8 Jul 2019 15:24:51 +0200 (CEST)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Mon, 8 Jul 2019 15:24:39 +0200
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
Subject: Re: [PATCH] rtc: bd70528: fix link error
Thread-Topic: [PATCH] rtc: bd70528: fix link error
Thread-Index: AQHVNYqcYstSvLPbPUmgdDecItnyFKbAlGyA
Date:   Mon, 8 Jul 2019 13:24:38 +0000
Message-ID: <e752a638c0bde6893adf805322f73de5bd459dbc.camel@fi.rohmeurope.com>
References: <20190708124227.3422311-1-arnd@arndb.de>
In-Reply-To: <20190708124227.3422311-1-arnd@arndb.de>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [84.253.205.146]
Content-Type: text/plain; charset="utf-8"
Content-ID: <003471E6B53F14468C01AF6F93C58411@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupik+LIzCtJLcpLzFFi42I5sOL3Jl1lF+VYg2s3VC2WXLzKbtH+bhm7
        xd9Jx9gt7n89ymhxedccNotjq6+wObB5/P41idFj3ppqjzvX9rB5TJ/3k8nj8ya5ANYobpuk
        xJKy4Mz0PH27BO6Mt32H2QoOSVRsnrWHvYHxg3gXIyeHhICJxOy3LewgtpDANUaJeXNcIOzj
        jBK9l2y7GDk42ARsJLpuApVwcYgITGeUuPNiIyuIwyywllFiSfcRsGZhAUOJNd13mUAaRASM
        JK51VYKEQcybl46ClbAIqEgsWf6IFcTmFfCTuNa4mg1il4nErolTWUBsTgFTiX3bZoHFGQVk
        JTob3jGB2MwC4hKbnn1nhbhZQGLJnvPMELaoxMvH/6DiShIbD+1jAzmBWUBTYv0ufYhWB4lt
        k04xQ9iKElO6H7JDnCAocXLmE5YJjGKzkGyYhdA9C0n3LCTds5B0L2BkXcUokZuYmZOeWJJq
        qFeUWqpXlJ+RC6SS83M3MUJi88sOxv+HPA8xCnAwKvHwHrJTjhViTSwrrsw9xCjJwaQkyhuS
        Kh8rxJeUn1KZkVicEV9UmpNafIhRgoNZSYQ3MQgox5uSWFmVWpQPk5LmYFES51Xj/RUjJACy
        OTs1tSC1CCYrw8GhJMHr5wS0R7AoNT21Ii0zpwQhzcTBCTKcS0qkODUvJbUosbQkIx6UVuKL
        gYkFJMUDtLcSpJ23uCAxFygK0XqKUZtjwsu5i5g5jsxduohZiCUvPy9VSpy3HqRUAKQ0ozQP
        btErRnGgf4V5v4BkeYAJHG7OK6AVTEAr6iKVQFaUJCKkpBoYd688NpN33eIzrO1sG5yLH531
        fivMvzohfy1HxoSTS+658nI99XdQXVcif6Wibde291OM1qtn8peGb5V/pt9/me091+XCsBtM
        PpG685nZjjx0WP626oPq75/nKi4dZ1TJbbeo2BV24NXslOpfrwXX8/fIPmzKt1/b+qDk0erX
        Zu73zFRZlX6pKrEUZyQaajEXFScCACY/g9WdAwAA
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGVsbG8gQXJuZCwNCg0KVGhhbmtzIGZvciB0YWtpbmcgYSBsb29rIG9uIHRoaXMhDQoNCk9uIE1v
biwgMjAxOS0wNy0wOCBhdCAxNDo0MSArMDIwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToNCj4gV2l0
aCBDT05GSUdfQkQ3MDUyOF9XQVRDSERPRz1tLCBhIGJ1aWx0LWluIHJ0YyBkcml2ZXIgY2Fubm90
IGNhbGwNCj4gaW50byB0aGUgbG93LWxldmVsIGZ1bmN0aW9ucyB0aGF0IGFyZSBwYXJ0IG9mIHRo
ZSB3YXRjaGRvZyBtb2R1bGU6DQo+IA0KPiBkcml2ZXJzL3J0Yy9ydGMtYmQ3MDUyOC5vOiBJbiBm
dW5jdGlvbiBgYmQ3MDUyOF9zZXRfdGltZSc6DQo+IHJ0Yy1iZDcwNTI4LmM6KC50ZXh0KzB4MjJj
KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0bw0KPiBgYmQ3MDUyOF93ZHRfbG9jaycNCj4gcnRjLWJk
NzA1MjguYzooLnRleHQrMHgyYTgpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvDQo+IGBiZDcwNTI4
X3dkdF91bmxvY2snDQo+IGRyaXZlcnMvcnRjL3J0Yy1iZDcwNTI4Lm86IEluIGZ1bmN0aW9uDQo+
IGBiZDcwNTI4X3NldF9ydGNfYmFzZWRfdGltZXJzJzoNCj4gcnRjLWJkNzA1MjguYzooLnRleHQr
MHg1MGMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBiZDcwNTI4X3dkdF9zZXQnDQo+IA0KPiBB
ZGQgYSBLY29uZmlnIGRlcGVuZGVuY3kgb24gdGhpcyBkcml2ZXIsIGJ1dCBzdGlsbCBhbGxvdyBj
b21waWxlLQ0KPiB0ZXN0aW5nDQo+IHdpdGhvdXQgaXQuDQo+IA0KPiBGaXhlczogMzJhNGE0ZWJm
NzY4ICgicnRjOiBiZDcwNTI4OiBJbml0aWFsIHN1cHBvcnQgZm9yIFJPSE0gYmQ3MDUyOA0KPiBS
VEMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiAt
LS0NCj4gIGRyaXZlcnMvcnRjL0tjb25maWcgfCAyICsrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvS2NvbmZpZyBiL2Ry
aXZlcnMvcnRjL0tjb25maWcNCj4gaW5kZXggM2JmYzA0YTg2NTI5Li43YjA3MWNjNzQ0MjIgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvcnRjL0tjb25maWcNCj4gKysrIGIvZHJpdmVycy9ydGMvS2Nv
bmZpZw0KPiBAQCAtNDk4LDggKzQ5OCwxMCBAQCBjb25maWcgUlRDX0RSVl9NNDFUODBfV0RUDQo+
ICAJaGVscA0KPiAgCSAgSWYgeW91IHNheSBZIGhlcmUgeW91IHdpbGwgZ2V0IHN1cHBvcnQgZm9y
IHRoZQ0KPiAgCSAgd2F0Y2hkb2cgdGltZXIgaW4gdGhlIFNUIE00MVQ2MCBhbmQgTTQxVDgwIFJU
QyBjaGlwcyBzZXJpZXMuDQo+ICsNCj4gIGNvbmZpZyBSVENfRFJWX0JENzA1MjgNCj4gIAl0cmlz
dGF0ZSAiUk9ITSBCRDcwNTI4IFBNSUMgUlRDIg0KPiArCWRlcGVuZHMgb24gQkQ3MDUyOF9XQVRD
SERPRyB8fCAoQ09NUElMRV9URVNUICYmDQo+ICFCRDcwNTI4X1dBVENIRE9HKQ0KDQpJIGFtIG5v
dCBmYW4gb2YgdGhpcy4gVGhlcmUgbWF5IHdlbGwgYmUgdXNlLWNhc2VzIHdoZXJlIGl0IGlzIGRl
c2lyYWJsZQ0KdG8gbGVhdmUgdGhlIHdhdGNoZG9nIG91dCBidXQgc3RpbGwgY29tcGlsZSBpbiB0
aGUgUlRDLiBUaGlzIGlzIHdoeSB3ZQ0KaGF2ZSBzdGF0aWMgaW5saW5lIHN0dWJzIGluIHRoZSBo
ZWFkZXIgZm9yIGNhc2VzIHdoZXJlIFdERyBpcyBub3QNCmNvbXBpbGVkIGluLiAoUlRDIGRvZXMg
bm90IG5lZWQgdG8gc3RvcCBXREcgaWYgV0RHIGRyaXZlciBpcyBub3QNCmluY2x1ZGVkKQ0KDQpB
ZGRpbmcgZGVwZW5kZW5jeSBmcm9tIFJUQyB0byBNRkQgZm9yIEJENzA1Mjggc2hvdWxkIGJlIGRv
bmUgLSB0aGlzDQp3aWxsIGF2b2lkIG1vc3Qgb2YgdGhlIGlzc3VlcyAoQW5kIHRoZXJlIGhhcyBi
ZWVuIGZldyBwYXRjaGVzIHNlbnQgZm9yDQp0aGlzIGFscmVhZHkpLiBCdXQgdGhhdCdzIHN0aWxs
IG5vdCBjb21wbGV0ZSBzb2x1dGlvbiBiZWNhdXNlDQpjb25maWd1cmluZyBSVEMgYW5kIE1GRCB0
byBiZSBidWlsdCBpbi1rZXJuZWwgYW5kIFdERyBhcyBhIG1vZHVsZSB3aWxsDQpjYXVzZSBlcnJv
cnMgYWdhaW4uDQoNCklzIHRoZXJlIGEgd2F5IHRvIGZvcmNlIFdERyBpbi1rZXJuZWwgaWYgUlRD
IGlzIGluLWtlcm5lbD8gKE9yDQpkaXNhbGxvdyBjb25maWd1cmluZyBSVEMgaW4ta2VybmVsIGlm
IFdERyBpcyBhIG1vZHVsZSAtIHdoaWxlIHN0aWxsDQphbGxvdyBSVEMgdG8gYmUgYnVpbHQgd2l0
aG91dCBXREc/DQoNCj4gIAloZWxwDQo+ICAJICBJZiB5b3Ugc2F5IFkgaGVyZSB5b3Ugd2lsbCBn
ZXQgc3VwcG9ydCBmb3IgdGhlIFJUQw0KPiAgCSAgb24gUk9ITSBCRDcwNTI4IFBvd2VyIE1hbmFn
ZW1lbnQgSUMuDQo=
