Return-Path: <linux-rtc+bounces-6484-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eA+FFjJY/Wl7awAAu9opvQ
	(envelope-from <linux-rtc+bounces-6484-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 08 May 2026 05:27:46 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0D14F12C2
	for <lists+linux-rtc@lfdr.de>; Fri, 08 May 2026 05:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 226F83026F21
	for <lists+linux-rtc@lfdr.de>; Fri,  8 May 2026 03:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689E330C35C;
	Fri,  8 May 2026 03:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="ieD3eDSX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D621C3093DB
	for <linux-rtc@vger.kernel.org>; Fri,  8 May 2026 03:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778210842; cv=none; b=ACO2Q78NUyROpYK3qryM8Ze0mig1o/O/q5sVyx8kV9xWlmNdjNmL5otINC/RepcsS74GscTRpOihSLhB99Fv7QJSBqFoBqwu8/6zZFHnFceTkGSTEk5hIaqVuxp0zLJmqpPWvOb/adwJGvtrQCeVMOfyoxt60gj5s+LB87H3/Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778210842; c=relaxed/simple;
	bh=rbB/z4Y0F1qg+RaTyWDF9zuvc/clf6AH5hzXe5xISrU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I3//55f7ZaOP5KfHtmwVbmJLR+fRj2UBZnjn3dtQUAQyjvy/TFMVicOdBW93OaMT7kDn0XQR7lOgXPvB//L0z+F6RoL4TGE7RQVkNEm3i25JT4Dhya3bQkDdAAIjVA40LMcw5Ou5o2OFF+z6tSq4LODktN4fsK/Wxr0QvXcc5GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=ieD3eDSX; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BDED52C01F0;
	Fri,  8 May 2026 15:27:12 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1778210832;
	bh=rbB/z4Y0F1qg+RaTyWDF9zuvc/clf6AH5hzXe5xISrU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ieD3eDSXzp2Q4d7Tmv0vMKa8/1xtb/X/9QM4dJXv3aRyHVagsoUdSxQMnsMYNS/v5
	 anzx11HiHDgNKA+WWeZmS4qZQGL9Hmlet+rKxL1Z6VzxM1pQM3WrLn2wHlB3TwsRx5
	 X1ZjiNGoGacuMjKziG5WhuxKE6ShL2pWWToEueAPMEztJHGQXwKxZj/uEntLXTo6mR
	 uap7tZnPpPQz7KkKyvPzn+haTUeAWeUtSm8l6OcwwrFGbC8rQPDoXfiMRfmuf1jk/0
	 iIBRlENEl8Gp0bQFNTzBQO+xvDIzvZrufAF8Y6gztXrs0Xp8VRXLIsGDv+7Wo6UXHl
	 SbIa4OhhwLfPQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B69fd58100001>; Fri, 08 May 2026 15:27:12 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Fri, 8 May 2026 15:27:12 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.039; Fri, 8 May 2026 15:27:12 +1200
From: Ronan Dalton <Ronan.Dalton@alliedtelesis.co.nz>
To: "meaganlloyd@linux.microsoft.com" <meaganlloyd@linux.microsoft.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC: "sashal@kernel.org" <sashal@kernel.org>, "code@tyhicks.com"
	<code@tyhicks.com>, "giometti@enneenne.com" <giometti@enneenne.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Packham
	<Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH] rtc: ds1307: handle oscillator stop flag for
 ds1337/ds1339/ds3231
Thread-Topic: [PATCH] rtc: ds1307: handle oscillator stop flag for
 ds1337/ds1339/ds3231
Thread-Index: AQHc2SYs/dzU9DqYhU6v2CJYbHsOHLYCpAAAgAAVpoA=
Date: Fri, 8 May 2026 03:27:12 +0000
Message-ID: <8a470c22dc4c64e8d782d85aea812d2e9506b0de.camel@alliedtelesis.co.nz>
References: <20260501044657.1003980-2-ronan.dalton@alliedtelesis.co.nz>
	 <0ef9de5c-4b1d-461a-98e9-b04fb430fdde@linux.microsoft.com>
In-Reply-To: <0ef9de5c-4b1d-461a-98e9-b04fb430fdde@linux.microsoft.com>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9D2019418BA964C996A3B7E91E8162C@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=FPe4xPos c=1 sm=1 tr=0 ts=69fd5810 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=BhaoXNk7gXQA:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=9pfxhC3i-2PFz5wxGTQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-Rspamd-Queue-Id: AC0D14F12C2
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
	TAGGED_FROM(0.00)[bounces-6484-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,alliedtelesis.co.nz:mid,alliedtelesis.co.nz:dkim];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

T24gVGh1LCAyMDI2LTA1LTA3IGF0IDE5OjA5IC0wNzAwLCBNZWFnYW4gTGxveWQgd3JvdGU6DQo+
IA0KPiBPbiA0LzMwLzIwMjYgOTo0NiBQTSwgUm9uYW4gRGFsdG9uIHdyb3RlOg0KPiA+IEFuIGFs
dGVybmF0aXZlIHRvIHRoaXMgY2hhbmdlIGNvdWxkIGJlIGp1c3QgdG8gcmV2ZXJ0IHRoZQ0KPiA+
IHJlZmVyZW5jZWQgdHdvDQo+ID4gY29tbWl0cyBhbmQgbm90IHVzZSB0aGUgT1NGIGJpdCBhdCBh
bGwsIGFwYXJ0IGZyb20gbG9nZ2luZyBhDQo+ID4gd2FybmluZyBhbmQNCj4gPiBjbGVhcmluZyBp
dCBvbiBwcm9iZS4NCj4gQ2FuIHlvdSByZW1vdmUgdGhpcyBmcm9tIHRoZSBjb21taXQgbWVzc2Fn
ZT8NCg0KRG9uZS4NCg==

