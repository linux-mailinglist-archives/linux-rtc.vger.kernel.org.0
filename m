Return-Path: <linux-rtc+bounces-6480-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBd8Nf8j/Wn6YAAAu9opvQ
	(envelope-from <linux-rtc+bounces-6480-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 08 May 2026 01:45:03 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5026F4F034C
	for <lists+linux-rtc@lfdr.de>; Fri, 08 May 2026 01:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48516300D1C7
	for <lists+linux-rtc@lfdr.de>; Thu,  7 May 2026 23:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C3437EFE4;
	Thu,  7 May 2026 23:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="c7xjfAIl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE2133E373
	for <linux-rtc@vger.kernel.org>; Thu,  7 May 2026 23:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778197500; cv=none; b=gHG8C4sZQPQJz0WaVbRGIbbZAXtt1YMT4UfcifZc70ZRB8m6RaYEhtR0ocMjRfjWwqYab6oH5ZI4XjSXEDY+DppMnt5tq2es0f6+4feWAPa/xngjrLruXMDdIpyslCyGyBFWmMp8IyaDpwUx72MHhgEkGjPgmO4XRLuYgilOeRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778197500; c=relaxed/simple;
	bh=8E08JR1x8OEjEBYesWMNmtZmhDrHwP3hpL7HzGY8RfQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sWHeXiiDNT/BQn55jW1K1Xg17P4nvdcOqq5xg5Q8VMWczs7BWCkEl3CzG0twJhQvjKEaKHQK6iFn8ZxLJKR1Jk/+qfxs3Zu+0sTDF1BZgiZ50kzyjMpvx9P0hcqO5TOiQcroA0crE8E7se6FrDXQzD0k3AIotkGse9Qy0JTzwK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=c7xjfAIl; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id EDE1F2C0183;
	Fri,  8 May 2026 11:44:48 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1778197488;
	bh=8E08JR1x8OEjEBYesWMNmtZmhDrHwP3hpL7HzGY8RfQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=c7xjfAIltjjbA8fW8sQZOEW7V6hzBXtI4aIpRgbxR7sN8iR9w0A4S54GU7ipyoncX
	 30dE8bDfxHXhRGgGSwICPrwUBqIN5qgFdR3fiA0NzB5KK5KdMm7lbb5f6H5tGg9l+C
	 dZYFwmHPSW7Vw6+Ml3LVrxEVRgA/J839pP5yVADWSOwYOLrM0oVLjLECRLZxVlEjEi
	 n/DxNTvRRLcxVl+HBkRvCeBiiCqkeZTRce74DrDZI4+LM3u6HaDRZH4fcdyHkKnXiU
	 X1usNZFSZanPIAw4mPseQKCtEggCk4qBqGeBd7Adj8wdbVGWpN+xgU2uA3XxhXp7Ca
	 W9oiyAGH4qtOQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B69fd23ef0000>; Fri, 08 May 2026 11:44:47 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Fri, 8 May 2026 11:44:46 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.039; Fri, 8 May 2026 11:44:46 +1200
From: Ronan Dalton <Ronan.Dalton@alliedtelesis.co.nz>
To: "code@tyhicks.com" <code@tyhicks.com>
CC: "sashal@kernel.org" <sashal@kernel.org>, "giometti@enneenne.com"
	<giometti@enneenne.com>, "meaganlloyd@linux.microsoft.com"
	<meaganlloyd@linux.microsoft.com>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, Chris Packham
	<Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH] rtc: ds1307: handle oscillator stop flag for
 ds1337/ds1339/ds3231
Thread-Topic: [PATCH] rtc: ds1307: handle oscillator stop flag for
 ds1337/ds1339/ds3231
Thread-Index: AQHc2SYs/dzU9DqYhU6v2CJYbHsOHLYB7jWAgACNTAA=
Date: Thu, 7 May 2026 23:44:46 +0000
Message-ID: <516a340925419655dae2967f7ad996ed2e995e97.camel@alliedtelesis.co.nz>
References: <20260501044657.1003980-2-ronan.dalton@alliedtelesis.co.nz>
	 <afytZzYGaSG-6V6y@yaupon>
