Return-Path: <linux-rtc+bounces-6466-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FUGSDkFu+mnJOwMAu9opvQ
	(envelope-from <linux-rtc+bounces-6466-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 06 May 2026 00:25:05 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A40C4D4482
	for <lists+linux-rtc@lfdr.de>; Wed, 06 May 2026 00:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68A60303454D
	for <lists+linux-rtc@lfdr.de>; Tue,  5 May 2026 22:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCEDF3DA5B7;
	Tue,  5 May 2026 22:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="UcO/aaNp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4733C277F
	for <linux-rtc@vger.kernel.org>; Tue,  5 May 2026 22:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778019900; cv=none; b=QKJHOdKabRu4tcOmcoNWLH8b6d71FLbWJ+KQaEjmPdM1yTqrUFBqe9U1+ruaFNg2jTbJFNHuh4eDu/YmISAgiMz6fKziScNYar8eExBO7OlZ671buNUtyYJXkgtXccw/rQYKp8VG5+FEQMwGBQr8ZGwGtwqlX8mId2gHie4kysg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778019900; c=relaxed/simple;
	bh=uc5Va+HnFCmJXQOsBSIUDSRNMmvA+pRMVprcJjJXXvE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PtQgkVDeewxIrbN+6BADvNRDs1vZE5TowV/u3u9aIisJ7oRk8UxnzD4DTw2dPhIuoLMUP3FlZkpFsz9/DbWf6an9vIkMgTTvCCZXOy1PmMCR8VKPzJZSWCDliCPdyzfr92ZQw6l6et2yoAahlBdgpOHGOffjg5Gr19SGua0Djwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=UcO/aaNp; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3F3522C035B;
	Wed,  6 May 2026 10:24:56 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1778019896;
	bh=uc5Va+HnFCmJXQOsBSIUDSRNMmvA+pRMVprcJjJXXvE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=UcO/aaNplw/GpaokgiqQbvyeb0pxBubh11w2fWkDdXFiGCtDXwfQ+yjHqU8Xl3gnI
	 h9pmY41QloEycHUzXb/15xk/H6AlWZrwCkyPRe4uLpqlEOZ4RbnFiC/oPzhZ48R+6v
	 GBjlqQDlY8iWt8rbOlQ+uJ4K48z6X7uxYQFaVsd8VcuLi7xbJ3G8iMg2OTIzSKtb8a
	 62+GT/4qUaaWqyRzEPvvVkDLV9WZ49RavOqYnWaDSmFKwv8DdQCAxdOdVbA83EmZJg
	 glhOsgeM/kZZPQ4SQpla6j8S96E+MQHlf1WHbwmJr6BGhh7YRtg4rgwYa/kWcf0ppp
	 pLE8QVtshpdOQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B69fa6e380001>; Wed, 06 May 2026 10:24:56 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Wed, 6 May 2026 10:24:56 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.039; Wed, 6 May 2026 10:24:56 +1200
From: Ronan Dalton <Ronan.Dalton@alliedtelesis.co.nz>
To: "meaganlloyd@linux.microsoft.com" <meaganlloyd@linux.microsoft.com>
CC: "tgopinath@linux.microsoft.com" <tgopinath@linux.microsoft.com>,
	"giometti@enneenne.com" <giometti@enneenne.com>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, Chris Packham
	<Chris.Packham@alliedtelesis.co.nz>, "sashal@kernel.org" <sashal@kernel.org>,
	"code@tyhicks.com" <code@tyhicks.com>
Subject: Re: [PATCH] rtc: ds1307: handle oscillator stop flag for
 ds1337/ds1339/ds3231
Thread-Topic: [PATCH] rtc: ds1307: handle oscillator stop flag for
 ds1337/ds1339/ds3231
Thread-Index: AQHc2SYs/dzU9DqYhU6v2CJYbHsOHLX9qaOAgAAdmgCAAUXLgIAAM4CA
Date: Tue, 5 May 2026 22:24:55 +0000
Message-ID: <39365e134ab175492292317ea14bb16172dd580b.camel@alliedtelesis.co.nz>
References: <20260501044657.1003980-2-ronan.dalton@alliedtelesis.co.nz>
	 <20260504-fd90667b1274c4e3a38a0604@linux.microsoft.com>
	 <4c097ca4fffed215395ec5979f0f0f43ed85cb97.camel@alliedtelesis.co.nz>
	 <20260505-5c718cd011b56364fefc885d@linux.microsoft.com>
In-Reply-To: <20260505-5c718cd011b56364fefc885d@linux.microsoft.com>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <A71995BC27C22C43BE8A512FDC88BE4C@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=FPe4xPos c=1 sm=1 tr=0 ts=69fa6e38 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=BhaoXNk7gXQA:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=9-M1_ZZmlhEKcAzbpmsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-Rspamd-Queue-Id: 3A40C4D4482
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[alliedtelesis.co.nz,quarantine];
	R_DKIM_ALLOW(-0.20)[alliedtelesis.co.nz:s=mail181024];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_FROM(0.00)[bounces-6466-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[alliedtelesis.co.nz:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Ronan.Dalton@alliedtelesis.co.nz,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCVD_COUNT_SEVEN(0.00)[7]

SGkgTWVhZ2FuLA0KDQpPbiBUdWUsIDIwMjYtMDUtMDUgYXQgMTI6MjAgLTA3MDAsIE1lYWdhbiBM
bG95ZCB3cm90ZToNCj4gSGkgUm9uYW4sDQo+IA0KPiBPbiBNb24sIE1heSAwNCwgMjAyNiBhdCAx
MTo1NDozMlBNICswMDAwLCBSb25hbiBEYWx0b24gd3JvdGU6DQo+ID4gSGkgTWVhZ2FuLA0KPiA+
IA0KPiA+IE9uIE1vbiwgMjAyNi0wNS0wNCBhdCAxNTowOCAtMDcwMCwgTWVhZ2FuIExsb3lkIHdy
b3RlOg0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIGRzXzEzMzc6DQo+ID4gPiA+ICvCoMKg
wqDCoMKgwqDCoGNhc2UgZHNfMTMzOToNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgY2FzZSBkc18x
MzQxOg0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIGRzXzMyMzE6DQo+ID4gPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSByZWdtYXBfcmVhZChkczEzMDctPnJlZ21h
cCwNCj4gPiA+ID4gRFMxMzM3X1JFR19TVEFUVVMsICZ0bXApOw0KPiA+ID4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Ow0KPiA+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHRtcCAmIERTMTMzN19CSVRfT1NGKQ0KPiA+ID4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAt
RUlOVkFMOw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7DQo+
ID4gPiANCj4gPiA+IElmIHlvdSdyZSBnb2luZyB0byByZS1hcnJhbmdlIHRoZSBibG9jayB0byBi
ZSBpbiBzb21ld2hhdCBvZiBhbg0KPiA+ID4gb3JkZXIsDQo+ID4gPiBwZXJoYXBzIHB1dCBpdCBh
Ym92ZSAxMzM4IHNpbmNlIDEzMzcgPCAxMzM4Lg0KPiA+IA0KPiA+IEkndmUgb3JkZXJlZCBpdCB0
aGlzIHdheSBiYXNlZCBvbiB0aGUgZmlyc3QgY2FzZSBzdGF0ZW1lbnQgaW4gZWFjaA0KPiA+IGJs
b2NrLiBTaW5jZSBkc18xMzM3ID4gZHNfMTMwOCwgSSd2ZSBwdXQgdGhlIGJsb2NrIGJlbG93IHRo
ZSBibG9jaw0KPiA+IHN0YXJ0aW5nIHdpdGggZHNfMTMwOC4gSSBjb3VsZCBpbnN0ZWFkIG9yZGVy
IGl0IGJhc2VkIG9uIHRoZSBsYXN0DQo+ID4gY2FzZQ0KPiA+IHN0YXRlbWVudCBpbiBlYWNoIGJs
b2NrLCBpZiB5b3UgdGhpbmsgdGhhdCdzIGJldHRlci4NCj4gDQo+IEkgYWdyZWUgd2l0aCB5b3Vy
IG9yZGVyaW5nIHN0cmF0ZWd5LCBidXQgeW91ciBwYXRjaCBpbnNlcnRzIGl0IGFmdGVyDQo+IHRo
ZQ0KPiBkc18xMzM4IGNhc2Ugc3RhdGVtZW50IGJsb2NrIChyYXRoZXIgdGhhbiB0aGUgaW50ZW5k
ZWQgZHNfMTMwOCkuDQo+IA0KDQpIZXJlJ3MgaG93IGl0IGN1cnJlbnRseSBpcyBpbiBkczEzMDdf
Z2V0X3RpbWU6DQoNCgljYXNlIGRzXzEzMDg6DQoJY2FzZSBkc18xMzM4Og0KCQlbc3RhdGVtZW50
IGJsb2NrICMxXQ0KCWNhc2UgZHNfMTMzNzoNCgljYXNlIGRzXzEzMzk6DQoJY2FzZSBkc18xMzQx
Og0KCWNhc2UgZHNfMzIzMToNCgkJW3N0YXRlbWVudCBibG9jayAjMl0NCg0KVG8gaW5zZXJ0IHN0
YXRlbWVudCBibG9jayAjMiBhZnRlciB0aGUgZHNfMTMwOCBjYXNlIGxhYmVsIHdvdWxkIGludm9s
dmUNCnRoZSBmb2xsb3dpbmc6DQoNCgljYXNlIGRzXzEzMDg6DQoJCVtzdGF0ZW1lbnQgYmxvY2sg
IzFdDQoJY2FzZSBkc18xMzM3Og0KCWNhc2UgZHNfMTMzOToNCgljYXNlIGRzXzEzNDE6DQoJY2Fz
ZSBkc18zMjMxOg0KCQlbc3RhdGVtZW50IGJsb2NrICMyXQ0KCWNhc2UgZHNfMTMzODoNCgkJW3N0
YXRlbWVudCBibG9jayAjMSwgZHVwbGljYXRlZF0NCg0KT3IgdGhlIGZvbGxvd2luZyB3aXRoIHN0
cmljdCBvcmRlcjoNCg0KCWNhc2UgZHNfMTMwODoNCgkJW3N0YXRlbWVudCBibG9jayAjMV0NCglj
YXNlIGRzXzEzMzc6DQoJCVtzdGF0ZW1lbnQgYmxvY2sgIzJdDQoJY2FzZSBkc18xMzM4Og0KCQlb
c3RhdGVtZW50IGJsb2NrICMxLCBkdXBsaWNhdGVkXQ0KCWNhc2UgZHNfMTMzOToNCgljYXNlIGRz
XzEzNDE6DQoJY2FzZSBkc18zMjMxOg0KCQlbc3RhdGVtZW50IGJsb2NrICMyLCBkdXBsaWNhdGVk
XQ0KDQpUaGUgY2FzZSBzdGF0ZW1lbnRzIGNhbiBiZSBwdXQgc3RyaWN0bHkgaW4gb3JkZXIsIGJ1
dCB0aGF0IHdpbGwgaW52b2x2ZQ0Kc29tZSBkdXBsaWNhdGlvbi4NCg==

