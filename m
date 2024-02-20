Return-Path: <linux-rtc+bounces-678-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D1B85C58C
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Feb 2024 21:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 833B7281A8E
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Feb 2024 20:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B60014AD00;
	Tue, 20 Feb 2024 20:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="jTHCRpZ1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1BC14A4C7
	for <linux-rtc@vger.kernel.org>; Tue, 20 Feb 2024 20:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708459879; cv=none; b=u5xOjQ6krSCIjIRsb8IeAvlmcNs3CDY2mLUlhIhtevLmRCA/Z0PjHlVSTa2uI8qh+IZqUQqjZrnApqe58rXmHM+xrTAqwm/s3f33/tKqaoScBMeJ//h7FlhqRG+PYRF1KLKTBllyOJooA3D7V2y4lYPjfFCkTmNgDIO8WovqJz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708459879; c=relaxed/simple;
	bh=BC9mY300X2P+uLz83J5CTNP0w6V4M/mSk0hDUW5brlI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OcdknHyS5rwTJfd6TTfdJoDRHrqHdv40UD8JEDZOdKF9IeVclilxKj7EsHdlLmH5omKKVrPOnkEGbyHd/Hq/KFNkFUEG0X3UpAVz1vrPIjdtGCmELy+lJzRLsaQliVrK8lXHBvg8lLhdpllZoQDSceB882XcHO+KQ3CLZZZBCp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=jTHCRpZ1; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 608FB2C0220;
	Wed, 21 Feb 2024 09:11:14 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1708459874;
	bh=BC9mY300X2P+uLz83J5CTNP0w6V4M/mSk0hDUW5brlI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=jTHCRpZ1z+1okRPrzLLgw37OejEyr3hlmJU2AkPsOFPDQy65/0q/KJJ+xkk9FTIZF
	 Ru6Od5xx+9w7TFgu6nbvAtoxjer3sGELZ5SpguA5C7zm4nygkmcM8ntBJICoCli71A
	 aHEklJbd5EvrfUgHx2NE3LmBZ4uOQP4GbGwJ3QGETBOjpPi4Z7wG79GwT1GPQUlb2B
	 vbrEWK+te0aw+zPgHpp84f5FjQ/5UJdNFywpbdSnMdJzdttgRnxE7l64At8cbSvqlI
	 +taQINaf7YzdgLRKlLRnIe47nHG39ya+kNwHMdRuXaBYsTc5NDIxqfNjrQg6TZE2s3
	 7maZ3QhqtXWMg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B65d507620001>; Wed, 21 Feb 2024 09:11:14 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 21 Feb 2024 09:11:14 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.040; Wed, 21 Feb 2024 09:11:14 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Conor Dooley <conor@kernel.org>
CC: "antoniu.miclaus@analog.com" <antoniu.miclaus@analog.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "jdelvare@suse.com"
	<jdelvare@suse.com>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Zeynep
 Arslanbenzer" <Zeynep.Arslanbenzer@analog.com>
Subject: Re: [PATCH v7 2/2] dt-bindings: rtc: add max313xx RTCs
Thread-Topic: [PATCH v7 2/2] dt-bindings: rtc: add max313xx RTCs
Thread-Index: AQHaY4GQgNW/Cu8ag0Gq7OAgZ1DEQbESwvKAgAAOBIA=
Date: Tue, 20 Feb 2024 20:11:13 +0000
Message-ID: <021800f9-c81c-41fb-b907-5cb27a8854d2@alliedtelesis.co.nz>
References: <20240219221827.3821415-1-chris.packham@alliedtelesis.co.nz>
 <20240219221827.3821415-3-chris.packham@alliedtelesis.co.nz>
 <20240220-unified-payback-13b0964c8c29@spud>
In-Reply-To: <20240220-unified-payback-13b0964c8c29@spud>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <6379DC9F5F425A4CAE94A81D352EF788@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BKkQr0QG c=1 sm=1 tr=0 ts=65d50762 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=k7vzHIieQBIA:10 a=gAnH3GRIAAAA:8 a=Cz0ywsbLXhyV6_8c7SQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=oVHKYsEdi7-vN-J5QA_j:22
X-SEG-SpamProfiler-Score: 0

