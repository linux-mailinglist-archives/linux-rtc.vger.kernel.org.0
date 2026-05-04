Return-Path: <linux-rtc+bounces-6463-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LTyJcYx+WkG6gIAu9opvQ
	(envelope-from <linux-rtc+bounces-6463-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 05 May 2026 01:54:46 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2424C4FF2
	for <lists+linux-rtc@lfdr.de>; Tue, 05 May 2026 01:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 798C030115B2
	for <lists+linux-rtc@lfdr.de>; Mon,  4 May 2026 23:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220783E717C;
	Mon,  4 May 2026 23:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="GAGIFq6o"
X-Original-To: linux-rtc@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D121938CFEF
	for <linux-rtc@vger.kernel.org>; Mon,  4 May 2026 23:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777938883; cv=none; b=HnA0XTczJDeMhPByGOH0rx3EbwgkTuuFfWAcVap5qLyHcrS+53/lu+EZ60VuUTEliXMLk0UvHoSVmhiunidj/mxwQgTro6vQktLuH0xufYaku0zx8QjHnDJbQctasYGiB/BjxR22O/gaKxvOybrzA6TCliO5g/PZC0ajzKgqspU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777938883; c=relaxed/simple;
	bh=k8rZx155B7yknBFC/um5IJmbbuPF2tvu6qu+CLrdeU4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FxgjQK4+Ogpl/fjG7Y3Iw32cg/7K/cSSLmcLSkP/EowG+SuQiYfFb8G1SrnH8/i6jiJrLTtVTajb+ehpN7DYpdxDmTXpIbCPZimjmjZlzQ6Bv1Qf4DQ80rAMkFCCUlYDKTxZXYE9kUgPH+RA/y1gRLZxyORz08NLqUJsWy2yVYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=GAGIFq6o; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 56A592C04F5;
	Tue,  5 May 2026 11:54:33 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1777938873;
	bh=k8rZx155B7yknBFC/um5IJmbbuPF2tvu6qu+CLrdeU4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=GAGIFq6o4QsxszUeuGFNa/l5Lk/VfZaMv1Ex5zzUYj6JADPSvrcaLc3ChxkSFN3eA
	 knvypfTOjKYBcZm6Qpj+c4fC9Vj2oaJa4FWnpMyTTT4aTDMt/e5V7KT811l0t7Ny+6
	 IpAWHuiAe9mh9nVTbUN4HCODrQvd2VCmMO90MRgTeGM5hpOMKO9FLen1gyZ+e5et2c
	 tjTd7cmO3ANXjnP0aCMGqDhRGKduJt7/CQ0BzniagBhpl1unG79TquQ2dv8DeUwJJk
	 IBy2tRej1Ge3+KLUQEDj2qRSG9HxkHUEWVdDe3O5u4pfRzcrLiLlukr27zEwi9PEtj
	 5Gz00Rn+GwuEg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B69f931b90001>; Tue, 05 May 2026 11:54:33 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Tue, 5 May 2026 11:54:33 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.039; Tue, 5 May 2026 11:54:33 +1200
From: Ronan Dalton <Ronan.Dalton@alliedtelesis.co.nz>
To: "meaganlloyd@linux.microsoft.com" <meaganlloyd@linux.microsoft.com>
CC: "tgopinath@linux.microsoft.com" <tgopinath@linux.microsoft.com>,
	"code@tyhicks.com" <code@tyhicks.com>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "giometti@enneenne.com"
	<giometti@enneenne.com>, Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	"sashal@kernel.org" <sashal@kernel.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] rtc: ds1307: handle oscillator stop flag for
 ds1337/ds1339/ds3231
Thread-Topic: [PATCH] rtc: ds1307: handle oscillator stop flag for
 ds1337/ds1339/ds3231
Thread-Index: AQHc2SYs/dzU9DqYhU6v2CJYbHsOHLX9qaOAgAAdmgA=
Date: Mon, 4 May 2026 23:54:32 +0000
Message-ID: <4c097ca4fffed215395ec5979f0f0f43ed85cb97.camel@alliedtelesis.co.nz>
References: <20260501044657.1003980-2-ronan.dalton@alliedtelesis.co.nz>
	 <20260504-fd90667b1274c4e3a38a0604@linux.microsoft.com>
In-Reply-To: <20260504-fd90667b1274c4e3a38a0604@linux.microsoft.com>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <30B8F1F194FEB54A8BD76313849AD700@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=FPe4xPos c=1 sm=1 tr=0 ts=69f931b9 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=BhaoXNk7gXQA:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=SkGgXHIgSkrV2LiTOisA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-Rspamd-Queue-Id: BB2424C4FF2
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,alliedtelesis.co.nz:dkim,alliedtelesis.co.nz:mid];
	TAGGED_FROM(0.00)[bounces-6463-lists,linux-rtc=lfdr.de];
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

SGkgTWVhZ2FuLAoKT24gTW9uLCAyMDI2LTA1LTA0IGF0IDE1OjA4IC0wNzAwLCBNZWFnYW4gTGxv
eWQgd3JvdGU6Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIGRzXzEzMzc6Cj4gPiArwqDCoMKgwqDC
oMKgwqBjYXNlIGRzXzEzMzk6Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIGRzXzEzNDE6Cj4gPiAr
wqDCoMKgwqDCoMKgwqBjYXNlIGRzXzMyMzE6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmV0ID0gcmVnbWFwX3JlYWQoZHMxMzA3LT5yZWdtYXAsCj4gPiBEUzEzMzdfUkVHX1NU
QVRVUywgJnRtcCk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJu
IHJldDsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAodG1wICYgRFMxMzM3
X0JJVF9PU0YpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHJldHVybiAtRUlOVkFMOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJy
ZWFrOwo+IAo+IElmIHlvdSdyZSBnb2luZyB0byByZS1hcnJhbmdlIHRoZSBibG9jayB0byBiZSBp
biBzb21ld2hhdCBvZiBhbgo+IG9yZGVyLAo+IHBlcmhhcHMgcHV0IGl0IGFib3ZlIDEzMzggc2lu
Y2UgMTMzNyA8IDEzMzguCgpJJ3ZlIG9yZGVyZWQgaXQgdGhpcyB3YXkgYmFzZWQgb24gdGhlIGZp
cnN0IGNhc2Ugc3RhdGVtZW50IGluIGVhY2gKYmxvY2suIFNpbmNlIGRzXzEzMzcgPiBkc18xMzA4
LCBJJ3ZlIHB1dCB0aGUgYmxvY2sgYmVsb3cgdGhlIGJsb2NrCnN0YXJ0aW5nIHdpdGggZHNfMTMw
OC4gSSBjb3VsZCBpbnN0ZWFkIG9yZGVyIGl0IGJhc2VkIG9uIHRoZSBsYXN0IGNhc2UKc3RhdGVt
ZW50IGluIGVhY2ggYmxvY2ssIGlmIHlvdSB0aGluayB0aGF0J3MgYmV0dGVyLgo=