In-Reply-To: <afytZzYGaSG-6V6y@yaupon>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1601801442CDB4C92DEFB27586A8D5F@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=FPe4xPos c=1 sm=1 tr=0 ts=69fd23ef a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=BhaoXNk7gXQA:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=z6DmqFdrAAAA:8 a=GOU78zvoPd1deeDqtAwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=sWf6SEGcLVeEBSvlKYKl:22
X-SEG-SpamProfiler-Score: 0
X-Rspamd-Queue-Id: 5026F4F034C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[alliedtelesis.co.nz,quarantine];
	R_DKIM_ALLOW(-0.20)[alliedtelesis.co.nz:s=mail181024];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,thicks.com:email,alliedtelesis.co.nz:mid,alliedtelesis.co.nz:dkim];
	TAGGED_FROM(0.00)[bounces-6480-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[alliedtelesis.co.nz:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Ronan.Dalton@alliedtelesis.co.nz,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

T24gVGh1LCAyMDI2LTA1LTA3IGF0IDEwOjE5IC0wNTAwLCBUeWxlciBIaWNrcyB3cm90ZToNCj4g
T24gMjAyNi0wNS0wMSAxNjo0NjoxMCwgUm9uYW4gRGFsdG9uIHdyb3RlOg0KPiA+IFByaW9yIHRv
IGNvbW1pdCA2Y2IwZDg1ODdiOTYgKCJydGM6IGRzMTMwNzogcmVtb3ZlIGNsZWFyIG9mDQo+ID4g
b3NjaWxsYXRvcg0KPiANCj4gVGhpcyBjb21taXQgaGFzaCBpcyBmcm9tIHRoZSBsaW51eC02LjEy
Lnkgc3RhYmxlIGJyYW5jaCBidXQgd2Ugc2hvdWxkDQo+IHVzZSBoYXNoZXMgZnJvbSBMaW51cycg
dHJlZSBpbiB0aGlzIGNvbW1pdCBtZXNzYWdlOg0KPiANCj4gwqA0ODQ1ODY1NDY1OWMgKCJydGM6
IGRzMTMwNzogcmVtb3ZlIGNsZWFyIG9mIG9zY2lsbGF0b3Igc3RvcCBmbGFnDQo+IChPU0YpIGlu
IHByb2JlIikNCj4gPiANCj4gPiBUaGUgY29tbWl0IGFzc29jaWF0ZWQgd2l0aCB0aGUgcHJldmlv
dXMgY29tbWl0LCBhZTAzYTI4ZTEyYTcgKCJydGM6DQo+IA0KPiBUaGUgY29tbWl0IGhhc2ggcmVm
ZXJlbmNlZCBoZXJlIHNob3VsZCBiZSA1MjM5MjNjZmQ1ZDYuDQo+ID4gDQo+ID4gRml4ZXM6IDZj
YjBkODU4N2I5NiAoInJ0YzogZHMxMzA3OiByZW1vdmUgY2xlYXIgb2Ygb3NjaWxsYXRvciBzdG9w
DQo+ID4gZmxhZyAoT1NGKSBpbiBwcm9iZSIpDQo+IA0KPiBQbGVhc2UgYWRqdXN0IHRoZSBjb21t
aXQgaGFzaCBoZXJlLCBhcyB3ZWxsLiBFdmVyeXRoaW5nIGVsc2UgbG9va3MNCj4gZ29vZC4NCg0K
R29vZCBjYXRjaC4gSSdsbCBzZW5kIGEgZm9sbG93LXVwIHBhdGNoIHdpdGggdGhlc2UgY29tbWl0
IGhhc2hlcyBmaXhlZC4NCg0KPiANCj4gUmV2aWV3ZWQtYnk6IFR5bGVyIEhpY2tzIDxjb2RlQHRo
aWNrcy5jb20+DQo+IA0KPiBUeWxlcg0KDQpDaGVlcnMNCj4gDQo=