DQpPbiAyMS8wMi8yNCAwODoyMSwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPiBIZXkgQ2hyaXMsDQo+
DQo+IE9uIFR1ZSwgRmViIDIwLCAyMDI0IGF0IDExOjE4OjI0QU0gKzEzMDAsIENocmlzIFBhY2to
YW0gd3JvdGU6DQo+PiBGcm9tOiBJYnJhaGltIFRpbGtpIDxJYnJhaGltLlRpbGtpQGFuYWxvZy5j
b20+DQo+Pg0KPj4gQWRkIGRldmljZXRyZWUgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciBBbmFs
b2cgRGV2aWNlcyBNQVgzMTNYWCBSVENzLg0KPj4gVGhpcyBjb21iaW5lcyB0aGUgbmV3IG1vZGVs
cyB3aXRoIHRoZSBleGlzdGluZyBtYXgzMTMzNSBiaW5kaW5nLg0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IElicmFoaW0gVGlsa2kgPElicmFoaW0uVGlsa2lAYW5hbG9nLmNvbT4NCj4+IFNpZ25lZC1v
ZmYtYnk6IFpleW5lcCBBcnNsYW5iZW56ZXIgPFpleW5lcC5BcnNsYW5iZW56ZXJAYW5hbG9nLmNv
bT4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVk
dGVsZXNpcy5jby5uej4NCj4+IC0tLQ0KPj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMv
YWRpLG1heDMxMzM1LnlhbWwgfCAgNzAgLS0tLS0tLS0NCj4+ICAgLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcnRjL2FkaSxtYXgzMTN4eC55YW1sIHwgMTY3ICsrKysrKysrKysrKysrKysrKw0KPiBU
aGVyZSdzIG5vIG5lZWQgdG8gZG8gdGhpcyByZW5hbWUuIEhhdmluZyB0aGUgZmlsZW5hbWUgbWF0
Y2hpbmcgb25lIG9mDQo+IHRoZSBjb21wYXRpYmxlcyBpcyBvdXIgcHJlZmVyZW5jZS4NCk9LIHdh
c24ndCBzdXJlLiBJJ2xsIGtlZXAgdGhlIGV4aXN0aW5nIG5hbWUuDQo+IEluIGFkZGl0aW9uLCBp
dCBtYWtlcyBpdCBkaWZmaWN1bHQgdG8gc2VlIHdoYXQgeW91ciBhY3R1YWwgYWRkaXRpb25zIGFy
ZQ0KPiBoZXJlLiBGb3J0dW5hdGVseSwgYXBwbHlpbmcgdGhlIHBhdGNoIGxvY2FsbHkgYWxsb3dz
IG1lIHRvIHVzZSBjb2xvdXINCj4gbW92ZWQgYW5kIGFsbCB0aGF0IGphenosIHNvIEkgY2FuIHNl
ZSB0aGF0IHRoZSB1bmRlcmx5aW5nIGNoYW5nZXMgdG8gdGhlDQo+IGZpbGUgYWN0dWFsbHkgbG9v
ayBwcmV0dHkgZ29vZC4NCj4NCj4+ICtleGFtcGxlczoNCj4+ICsgIC0gfA0KPj4gKyAgICAjaW5j
bHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+DQo+PiArICAgIGky
YyB7DQo+PiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4+ICsgICAgICAgICNzaXpl
LWNlbGxzID0gPDA+Ow0KPj4gKw0KPj4gKyAgICAgICAgcnRjQDY4IHsNCj4+ICsgICAgICAgICAg
ICByZWcgPSA8MHg2OD47DQo+PiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhZGksbWF4MzEz
MjkiOw0KPj4gKyAgICAgICAgICAgIGNsb2NrcyA9IDwmY2xraW4+Ow0KPj4gKyAgICAgICAgICAg
IGludGVycnVwdC1wYXJlbnQgPSA8JmdwaW8+Ow0KPj4gKyAgICAgICAgICAgIGludGVycnVwdHMg
PSA8MjYgSVJRX1RZUEVfRURHRV9GQUxMSU5HPjsNCj4+ICsgICAgICAgICAgICBhdXgtdm9sdGFn
ZS1jaGFyZ2VhYmxlID0gPDE+Ow0KPj4gKyAgICAgICAgICAgIHRyaWNrbGUtcmVzaXN0b3Itb2ht
cyA9IDw2MDAwPjsNCj4+ICsgICAgICAgICAgICBhZGksdGMtZGlvZGUgPSAic2Nob3R0a3kiOw0K
Pj4gKyAgICAgICAgfTsNCj4+ICsgICAgfTsNCj4+ICsgIC0gfA0KPj4gKyAgICAjaW5jbHVkZSA8
ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+DQo+PiArICAgIGkyYyB7DQo+
PiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4+ICsgICAgICAgICNzaXplLWNlbGxz
ID0gPDA+Ow0KPj4gKw0KPj4gKyAgICAgICAgcnRjQDY4IHsNCj4+ICsgICAgICAgICAgICBjb21w
YXRpYmxlID0gImFkaSxtYXgzMTMzNSI7DQo+PiArICAgICAgICAgICAgcmVnID0gPDB4Njg+Ow0K
Pj4gKyAgICAgICAgICAgIHBpbmN0cmwtMCA9IDwmcnRjX25pbnRfcGlucz47DQo+PiArICAgICAg
ICAgICAgaW50ZXJydXB0cy1leHRlbmRlZCA9IDwmZ3BpbzEgMTYgSVJRX1RZUEVfTEVWRUxfSElH
SD47DQo+PiArICAgICAgICAgICAgYXV4LXZvbHRhZ2UtY2hhcmdlYWJsZSA9IDwxPjsNCj4+ICsg
ICAgICAgICAgICB0cmlja2xlLXJlc2lzdG9yLW9obXMgPSA8NjAwMD47DQo+PiArICAgICAgICAg
ICAgYWRpLHRjLWRpb2RlID0gInNjaG90dGt5IjsNCj4+ICsgICAgICAgIH07DQo+PiArICAgIH07
DQo+PiArICAtIHwNCj4+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250
cm9sbGVyL2lycS5oPg0KPj4gKyAgICBpMmMgew0KPj4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMg
PSA8MT47DQo+PiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4+ICsNCj4+ICsgICAgICAg
IHJ0Y0A2OCB7DQo+PiArICAgICAgICAgICAgcmVnID0gPDB4Njg+Ow0KPj4gKyAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAiYWRpLG1heDMxMzMxIjsNCj4+ICsgICAgICAgICAgICAjY2xvY2stY2Vs
bHMgPSA8MD47DQo+PiArICAgICAgICB9Ow0KPj4gKyAgICB9Ow0KPiBUaGUgb25lIHRoaW5nIEkg
ZG8gd2FudCB0aGUgY29tbWVudCBvbiBpcyB0aGUgbnVtYmVyIG9mIGV4YW1wbGVzLg0KPiBJIGRv
bid0IHJlYWxseSBzZWUgd2hhdCB3ZSBnYWluIGZyb20gaGF2aW5nIDMgLSBJJ2Qgcm9sbCB0aGUg
Y2xvY2sNCj4gcHJvdmlkZXIgZXhhbXBsZSBpbnRvIHdpdGggb25lIG9mIHRoZSBvdGhlciBvbmVz
IEkgdGhpbmsuDQpUaGUgMyBleGFtcGxlcyBhcmUgYW4gYXJ0aWZhY3Qgb2YgbWUgY29tYmluaW5n
IHRoZSBpbi1mbGlnaHQgbWF4MzEzeHggDQpzZXJpZXMgd2l0aCB0aGUgb25lIHRoYXQgbGFuZGVk
LiBUaGUgY2xvY2sgb3V0cHV0IGlzIG9ubHkgdmFsaWQgZm9yIHNvbWUgDQpjaGlwcyBidXQgdGhh
dCdzIHByb2JhYmx5IGp1c3QgYSBtYXR0ZXIgb2YgcGlja2luZyB0aGUgcmlnaHQgY29tcGF0aWJs
ZS4=

