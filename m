Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E736462FEA
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Jul 2019 07:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbfGIFZ5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 9 Jul 2019 01:25:57 -0400
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:57504 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbfGIFZ5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 9 Jul 2019 01:25:57 -0400
X-AuditID: c0a8fbf4-501ff700000014c1-89-5d24256267f8
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 60.4E.05313.265242D5; Tue,  9 Jul 2019 07:25:55 +0200 (CEST)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Tue, 9 Jul 2019 07:25:51 +0200
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "arnd@arndb.de" <arnd@arndb.de>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>
Subject: Re: [PATCH] rtc: bd70528: fix link error
Thread-Topic: [PATCH] rtc: bd70528: fix link error
Thread-Index: AQHVNYqcYstSvLPbPUmgdDecItnyFKbAlGyAgAAuWQCAAN4rAA==
Date:   Tue, 9 Jul 2019 05:25:50 +0000
Message-ID: <e1687224a155787d9f3c042dca1c03a81b89ed25.camel@fi.rohmeurope.com>
References: <20190708124227.3422311-1-arnd@arndb.de>
         <e752a638c0bde6893adf805322f73de5bd459dbc.camel@fi.rohmeurope.com>
         <CAK8P3a1HNnstePcreH-ZLyiJi3tNcCNJ=VozZUMnp-VLvYLSaA@mail.gmail.com>
