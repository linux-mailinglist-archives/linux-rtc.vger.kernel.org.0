Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA7CB61F8D
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Jul 2019 15:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729062AbfGHN3a (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 8 Jul 2019 09:29:30 -0400
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:54294 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728166AbfGHN3a (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 8 Jul 2019 09:29:30 -0400
X-AuditID: c0a8fbf4-501ff700000014c1-ee-5d234538715a
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id AA.EA.05313.835432D5; Mon,  8 Jul 2019 15:29:28 +0200 (CEST)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Mon, 8 Jul 2019 15:29:16 +0200
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
CC:     "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
Subject: Re: [PATCH] rtc: bd70528: add dependency to fix build errors
Thread-Topic: [PATCH] rtc: bd70528: add dependency to fix build errors
Thread-Index: AQHVNN7SUtH5A1X73EusWSNH7DL6MqbAlw4A
Date:   Mon, 8 Jul 2019 13:29:14 +0000
Message-ID: <653472d59d565401d96ec83a42406cf6c2f77453.camel@fi.rohmeurope.com>
References: <420b921d-10ca-1d9a-ac46-5969a7f0e0b9@infradead.org>
In-Reply-To: <420b921d-10ca-1d9a-ac46-5969a7f0e0b9@infradead.org>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [84.253.205.146]
Content-Type: text/plain; charset="utf-8"
Content-ID: <24698226BB6B9A488009ABAA8A3094C1@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgk+LIzCtJLcpLzFFi42I5sOL3Rl0LV+VYg/NzlCzmrF/DZnH/61FG
        i8u75rBZHFt9hc3i7Z3pLA6sHptXaHncubaHzePEjN8sHp83yQWwRHHbJCWWlAVnpufp2yVw
        Zyzo4i24J17R/XoLSwPjBPEuRk4OCQETiZe/TrN3MXJxCAlcY5TY3d7MAuEcZ5To6fnE1sXI
        wcEmYCPRdROsSERgPaNEy9sWFpBuZoEcid3fHzCD2MICrhIXHv5jArFFBNwkNj7axgphG0m0
        nl4EVs8ioCLx8uRCVpCZvAJ+Esf79EDCQgIOEicP7AEr4RRwlLiycB8biM0oICvR2fCOCWKV
        uMSmZ99ZIY4WkFiy5zwzhC0q8fLxP6i4ksTGQ/vATmYW0JRYv0sfotVBonfZTEYIW1FiSvdD
        dhCbV0BQ4uTMJywTGMVmIdkwC6F7FpLuWUi6ZyHpXsDIuopRIjcxMyc9sSTVUK8otVSvKD8j
        F0gl5+duYoTE4ZcdjP8PeR5iFOBgVOLhPWSnHCvEmlhWXJl7iFGSg0lJlDckVT5WiC8pP6Uy
        I7E4I76oNCe1+BCjBAezkghvYhBQjjclsbIqtSgfJiXNwaIkzqvG+ytGSABkc3ZqakFqEUxW
        hoNDSYJ3vTPQHsGi1PTUirTMnBKENBMHJ8hwLimR4tS8lNSixNKSjHhQWokvBiYWkBQP0N5T
        IO28xQWJuUBRiNZTjNocE17OXcTMcWTu0kXMQix5+XmpUuK850BKBUBKM0rz4Ba9YhQH+leY
        94sTUJYHmKzh5rwCWsEEtKIuUglkRUkiQkqqgTGbvb9ggZSCUPLiI0d62/o1YvznOm5j/Nre
        fkHhzfG26NbY3HlXl75iO7qBWyXYYsfOkGfcSh+2Cuz9sO2uYRT/3YsORotfP7ZYf7mskFc4
        86+2qr3UB8OHloY8oqVvk+oyldM+hJw7nNDi86rc7avftw2TQg/6rbi1Qf6+vYfzCt/DEQ0q
        8UosxRmJhlrMRcWJABEHlACTAwAA
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGVsbG8gUmFuZHksDQoNClRoYW5rcyBhIGxvdCBmb3IgdHJ5aW5nIHRvIGNsZWFuIHVwIHRoZSBt
ZXNzIDopDQoNCk9uIFN1biwgMjAxOS0wNy0wNyBhdCAwOToxMiAtMDcwMCwgUmFuZHkgRHVubGFw
IHdyb3RlOg0KPiBGcm9tOiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4NCj4g
DQo+IEZpeCBidWlsZCBlcnJvcnMgd2hlbiBNRkRfUk9ITV9CRDcwNTI4PW0sIEJENzA1MjhfV0FU
Q0hET0c9bSwNCj4gYW5kIFJUQ19EUlZfQkQ3MDUyOD15LiAgRml4ZXMgdGhlc2UgYnVpbGQgZXJy
b3JzOg0KPiANCj4gbGQ6IGRyaXZlcnMvcnRjL3J0Yy1iZDcwNTI4Lm86IGluIGZ1bmN0aW9uIGBi
ZDcwNTI4X2FsbV9lbmFibGUnOg0KPiBydGMtYmQ3MDUyOC5jOigudGV4dCsweDNhMik6IHVuZGVm
aW5lZCByZWZlcmVuY2UgdG8NCj4gYGJkNzA1Mjhfd2R0X2xvY2snDQo+IGxkOiBydGMtYmQ3MDUy
OC5jOigudGV4dCsweDNmOCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8NCj4gYGJkNzA1Mjhfd2R0
X3VubG9jaycNCj4gbGQ6IGRyaXZlcnMvcnRjL3J0Yy1iZDcwNTI4Lm86IGluIGZ1bmN0aW9uDQo+
IGBiZDcwNTI4X3NldF9ydGNfYmFzZWRfdGltZXJzJzoNCj4gcnRjLWJkNzA1MjguYzooLnRleHQr
MHg0MWMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBiZDcwNTI4X3dkdF9zZXQnDQo+IGxkOiBk
cml2ZXJzL3J0Yy9ydGMtYmQ3MDUyOC5vOiBpbiBmdW5jdGlvbiBgYmQ3MDUyOF9zZXRfdGltZSc6
DQo+IHJ0Yy1iZDcwNTI4LmM6KC50ZXh0KzB4NTAwKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0bw0K
PiBgYmQ3MDUyOF93ZHRfbG9jaycNCj4gbGQ6IHJ0Yy1iZDcwNTI4LmM6KC50ZXh0KzB4NTg3KTog
dW5kZWZpbmVkIHJlZmVyZW5jZSB0bw0KPiBgYmQ3MDUyOF93ZHRfdW5sb2NrJw0KPiANCj4gQWxz
byBhZGQgYSBibGFuayBsaW5lIHRvIHNlcGFyYXRlIHRoZSBLY29uZmlnIGVudHJ5IGZyb20gdGhl
IG9uZQ0KPiBhYm92ZSBpdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1
bmxhcEBpbmZyYWRlYWQub3JnPg0KPiBDYzogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9y
Zz4NCj4gQ2M6IE1hdHRpIFZhaXR0aW5lbiA8bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUu
Y29tPg0KPiBDYzogbGludXgtcnRjQHZnZXIua2VybmVsLm9yZw0KPiBDYzogQW5kcmV3IE1vcnRv
biA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4NCj4gLS0tDQo+IEZvdW5kIGluIG1tb3RtIGJ1
dCBhcHBsaWVzIHRvIGxpbnV4LW5leHQuDQo+IA0KPiAgZHJpdmVycy9ydGMvS2NvbmZpZyB8ICAg
IDIgKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQo+IC0tLSBtbW90
bS0yMDE5LTA3MDYtMjIwMC5vcmlnL2RyaXZlcnMvcnRjL0tjb25maWcNCj4gKysrIG1tb3RtLTIw
MTktMDcwNi0yMjAwL2RyaXZlcnMvcnRjL0tjb25maWcNCj4gQEAgLTQ5OCw4ICs0OTgsMTAgQEAg
Y29uZmlnIFJUQ19EUlZfTTQxVDgwX1dEVA0KPiAgCWhlbHANCj4gIAkgIElmIHlvdSBzYXkgWSBo
ZXJlIHlvdSB3aWxsIGdldCBzdXBwb3J0IGZvciB0aGUNCj4gIAkgIHdhdGNoZG9nIHRpbWVyIGlu
IHRoZSBTVCBNNDFUNjAgYW5kIE00MVQ4MCBSVEMgY2hpcHMgc2VyaWVzLg0KPiArDQo+ICBjb25m
aWcgUlRDX0RSVl9CRDcwNTI4DQo+ICAJdHJpc3RhdGUgIlJPSE0gQkQ3MDUyOCBQTUlDIFJUQyIN
Cj4gKwlkZXBlbmRzIG9uIE1GRF9ST0hNX0JENzA1MjgNCg0KVGhpcyBpcyBkZWZpbml0ZWx5IHJl
cXVpcmVkIGRlcGVuZGVuY3kuIEJ1dCBJIGd1ZXNzIHRoaXMgaXMgc3RpbGwgbm90DQpmaXhpbmcg
ZXZlcnl0aGluZy4uLiBJIGFzc3VtZSB0aGlzIGFsbG93cyBjb25maWd1cmluZyBNRkQgYW5kIFJU
QyBpbi0NCmtlcm5lbCB3aGlsZSBsZWF2aW5nIFdERyB0byBiZSBidWlsdCBhcyBtb2R1bGUuIFRo
YXQgd2lsbCBwcm9iYWJseSBhbHNvDQpmYWlsLiBJIGFtIG5vdCBzdXJlIGhvdyB0byBzb2x2ZSB0
aGlzIGVsZWdhbnRseSB3aGlsZSBzdGlsbCBhbGxvd2luZw0KV0RHIHRvIGJlIGxlZnQgb3V0IGlm
IGl0IGlzIG5vdCBuZWVkZWQuDQoNCj4gIAloZWxwDQo+ICAJICBJZiB5b3Ugc2F5IFkgaGVyZSB5
b3Ugd2lsbCBnZXQgc3VwcG9ydCBmb3IgdGhlIFJUQw0KPiAgCSAgb24gUk9ITSBCRDcwNTI4IFBv
d2VyIE1hbmFnZW1lbnQgSUMuDQo+IA0KPiANCg0KQnIsDQoJTWF0dGkgVmFpdHRpbmVuDQo=
