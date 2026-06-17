Return-Path: <linux-rtc+bounces-6679-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7RYXIBQYMmrxugUAu9opvQ
	(envelope-from <linux-rtc+bounces-6679-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 05:44:20 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A559A696544
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 05:44:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=alliedtelesis.co.nz header.s=mail181024 header.b=J2Xi8xMH;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6679-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6679-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=alliedtelesis.co.nz;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CE8823003715
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jun 2026 03:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A940311C2D;
	Wed, 17 Jun 2026 03:44:13 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DCB3112B2
	for <linux-rtc@vger.kernel.org>; Wed, 17 Jun 2026 03:44:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781667853; cv=none; b=f64WY9Q9oPu/gIXegMgxG1fJgKCYZbYMYSxcE75UsDywyAnXQDLY6IH4KDcfyUmxjaSK6ngqBytMyrpEZaP88Xa7N243rPEpSoIpuvTYPkwJ1CZ+o5temvnnLmwvStzMUMl8ky6Pvx5GQ8DdwjPyd9NZSlFd4W/Yt8m7G+9M0Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781667853; c=relaxed/simple;
	bh=gyYnGdg7H/1xiLUN9Z0cxmwRKrOPdnD4i8OB80CRT2k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TfNTTEhoMG7HyvjjmACiyJMPvZ3Obau3e47ijd+FgUiz35Gk+j4ojO5fHFxcpJD6lvof9S+J/8gq2lXAbw9VNbgxbfLrxVoJbAnsmYcMd22yxf4+Oaq42AdPxelDEjnu0KyxbAq7as8pC2BfRZwKHekIipKsm/pjXz537Opc7Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=J2Xi8xMH; arc=none smtp.client-ip=202.36.163.20
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 682FD2C0276;
	Wed, 17 Jun 2026 15:34:01 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1781667241;
	bh=gyYnGdg7H/1xiLUN9Z0cxmwRKrOPdnD4i8OB80CRT2k=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=J2Xi8xMHMoROilhOPKxoynxuC2BOpRrioac0xjzrXSQBKL28Q8C1a5+Yqimy3UxBm
	 GN8mnH24OAODlYXZo1YiUIxzblT+skk3aGOxCBRrdpBp99bYhHHnnTyg5iBO5xtX0R
	 yVOXqkrZYVIhBo5OLmCqb+ttWSlsvo0RMthN5PEJ+pfPo8W1F91Y0byZm4WQ8W5wVT
	 8tdmLtC6QB3VoaEopI9C8xqKGxQiLIMwScuhZKkjdKpvWmszqTvTcFrQE9zchgmTIy
	 QQmpckOeVDkAQND6r7FRvQzJVZKtkJqhiU8OpNXwzHQ9WlaM5koEg5+jrPLJvoSy43
	 c1QJQDckc8D8w==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a3215a90001>; Wed, 17 Jun 2026 15:34:01 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Wed, 17 Jun 2026 15:34:01 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.039; Wed, 17 Jun 2026 15:34:01 +1200
From: Ronan Dalton <Ronan.Dalton@alliedtelesis.co.nz>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC: "sashal@kernel.org" <sashal@kernel.org>, "code@tyhicks.com"
	<code@tyhicks.com>, "giometti@enneenne.com" <giometti@enneenne.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"meaganlloyd@linux.microsoft.com" <meaganlloyd@linux.microsoft.com>, "Chris
 Packham" <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v3] rtc: ds1307: handle oscillator stop flag for
 ds1337/ds1339/ds3231
Thread-Topic: [PATCH v3] rtc: ds1307: handle oscillator stop flag for
 ds1337/ds1339/ds3231
Thread-Index: AQHc3pqCjudPSiLHA0qYJELJg23AUrZBjeYA
Date: Wed, 17 Jun 2026 03:34:01 +0000
Message-ID: <70aa1e06a8f16d9ab56c1a8deb26b84e216d0484.camel@alliedtelesis.co.nz>
References: <20260508032518.3696705-2-ronan.dalton@alliedtelesis.co.nz>
In-Reply-To: <20260508032518.3696705-2-ronan.dalton@alliedtelesis.co.nz>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C8A15D04FFA1E45BE57283DABB54911@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=TI3mSEla c=1 sm=1 tr=0 ts=6a3215a9 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=BhaoXNk7gXQA:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=FLmnqZ5pAAAA:8 a=yMhMjlubAAAA:8 a=gUfQWItQAAAA:8 a=eA2nYO4OpW7o5kGJ8vYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zY0JdQc1-4EAyPf5TuXT:22 a=d3PnA9EDa4IxuAV0gXij:22 a=8DxQ4-P9FUvTN4rw3Xy2:22 a=Xud5aiJGVNusHZ8q4fKI:22
X-SEG-SpamProfiler-Score: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[alliedtelesis.co.nz,quarantine];
	R_DKIM_ALLOW(-0.20)[alliedtelesis.co.nz:s=mail181024];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6679-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:sashal@kernel.org,m:code@tyhicks.com,m:giometti@enneenne.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:meaganlloyd@linux.microsoft.com,m:Chris.Packham@alliedtelesis.co.nz,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,bootlin.com:email,alliedtelesis.co.nz:dkim,alliedtelesis.co.nz:email,alliedtelesis.co.nz:mid,alliedtelesis.co.nz:from_mime];
	FORGED_SENDER(0.00)[Ronan.Dalton@alliedtelesis.co.nz,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[alliedtelesis.co.nz:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Ronan.Dalton@alliedtelesis.co.nz,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A559A696544

SGkgQWxleGFuZHJlLA0KDQpJIGp1c3Qgd2FudGVkIHRvIGZvbGxvdyB1cCBvbiB0aGlzIHBhdGNo
IGJlY2F1c2UgSSB0aGluayBpdCBtYXkgaGF2ZQ0KYmVlbiBtaXNzZWQgYnkgYWNjaWRlbnQuIEkn
bSBzdGlsbCBpbnRlcmVzdGVkIGluIGdldHRpbmcgaXQgbWVyZ2VkLsKgDQoNCkNvdWxkIHlvdSBn
aXZlIGl0IGEgbG9vaz8NCg0KVGhhbmtzLA0KUm9uYW4uDQoNCk9uIEZyaSwgMjAyNi0wNS0wOCBh
dCAxNToyNCArMTIwMCwgUm9uYW4gRGFsdG9uIHdyb3RlOg0KPiBQcmlvciB0byBjb21taXQgNDg0
NTg2NTQ2NTljICgicnRjOiBkczEzMDc6IHJlbW92ZSBjbGVhciBvZg0KPiBvc2NpbGxhdG9yDQo+
IHN0b3AgZmxhZyAoT1NGKSBpbiBwcm9iZSIpLCB0aGUgb3NjaWxsYXRvciBzdG9wIGZsYWcgKE9T
RikgYml0IHdhcw0KPiBjaGVja2VkIGR1cmluZyBkZXZpY2UgcHJvYmUgZm9yIHRoZSBkczEzMzcs
IGRzMTMzOSwgZHMxMzQxLCBhbmQNCj4gZHMzMjMxDQo+IGNoaXBzOyBpZiBpdCB3YXMgc2V0LCBp
dCB3b3VsZCBiZSBjbGVhcmVkIGFuZCBhIHdhcm5pbmcgd291bGQgYmUNCj4gbG9nZ2VkDQo+IHNh
eWluZyAiU0VUIFRJTUUhIi4gU2luY2UgdGhhdCBjb21taXQsIHRoZSBPU0YgYml0IGlzIG5vIGxv
bmdlcg0KPiBjbGVhcmVkLA0KPiBidXQgdGhlIHdhcm5pbmcgaXMgc3RpbGwgcHJpbnRlZC4NCj4g
DQo+IERpcmVjdGx5IGZvbGxvd2luZyB0aGF0IGNvbW1pdCwgdGhlcmUgd2FzIG5vIHdheSB0byBn
ZXQgcmlkIG9mIHRoaXMNCj4gd2FybmluZyBiZWNhdXNlIG5vdGhpbmcgY2xlYXJlZCB0aGUgT1NG
IGJpdCBvbiB0aGVzZSBjaGlwcy4NCj4gDQo+IFRoZSBjb21taXQgYXNzb2NpYXRlZCB3aXRoIHRo
ZSBwcmV2aW91cyBjb21taXQsIDUyMzkyM2NmZDVkNiAoInJ0YzoNCj4gZHMxMzA3OiBoYW5kbGUg
b3NjaWxsYXRvciBzdG9wIGZsYWcgKE9TRikgZm9yIGRzMTM0MSIpLCBtYWRlIHByb3Blcg0KPiB1
c2UNCj4gb2YgdGhlIE9TRiB3aGVuIGdldHRpbmcgYW5kIHNldHRpbmcgdGhlIHRpbWUgaW4gdGhl
IFJUQy4gSG93ZXZlciwgdGhlDQo+IG90aGVyIFJUQyB2YXJpYW50cyBkczEzMzcsIGRzMTMzOSBh
bmQgZHMzMjMxIGRpZG4ndCBoYXZlIGENCj4gY29ycmVzcG9uZGluZw0KPiBjaGFuZ2UgbWFkZS4N
Cj4gDQo+IEdpdmVuIHRoYXQgdGhlIE9TRiBiaXQgaXMgbm8gbG9uZ2VyIGNsZWFyZWQgYXQgcHJv
YmUgdGltZSB3aGVuIGl0IGlzDQo+IHNldCwgdGhlIHJlbWFpbmluZyB0aHJlZSBjaGlwcyBzaG91
bGQgaGF2ZSB0aGUgc2FtZSBoYW5kbGluZyBhcyB0aGUNCj4gZHMxMzQxIGNoaXAgaGFzIGZvciB0
aGUgT1NGIGJpdC4NCj4gDQo+IEZpeCB0aGUgaXNzdWUgb24gdGhlIGRzMTMzNywgZHMxMzM5IGFu
ZCBkczMyMzEgY2hpcHMgYnkgYXBwbHlpbmcgdGhlDQo+IHNhbWUgbG9naWMgYXMgdGhlIGRzMTM0
MSBoYXMgdG8gdGhlc2UgY2hpcHMuDQo+IA0KPiBOb3RlIHRoYXQgYW55IGRldmljZXMgYnJvdWdo
dCB1cCBiZXR3ZWVuIHRoZSBmaXJzdCByZWZlcmVuY2VkIGNvbW1pdA0KPiBhbmQNCj4gdGhpcyBv
bmUgbWF5IGJlZ2luIG1pc3RydXN0aW5nIHRoZSB0aW1lIHJlcG9ydGVkIGJ5IHRoZSBSVEMgdW50
aWwgaXQNCj4gaXMNCj4gc2V0IGFnYWluLCBpZiB0aGUgYml0IHdhcyBuZXZlciBleHBsaWNpdGx5
IGNsZWFyZWQuDQo+IA0KPiBOb3RlIHRoYXQgb25seSB0aGUgZHMxMzM5IHdhcyB0ZXN0ZWQgd2l0
aCB0aGlzIGNoYW5nZSwgYnV0IHRoZQ0KPiBkYXRhc2hlZXRzIGZvciB0aGUgb3RoZXIgY2hpcHMg
Y29udGFpbiBlc3NlbnRpYWxseSBpZGVudGljYWwNCj4gZGVzY3JpcHRpb25zIG9mIHRoZSBPU0Yg
Yml0IHNvIHRoZSBzYW1lIGNoYW5nZSBzaG91bGQgd29yay4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFJvbmFuIERhbHRvbiA8cm9uYW4uZGFsdG9uQGFsbGllZHRlbGVzaXMuY28ubno+DQo+IENjOiBs
aW51eC1ydGNAdmdlci5rZXJuZWwub3JnDQo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnDQo+IENjOiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5j
b20+DQo+IENjOiBUeWxlciBIaWNrcyA8Y29kZUB0eWhpY2tzLmNvbT4NCj4gQ2M6IFNhc2hhIExl
dmluIDxzYXNoYWxAa2VybmVsLm9yZz4NCj4gQ2M6IE1lYWdhbiBMbG95ZCA8bWVhZ2FubGxveWRA
bGludXgubWljcm9zb2Z0LmNvbT4NCj4gQ2M6IFJvZG9sZm8gR2lvbWV0dGkgPGdpb21ldHRpQGVu
bmVlbm5lLmNvbT4NCj4gQ2M6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVs
ZXNpcy5jby5uej4NCj4gRml4ZXM6IDQ4NDU4NjU0NjU5YyAoInJ0YzogZHMxMzA3OiByZW1vdmUg
Y2xlYXIgb2Ygb3NjaWxsYXRvciBzdG9wDQo+IGZsYWcgKE9TRikgaW4gcHJvYmUiKQ0KPiAtLS0N
Cj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSBSZW1vdmUgcGFyYWdyYXBoIG1lbnRpb25pbmcgYWx0ZXJu
YXRpdmUgZml4IGZyb20gY29tbWl0IG1lc3NhZ2UNCj4gDQo+IENoYW5nZXMgaW4gdjI6DQo+IC0g
Rml4IGhhc2hlcyBvZiByZWZlcmVuY2VkIGNvbW1pdHMNCj4gDQo+IMKgZHJpdmVycy9ydGMvcnRj
LWRzMTMwNy5jIHwgMjggKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQ0KPiDCoDEgZmlsZSBj
aGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3J0Yy9ydGMtZHMxMzA3LmMgYi9kcml2ZXJzL3J0Yy9ydGMtZHMxMzA3LmMN
Cj4gaW5kZXggNzIwNWM1OWZmNzI5Li5lZGY4MWI5NzVkZWMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvcnRjL3J0Yy1kczEzMDcuYw0KPiArKysgYi9kcml2ZXJzL3J0Yy9ydGMtZHMxMzA3LmMNCj4g
QEAgLTI2OSw2ICsyNjksMTYgQEAgc3RhdGljIGludCBkczEzMDdfZ2V0X3RpbWUoc3RydWN0IGRl
dmljZSAqZGV2LA0KPiBzdHJ1Y3QgcnRjX3RpbWUgKnQpDQo+IMKgCQlpZiAodG1wICYgRFMxMzM4
X0JJVF9PU0YpDQo+IMKgCQkJcmV0dXJuIC1FSU5WQUw7DQo+IMKgCQlicmVhazsNCj4gKwljYXNl
IGRzXzEzMzc6DQo+ICsJY2FzZSBkc18xMzM5Og0KPiArCWNhc2UgZHNfMTM0MToNCj4gKwljYXNl
IGRzXzMyMzE6DQo+ICsJCXJldCA9IHJlZ21hcF9yZWFkKGRzMTMwNy0+cmVnbWFwLCBEUzEzMzdf
UkVHX1NUQVRVUywNCj4gJnRtcCk7DQo+ICsJCWlmIChyZXQpDQo+ICsJCQlyZXR1cm4gcmV0Ow0K
PiArCQlpZiAodG1wICYgRFMxMzM3X0JJVF9PU0YpDQo+ICsJCQlyZXR1cm4gLUVJTlZBTDsNCj4g
KwkJYnJlYWs7DQo+IMKgCWNhc2UgZHNfMTM0MDoNCj4gwqAJCWlmICh0bXAgJiBEUzEzNDBfQklU
X25FT1NDKQ0KPiDCoAkJCXJldHVybiAtRUlOVkFMOw0KPiBAQCAtMjc5LDEzICsyODksNiBAQCBz
dGF0aWMgaW50IGRzMTMwN19nZXRfdGltZShzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+IHN0cnVjdCBy
dGNfdGltZSAqdCkNCj4gwqAJCWlmICh0bXAgJiBEUzEzNDBfQklUX09TRikNCj4gwqAJCQlyZXR1
cm4gLUVJTlZBTDsNCj4gwqAJCWJyZWFrOw0KPiAtCWNhc2UgZHNfMTM0MToNCj4gLQkJcmV0ID0g
cmVnbWFwX3JlYWQoZHMxMzA3LT5yZWdtYXAsIERTMTMzN19SRUdfU1RBVFVTLA0KPiAmdG1wKTsN
Cj4gLQkJaWYgKHJldCkNCj4gLQkJCXJldHVybiByZXQ7DQo+IC0JCWlmICh0bXAgJiBEUzEzMzdf
QklUX09TRikNCj4gLQkJCXJldHVybiAtRUlOVkFMOw0KPiAtCQlicmVhazsNCj4gwqAJY2FzZSBk
c18xMzg4Og0KPiDCoAkJcmV0ID0gcmVnbWFwX3JlYWQoZHMxMzA3LT5yZWdtYXAsIERTMTM4OF9S
RUdfRkxBRywNCj4gJnRtcCk7DQo+IMKgCQlpZiAocmV0KQ0KPiBAQCAtMzgwLDE0ICszODMsMTcg
QEAgc3RhdGljIGludCBkczEzMDdfc2V0X3RpbWUoc3RydWN0IGRldmljZSAqZGV2LA0KPiBzdHJ1
Y3QgcnRjX3RpbWUgKnQpDQo+IMKgCQlyZWdtYXBfdXBkYXRlX2JpdHMoZHMxMzA3LT5yZWdtYXAs
DQo+IERTMTMwN19SRUdfQ09OVFJPTCwNCj4gwqAJCQkJwqDCoCBEUzEzMzhfQklUX09TRiwgMCk7
DQo+IMKgCQlicmVhazsNCj4gKwljYXNlIGRzXzEzMzc6DQo+ICsJY2FzZSBkc18xMzM5Og0KPiAr
CWNhc2UgZHNfMTM0MToNCj4gKwljYXNlIGRzXzMyMzE6DQo+ICsJCXJlZ21hcF91cGRhdGVfYml0
cyhkczEzMDctPnJlZ21hcCwNCj4gRFMxMzM3X1JFR19TVEFUVVMsDQo+ICsJCQkJwqDCoCBEUzEz
MzdfQklUX09TRiwgMCk7DQo+ICsJCWJyZWFrOw0KPiDCoAljYXNlIGRzXzEzNDA6DQo+IMKgCQly
ZWdtYXBfdXBkYXRlX2JpdHMoZHMxMzA3LT5yZWdtYXAsIERTMTM0MF9SRUdfRkxBRywNCj4gwqAJ
CQkJwqDCoCBEUzEzNDBfQklUX09TRiwgMCk7DQo+IMKgCQlicmVhazsNCj4gLQljYXNlIGRzXzEz
NDE6DQo+IC0JCXJlZ21hcF91cGRhdGVfYml0cyhkczEzMDctPnJlZ21hcCwNCj4gRFMxMzM3X1JF
R19TVEFUVVMsDQo+IC0JCQkJwqDCoCBEUzEzMzdfQklUX09TRiwgMCk7DQo+IC0JCWJyZWFrOw0K
PiDCoAljYXNlIGRzXzEzODg6DQo+IMKgCQlyZWdtYXBfdXBkYXRlX2JpdHMoZHMxMzA3LT5yZWdt
YXAsIERTMTM4OF9SRUdfRkxBRywNCj4gwqAJCQkJwqDCoCBEUzEzODhfQklUX09TRiwgMCk7DQoN
Cg==