In-Reply-To: <CAK8P3a1HNnstePcreH-ZLyiJi3tNcCNJ=VozZUMnp-VLvYLSaA@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [84.253.205.146]
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C0FFF9D8B531940B5EDBBEAFE95AAA2@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCJsWRmVeSWpSXmKPExsVyYMXvjbrJqiqxBlM2M1ssuXiV3aL93TJ2
        i7+TjrFb3P96lNHi8q45bBbHVl9hs3h7ZzqLA7vH71+TGD3mran22LxCy+POtT1sHtPn/WTy
        +LxJLoAtitsmKbGkLDgzPU/fLoE74+/lZqaCFSoVT85tY25g3KDcxcjJISFgItG5YjVzFyMX
        h5DANUaJeY8fMkI4xxkl2lZuZ+li5OBgE7CR6LrJDtIgIqAssXvCekYQm1ngEpPEzr/RILaw
        gKHEmu67TCDlIgJGEte6KiHKnSSWT5zFCmKzCKhIbD03kQ3E5hXwk3i18z3UqkOMEnemQhRx
        CgRKLL3znBnEZhSQlehseMcEsUtcYtOz76wQRwtILNlznhnCFpV4+fgfVFxJYuOhfWwgNzAL
        aEqs36UP0eog8epMN9TJihJTuh+yQ9wgKHFy5hOWCYxis5BsmIXQPQtJ9ywk3bOQdC9gZF3F
        KJGbmJmTnliSaqhXlFqqV5SfkQukkvNzNzFC4vXLDsb/hzwPMQpwMCrx8DoLqMQKsSaWFVfm
        HmKU5GBSEuWNi1KOFeJLyk+pzEgszogvKs1JLQYGCwezkgjvPnegHG9KYmVValE+TEqag0VJ
        nFeN91eMkADI5uzU1ILUIpisDAeHkgTvHRWgPYJFqempFWmZOSUIaSYOTpDhXFIixal5KalF
        iaUlGfGgxBJfDEwtICkeoL0iwKQoxFtckJgLFIVoPcWozTHh5dxFzBxH5i5dxCzEkpeflyol
        zpsOskkApDSjNA9u0StGcaB/hXk1QLI8wKQON+cV0AomoBV1kUogK0oSEVJSDYx5HS82fXs0
        8W3Eit4TCtxzw7i8bj89s3Ja+K7vV9tXBDpf0px4OKCi3Vj679rvfFVqnp3hE7mmt2Ra+mzY
        sf2s4qXIvT8Sk3ztmr4+z1/40u2l+j9+N58pPz2+azwyn5sTrf4hNcRmBV8o9/qbZenWLw+p
        vVrfcKQpN3511Iqy2ed9PEWnHDZRYinOSDTUYi4qTgQAKmXkQqcDAAA=
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGVsbG8gQXJuZCwNCg0KKEFkZGVkIFJhbmR5IHdobyBhbHNvIHNlbnQgYSBwYXRjaCB0byBmaXgg
dGhpcykNCg0KT24gTW9uLCAyMDE5LTA3LTA4IGF0IDE4OjEwICswMjAwLCBBcm5kIEJlcmdtYW5u
IHdyb3RlOg0KPiBPbiBNb24sIEp1bCA4LCAyMDE5IGF0IDM6MjQgUE0gVmFpdHRpbmVuLCBNYXR0
aQ0KPiA8TWF0dGkuVmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPiB3cm90ZToNCj4gDQo+ID4g
T24gTW9uLCAyMDE5LTA3LTA4IGF0IDE0OjQxICswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOg0K
PiA+ID4gV2l0aCBDT05GSUdfQkQ3MDUyOF9XQVRDSERPRz1tLCBhIGJ1aWx0LWluIHJ0YyBkcml2
ZXIgY2Fubm90IGNhbGwNCj4gPiA+IGludG8gdGhlIGxvdy1sZXZlbCBmdW5jdGlvbnMgdGhhdCBh
cmUgcGFydCBvZiB0aGUgd2F0Y2hkb2cNCj4gPiA+IG1vZHVsZToNCj4gPiA+IA0KPiA+ID4gZHJp
dmVycy9ydGMvcnRjLWJkNzA1MjgubzogSW4gZnVuY3Rpb24gYGJkNzA1Mjhfc2V0X3RpbWUnOg0K
PiA+ID4gcnRjLWJkNzA1MjguYzooLnRleHQrMHgyMmMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRv
DQo+ID4gPiBgYmQ3MDUyOF93ZHRfbG9jaycNCj4gPiA+IHJ0Yy1iZDcwNTI4LmM6KC50ZXh0KzB4
MmE4KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0bw0KPiA+ID4gYGJkNzA1Mjhfd2R0X3VubG9jaycN
Cj4gPiA+IGRyaXZlcnMvcnRjL3J0Yy1iZDcwNTI4Lm86IEluIGZ1bmN0aW9uDQo+ID4gPiBgYmQ3
MDUyOF9zZXRfcnRjX2Jhc2VkX3RpbWVycyc6DQo+ID4gPiBydGMtYmQ3MDUyOC5jOigudGV4dCsw
eDUwYyk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8NCj4gPiA+IGBiZDcwNTI4X3dkdF9zZXQnDQo+
ID4gPiANCj4gPiA+IEFkZCBhIEtjb25maWcgZGVwZW5kZW5jeSBvbiB0aGlzIGRyaXZlciwgYnV0
IHN0aWxsIGFsbG93IGNvbXBpbGUtDQo+ID4gPiB0ZXN0aW5nDQo+ID4gPiB3aXRob3V0IGl0Lg0K
PiA+ID4gDQo+ID4gPiBGaXhlczogMzJhNGE0ZWJmNzY4ICgicnRjOiBiZDcwNTI4OiBJbml0aWFs
IHN1cHBvcnQgZm9yIFJPSE0NCj4gPiA+IGJkNzA1MjgNCj4gPiA+IFJUQyIpDQo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiA+ID4gLS0tDQo+ID4g
PiAgZHJpdmVycy9ydGMvS2NvbmZpZyB8IDIgKysNCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9LY29u
ZmlnIGIvZHJpdmVycy9ydGMvS2NvbmZpZw0KPiA+ID4gaW5kZXggM2JmYzA0YTg2NTI5Li43YjA3
MWNjNzQ0MjIgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL3J0Yy9LY29uZmlnDQo+ID4gPiAr
KysgYi9kcml2ZXJzL3J0Yy9LY29uZmlnDQo+ID4gPiBAQCAtNDk4LDggKzQ5OCwxMCBAQCBjb25m
aWcgUlRDX0RSVl9NNDFUODBfV0RUDQo+ID4gPiAgICAgICBoZWxwDQo+ID4gPiAgICAgICAgIElm
IHlvdSBzYXkgWSBoZXJlIHlvdSB3aWxsIGdldCBzdXBwb3J0IGZvciB0aGUNCj4gPiA+ICAgICAg
ICAgd2F0Y2hkb2cgdGltZXIgaW4gdGhlIFNUIE00MVQ2MCBhbmQgTTQxVDgwIFJUQyBjaGlwcw0K
PiA+ID4gc2VyaWVzLg0KPiA+ID4gKw0KPiA+ID4gIGNvbmZpZyBSVENfRFJWX0JENzA1MjgNCj4g
PiA+ICAgICAgIHRyaXN0YXRlICJST0hNIEJENzA1MjggUE1JQyBSVEMiDQo+ID4gPiArICAgICBk
ZXBlbmRzIG9uIEJENzA1MjhfV0FUQ0hET0cgfHwgKENPTVBJTEVfVEVTVCAmJg0KPiA+ID4gIUJE
NzA1MjhfV0FUQ0hET0cpDQo+ID4gDQo+ID4gSSBhbSBub3QgZmFuIG9mIHRoaXMuIFRoZXJlIG1h
eSB3ZWxsIGJlIHVzZS1jYXNlcyB3aGVyZSBpdCBpcw0KPiA+IGRlc2lyYWJsZQ0KPiA+IHRvIGxl
YXZlIHRoZSB3YXRjaGRvZyBvdXQgYnV0IHN0aWxsIGNvbXBpbGUgaW4gdGhlIFJUQy4gVGhpcyBp
cyB3aHkNCj4gPiB3ZQ0KPiA+IGhhdmUgc3RhdGljIGlubGluZSBzdHVicyBpbiB0aGUgaGVhZGVy
IGZvciBjYXNlcyB3aGVyZSBXREcgaXMgbm90DQo+ID4gY29tcGlsZWQgaW4uIChSVEMgZG9lcyBu
b3QgbmVlZCB0byBzdG9wIFdERyBpZiBXREcgZHJpdmVyIGlzIG5vdA0KPiA+IGluY2x1ZGVkKQ0K
PiA+IA0KPiA+IEFkZGluZyBkZXBlbmRlbmN5IGZyb20gUlRDIHRvIE1GRCBmb3IgQkQ3MDUyOCBz
aG91bGQgYmUgZG9uZSAtIHRoaXMNCj4gPiB3aWxsIGF2b2lkIG1vc3Qgb2YgdGhlIGlzc3VlcyAo
QW5kIHRoZXJlIGhhcyBiZWVuIGZldyBwYXRjaGVzIHNlbnQNCj4gPiBmb3INCj4gPiB0aGlzIGFs
cmVhZHkpLiBCdXQgdGhhdCdzIHN0aWxsIG5vdCBjb21wbGV0ZSBzb2x1dGlvbiBiZWNhdXNlDQo+
ID4gY29uZmlndXJpbmcgUlRDIGFuZCBNRkQgdG8gYmUgYnVpbHQgaW4ta2VybmVsIGFuZCBXREcg
YXMgYSBtb2R1bGUNCj4gPiB3aWxsDQo+ID4gY2F1c2UgZXJyb3JzIGFnYWluLg0KPiA+IA0KPiA+
IElzIHRoZXJlIGEgd2F5IHRvIGZvcmNlIFdERyBpbi1rZXJuZWwgaWYgUlRDIGlzIGluLWtlcm5l
bD8gKE9yDQo+ID4gZGlzYWxsb3cgY29uZmlndXJpbmcgUlRDIGluLWtlcm5lbCBpZiBXREcgaXMg
YSBtb2R1bGUgLSB3aGlsZSBzdGlsbA0KPiA+IGFsbG93IFJUQyB0byBiZSBidWlsdCB3aXRob3V0
IFdERz8NCj4gDQo+IFdlIGNvdWxkIG1ha2UgdGhpcw0KPiANCj4gICAgICAgICBkZXBlbmRzIG9u
IEJENzA1MjhfV0FUQ0hET0cgfHwgIUJENzA1MjhfV0FUQ0hET0cNCj4gDQo+IHdoaWNoIHdvdWxk
IGFsbG93IGJ1aWxkaW5nIHdpdGggb3Igd2l0aG91dCB3YXRjaGRvZywgZXZlbiB3aGVuIG5vdA0K
PiBjb21waWxlLXRlc3RpbmcsIGJ1dCBzdGlsbCBkaXNhbGxvdyB0aGUgY29tYmluYXRpb24gb2YN
Cj4gLg0KDQpUaGFua3MgZm9yIHRlYWNoaW5nIG1lIEFybmQhIFRoYXQgaXMgY2xldmVyIDopIFdl
IG5lZWQgc29tZXRoaW5nIGxpa2UNCg0KZGVwZW5kcyBvbiBNRkRfUk9ITV9CRDcwNTI4ICYmIChC
RDcwNTI4X1dBVENIRE9HIHx8ICFCRDcwNTI4X1dBVENIRE9HKQ0KDQooSSdtIG5vdCBzdXJlIGlm
IHBhcmVudGhlc2lzIGFyZSBPayBhbmQgcmVzcGVjdGVkIGluIEtjb25maWcpLiBJIHdvdWxkDQpu
ZXZlciBoYXZlIHRob3VnaHQgb2YgQkQ3MDUyOF9XQVRDSERPRyB8fCAhQkQ3MDUyOF9XQVRDSERP
RyAtIGl0IGxvb2tzDQphd2t3YXJkIGF0IGZpcnN0IHNpZ2h0IGJ1dCBpbmRlZWQgLSBkZXBlbmRz
IG9uIEJENzA1MjhfV0FUQ0hET0cNCmRpc2FsbG93cyBCRDcwNTI4X1dBVENIRE9HPW0gd2l0aCBS
VENfRFJWX0JENzA1Mjg9eSB3aGlsZQ0KIUJENzA1MjhfV0FUQ0hET0cgYWxsb3dzIEJENzA1Mjhf
V0FUQ0hET0c9bi4gQnJpbGxpYW50IGFuZCBleGFjdGx5IHdoYXQNCndlIG5lZWQgOikgVGhhbmtz
IGEgYnVuY2ghDQoNCj4gDQo+ICAgICAgICBBcm5kDQo=
