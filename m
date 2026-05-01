Return-Path: <linux-rtc+bounces-6458-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFo7FMs29GkV/gEAu9opvQ
	(envelope-from <linux-rtc+bounces-6458-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 01 May 2026 07:14:51 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E0B4AA73F
	for <lists+linux-rtc@lfdr.de>; Fri, 01 May 2026 07:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E77CD3016EF3
	for <lists+linux-rtc@lfdr.de>; Fri,  1 May 2026 05:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44245324B1F;
	Fri,  1 May 2026 05:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="m+LG91fZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EBF2D0C7B
	for <linux-rtc@vger.kernel.org>; Fri,  1 May 2026 05:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777612479; cv=none; b=gnzM8re5PQvGXwaf2+JWMJpGKkTC4PEesIkHDecYvEjinZh2L+ewZZl9/OYQl8L2nX/bKT3t1H3gGVIUkPSlz0bFZ9tvR6an3cCpkgrwYudDQ6Yn3Wo+xXmZnkx0gNtcjITfVwDSjf9aHDAX4RSHGXPYuppcbQIvJGhHPrtfiJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777612479; c=relaxed/simple;
	bh=DTGxvOhj0zLw3HPmvxh44+w4GeXTagErMSRbW9DnE6A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=slCwXcdFPZdNjSR5xymq1VlR2OponIPFHYoqL+hBDgg8ummItJSfl0kefOeUy8xFUg+LA3FQJ3m/9mC+cvd3H/jBybzg47opaUuXMV/17G8HsC2XrfgC0TEiQa5i7iy2lyhdtoe+D6H5SDnbmUNBPc5e9rRMLWKCr/yWgOBOD40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=m+LG91fZ; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 939AA2C0453;
	Fri,  1 May 2026 17:14:33 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1777612473;
	bh=DTGxvOhj0zLw3HPmvxh44+w4GeXTagErMSRbW9DnE6A=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=m+LG91fZ/If3nSfuFYsS9k5rUHkWbBnARQl9Ex5OvE4anUMc2EyKwCJ9voJIU9BXR
	 7LqmgrZetg0E9qPbe3uszrp2VTwYb6Ytmib0DeeX9R5b+3BLLlnmjEojwrN65iAO+J
	 5YEJe5MkFqDQtqKGb4dnII5DzEAMabgMnuXaWIHrZe+I6zFLf/D/zjbnJM1sEOjpgT
	 Vb00JTnhTfv8mxjW5ZJ4nXSfSmYA3hb0QUBniKzG9YzUxv2bUu7o7yh6mGzKMWlO6z
	 XlBhcThdqTXLO3/ylZJKTqPDOGp4RIGww4qsY6MbtJmP3wH6UtgUcjp2A8RnOl5tJy
	 kXx9LDoO3PHpQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B69f436b90001>; Fri, 01 May 2026 17:14:33 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Fri, 1 May 2026 17:14:33 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.039; Fri, 1 May 2026 17:14:33 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Ronan Dalton <Ronan.Dalton@alliedtelesis.co.nz>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tyler Hicks
	<code@tyhicks.com>, Sasha Levin <sashal@kernel.org>, Meagan Lloyd
	<meaganlloyd@linux.microsoft.com>, Rodolfo Giometti <giometti@enneenne.com>
Subject: Re: [PATCH] rtc: ds1307: handle oscillator stop flag for
 ds1337/ds1339/ds3231
Thread-Topic: [PATCH] rtc: ds1307: handle oscillator stop flag for
 ds1337/ds1339/ds3231
Thread-Index: AQHc2SYs/dzU9DqYhU6v2CJYbHsOHLX311IA
Date: Fri, 1 May 2026 05:14:33 +0000
Message-ID: <18e8ff9e-5bb9-423b-91c6-5e4b37ef4455@alliedtelesis.co.nz>
References: <20260501044657.1003980-2-ronan.dalton@alliedtelesis.co.nz>
In-Reply-To: <20260501044657.1003980-2-ronan.dalton@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0ADF9565BE6E84B8CD1228554648143@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=FPe4xPos c=1 sm=1 tr=0 ts=69f436b9 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=drD7vYo3kbIA:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=FLmnqZ5pAAAA:8 a=yMhMjlubAAAA:8 a=gUfQWItQAAAA:8 a=u5EYUK4S4NM-VeQ87e0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22 a=8DxQ4-P9FUvTN4rw3Xy2:22 a=Xud5aiJGVNusHZ8q4fKI:22
X-SEG-SpamProfiler-Score: 0
X-Rspamd-Queue-Id: E5E0B4AA73F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.06 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[alliedtelesis.co.nz,quarantine];
	R_DKIM_ALLOW(-0.20)[alliedtelesis.co.nz:s=mail181024];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6458-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,enneenne.com:email,alliedtelesis.co.nz:email,alliedtelesis.co.nz:dkim,alliedtelesis.co.nz:mid,bootlin.com:email];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[alliedtelesis.co.nz:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Chris.Packham@alliedtelesis.co.nz,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCVD_COUNT_SEVEN(0.00)[7]

SGkgUm9uYW4NCg0KT24gMDEvMDUvMjAyNiAxNjo0NiwgUm9uYW4gRGFsdG9uIHdyb3RlOg0KPiBQ
cmlvciB0byBjb21taXQgNmNiMGQ4NTg3Yjk2ICgicnRjOiBkczEzMDc6IHJlbW92ZSBjbGVhciBv
ZiBvc2NpbGxhdG9yDQo+IHN0b3AgZmxhZyAoT1NGKSBpbiBwcm9iZSIpLCB0aGUgb3NjaWxsYXRv
ciBzdG9wIGZsYWcgKE9TRikgYml0IHdhcw0KPiBjaGVja2VkIGR1cmluZyBkZXZpY2UgcHJvYmUg
Zm9yIHRoZSBkczEzMzcsIGRzMTMzOSwgZHMxMzQxLCBhbmQgZHMzMjMxDQo+IGNoaXBzOyBpZiBp
dCB3YXMgc2V0LCBpdCB3b3VsZCBiZSBjbGVhcmVkIGFuZCBhIHdhcm5pbmcgd291bGQgYmUgbG9n
Z2VkDQo+IHNheWluZyAiU0VUIFRJTUUhIi4gU2luY2UgdGhhdCBjb21taXQsIHRoZSBPU0YgYml0
IGlzIG5vIGxvbmdlciBjbGVhcmVkLA0KPiBidXQgdGhlIHdhcm5pbmcgaXMgc3RpbGwgcHJpbnRl
ZC4NCj4NCj4gRGlyZWN0bHkgZm9sbG93aW5nIHRoYXQgY29tbWl0LCB0aGVyZSB3YXMgbm8gd2F5
IHRvIGdldCByaWQgb2YgdGhpcw0KPiB3YXJuaW5nIGJlY2F1c2Ugbm90aGluZyBjbGVhcmVkIHRo
ZSBPU0YgYml0IG9uIHRoZXNlIGNoaXBzLg0KPg0KPiBUaGUgY29tbWl0IGFzc29jaWF0ZWQgd2l0
aCB0aGUgcHJldmlvdXMgY29tbWl0LCBhZTAzYTI4ZTEyYTcgKCJydGM6DQo+IGRzMTMwNzogaGFu
ZGxlIG9zY2lsbGF0b3Igc3RvcCBmbGFnIChPU0YpIGZvciBkczEzNDEiKSwgbWFkZSBwcm9wZXIg
dXNlDQo+IG9mIHRoZSBPU0Ygd2hlbiBnZXR0aW5nIGFuZCBzZXR0aW5nIHRoZSB0aW1lIGluIHRo
ZSBSVEMuIEhvd2V2ZXIsIHRoZQ0KPiBvdGhlciBSVEMgdmFyaWFudHMgZHMxMzM3LCBkczEzMzkg
YW5kIGRzMzIzMSBkaWRuJ3QgaGF2ZSBhIGNvcnJlc3BvbmRpbmcNCj4gY2hhbmdlIG1hZGUuDQo+
DQo+IEdpdmVuIHRoYXQgdGhlIE9TRiBiaXQgaXMgbm8gbG9uZ2VyIGNsZWFyZWQgYXQgcHJvYmUg
dGltZSB3aGVuIGl0IGlzDQo+IHNldCwgdGhlIHJlbWFpbmluZyB0aHJlZSBjaGlwcyBzaG91bGQg
aGF2ZSB0aGUgc2FtZSBoYW5kbGluZyBhcyB0aGUNCj4gZHMxMzQxIGNoaXAgaGFzIGZvciB0aGUg
T1NGIGJpdC4NCj4NCj4gRml4IHRoZSBpc3N1ZSBvbiB0aGUgZHMxMzM3LCBkczEzMzkgYW5kIGRz
MzIzMSBjaGlwcyBieSBhcHBseWluZyB0aGUNCj4gc2FtZSBsb2dpYyBhcyB0aGUgZHMxMzQxIGhh
cyB0byB0aGVzZSBjaGlwcy4NCj4NCj4gTm90ZSB0aGF0IGFueSBkZXZpY2VzIGJyb3VnaHQgdXAg
YmV0d2VlbiB0aGUgZmlyc3QgcmVmZXJlbmNlZCBjb21taXQgYW5kDQo+IHRoaXMgb25lIG1heSBi
ZWdpbiBtaXN0cnVzdGluZyB0aGUgdGltZSByZXBvcnRlZCBieSB0aGUgUlRDIHVudGlsIGl0IGlz
DQo+IHNldCBhZ2FpbiwgaWYgdGhlIGJpdCB3YXMgbmV2ZXIgZXhwbGljaXRseSBjbGVhcmVkLg0K
Pg0KPiBOb3RlIHRoYXQgb25seSB0aGUgZHMxMzM5IHdhcyB0ZXN0ZWQgd2l0aCB0aGlzIGNoYW5n
ZSwgYnV0IHRoZQ0KPiBkYXRhc2hlZXRzIGZvciB0aGUgb3RoZXIgY2hpcHMgY29udGFpbiBlc3Nl
bnRpYWxseSBpZGVudGljYWwNCj4gZGVzY3JpcHRpb25zIG9mIHRoZSBPU0YgYml0IHNvIHRoZSBz
YW1lIGNoYW5nZSBzaG91bGQgd29yay4NCj4NCj4gQW4gYWx0ZXJuYXRpdmUgdG8gdGhpcyBjaGFu
Z2UgY291bGQgYmUganVzdCB0byByZXZlcnQgdGhlIHJlZmVyZW5jZWQgdHdvDQo+IGNvbW1pdHMg
YW5kIG5vdCB1c2UgdGhlIE9TRiBiaXQgYXQgYWxsLCBhcGFydCBmcm9tIGxvZ2dpbmcgYSB3YXJu
aW5nIGFuZA0KPiBjbGVhcmluZyBpdCBvbiBwcm9iZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogUm9u
YW4gRGFsdG9uIDxyb25hbi5kYWx0b25AYWxsaWVkdGVsZXNpcy5jby5uej4NCj4gQ2M6IGxpbnV4
LXJ0Y0B2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcN
Cj4gQ2M6IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4N
Cj4gQ2M6IFR5bGVyIEhpY2tzIDxjb2RlQHR5aGlja3MuY29tPg0KPiBDYzogU2FzaGEgTGV2aW4g
PHNhc2hhbEBrZXJuZWwub3JnPg0KPiBDYzogTWVhZ2FuIExsb3lkIDxtZWFnYW5sbG95ZEBsaW51
eC5taWNyb3NvZnQuY29tPg0KPiBDYzogUm9kb2xmbyBHaW9tZXR0aSA8Z2lvbWV0dGlAZW5uZWVu
bmUuY29tPg0KPiBDYzogQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lz
LmNvLm56Pg0KPiBGaXhlczogNmNiMGQ4NTg3Yjk2ICgicnRjOiBkczEzMDc6IHJlbW92ZSBjbGVh
ciBvZiBvc2NpbGxhdG9yIHN0b3AgZmxhZyAoT1NGKSBpbiBwcm9iZSIpDQoNClJldmlld2VkLWJ5
OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQoNCj4g
LS0tDQo+ICAgZHJpdmVycy9ydGMvcnRjLWRzMTMwNy5jIHwgMjggKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxMSBkZWxl
dGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1kczEzMDcuYyBiL2Ry
aXZlcnMvcnRjL3J0Yy1kczEzMDcuYw0KPiBpbmRleCA3MjA1YzU5ZmY3MjkuLmVkZjgxYjk3NWRl
YyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ydGMvcnRjLWRzMTMwNy5jDQo+ICsrKyBiL2RyaXZl
cnMvcnRjL3J0Yy1kczEzMDcuYw0KPiBAQCAtMjY5LDYgKzI2OSwxNiBAQCBzdGF0aWMgaW50IGRz
MTMwN19nZXRfdGltZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBydGNfdGltZSAqdCkNCj4g
ICAJCWlmICh0bXAgJiBEUzEzMzhfQklUX09TRikNCj4gICAJCQlyZXR1cm4gLUVJTlZBTDsNCj4g
ICAJCWJyZWFrOw0KPiArCWNhc2UgZHNfMTMzNzoNCj4gKwljYXNlIGRzXzEzMzk6DQo+ICsJY2Fz
ZSBkc18xMzQxOg0KPiArCWNhc2UgZHNfMzIzMToNCj4gKwkJcmV0ID0gcmVnbWFwX3JlYWQoZHMx
MzA3LT5yZWdtYXAsIERTMTMzN19SRUdfU1RBVFVTLCAmdG1wKTsNCj4gKwkJaWYgKHJldCkNCj4g
KwkJCXJldHVybiByZXQ7DQo+ICsJCWlmICh0bXAgJiBEUzEzMzdfQklUX09TRikNCj4gKwkJCXJl
dHVybiAtRUlOVkFMOw0KPiArCQlicmVhazsNCj4gICAJY2FzZSBkc18xMzQwOg0KPiAgIAkJaWYg
KHRtcCAmIERTMTM0MF9CSVRfbkVPU0MpDQo+ICAgCQkJcmV0dXJuIC1FSU5WQUw7DQo+IEBAIC0y
NzksMTMgKzI4OSw2IEBAIHN0YXRpYyBpbnQgZHMxMzA3X2dldF90aW1lKHN0cnVjdCBkZXZpY2Ug
KmRldiwgc3RydWN0IHJ0Y190aW1lICp0KQ0KPiAgIAkJaWYgKHRtcCAmIERTMTM0MF9CSVRfT1NG
KQ0KPiAgIAkJCXJldHVybiAtRUlOVkFMOw0KPiAgIAkJYnJlYWs7DQo+IC0JY2FzZSBkc18xMzQx
Og0KPiAtCQlyZXQgPSByZWdtYXBfcmVhZChkczEzMDctPnJlZ21hcCwgRFMxMzM3X1JFR19TVEFU
VVMsICZ0bXApOw0KPiAtCQlpZiAocmV0KQ0KPiAtCQkJcmV0dXJuIHJldDsNCj4gLQkJaWYgKHRt
cCAmIERTMTMzN19CSVRfT1NGKQ0KPiAtCQkJcmV0dXJuIC1FSU5WQUw7DQo+IC0JCWJyZWFrOw0K
PiAgIAljYXNlIGRzXzEzODg6DQo+ICAgCQlyZXQgPSByZWdtYXBfcmVhZChkczEzMDctPnJlZ21h
cCwgRFMxMzg4X1JFR19GTEFHLCAmdG1wKTsNCj4gICAJCWlmIChyZXQpDQo+IEBAIC0zODAsMTQg
KzM4MywxNyBAQCBzdGF0aWMgaW50IGRzMTMwN19zZXRfdGltZShzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCBydGNfdGltZSAqdCkNCj4gICAJCXJlZ21hcF91cGRhdGVfYml0cyhkczEzMDctPnJl
Z21hcCwgRFMxMzA3X1JFR19DT05UUk9MLA0KPiAgIAkJCQkgICBEUzEzMzhfQklUX09TRiwgMCk7
DQo+ICAgCQlicmVhazsNCj4gKwljYXNlIGRzXzEzMzc6DQo+ICsJY2FzZSBkc18xMzM5Og0KPiAr
CWNhc2UgZHNfMTM0MToNCj4gKwljYXNlIGRzXzMyMzE6DQo+ICsJCXJlZ21hcF91cGRhdGVfYml0
cyhkczEzMDctPnJlZ21hcCwgRFMxMzM3X1JFR19TVEFUVVMsDQo+ICsJCQkJICAgRFMxMzM3X0JJ
VF9PU0YsIDApOw0KPiArCQlicmVhazsNCj4gICAJY2FzZSBkc18xMzQwOg0KPiAgIAkJcmVnbWFw
X3VwZGF0ZV9iaXRzKGRzMTMwNy0+cmVnbWFwLCBEUzEzNDBfUkVHX0ZMQUcsDQo+ICAgCQkJCSAg
IERTMTM0MF9CSVRfT1NGLCAwKTsNCj4gICAJCWJyZWFrOw0KPiAtCWNhc2UgZHNfMTM0MToNCj4g
LQkJcmVnbWFwX3VwZGF0ZV9iaXRzKGRzMTMwNy0+cmVnbWFwLCBEUzEzMzdfUkVHX1NUQVRVUywN
Cj4gLQkJCQkgICBEUzEzMzdfQklUX09TRiwgMCk7DQo+IC0JCWJyZWFrOw0KPiAgIAljYXNlIGRz
XzEzODg6DQo+ICAgCQlyZWdtYXBfdXBkYXRlX2JpdHMoZHMxMzA3LT5yZWdtYXAsIERTMTM4OF9S
RUdfRkxBRywNCj4gICAJCQkJICAgRFMxMzg4X0JJVF9PU0YsIDApOw==

