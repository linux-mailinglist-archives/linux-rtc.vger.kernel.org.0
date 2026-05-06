Return-Path: <linux-rtc+bounces-6468-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMXNMTGg+mk9QgMAu9opvQ
	(envelope-from <linux-rtc+bounces-6468-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 06 May 2026 03:58:09 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D87D4D57AE
	for <lists+linux-rtc@lfdr.de>; Wed, 06 May 2026 03:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D9FF30432F9
	for <lists+linux-rtc@lfdr.de>; Wed,  6 May 2026 01:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30234280335;
	Wed,  6 May 2026 01:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="ztb032iw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F4E27EC7C
	for <linux-rtc@vger.kernel.org>; Wed,  6 May 2026 01:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778032652; cv=none; b=Yqdnqzbks6aYGbJAuHupNh1IsurxEbW5neIxDZVbha+00Au9OekfRy/2RVXNRp0L697L4C6M5Z28n9CRL9clt8Z8kCQIzN9bc+/twzw9vY4jrSaUadaUN7KdZcQGTi72Cx8dYeymIIz4O2rrgVRXr553M1NbY/mAQlsTAwG8QcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778032652; c=relaxed/simple;
	bh=OaoGIvKFW4UbwVqFZOsQs8kqw/46UzJdxD8+cTJD1zw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j+/h0unWAQ5Np4feb+AUBFressRU8VbLCYx9rYnUiK7Ved6xBQ3Qk/ECfK48BRNP8lC2778tSoSnjMT+EhKRElW1LaLNJN0P5604M41kpBAI1ahFLFc5aJKV7+f6ziCKA9kj3EeM6l0kGCLFuVPqaNroS/msKRAhk8FD6dcMcIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=ztb032iw; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 75C072C03FA;
	Wed,  6 May 2026 13:57:21 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1778032641;
	bh=OaoGIvKFW4UbwVqFZOsQs8kqw/46UzJdxD8+cTJD1zw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ztb032iwpD0MLhwj/uksp3adFpJEFtzQT0tGcB8IG7P/XdkdZCvuWv5LZ+JB4MRj/
	 tYlfG2Jd6m0FAPMuViimmqG98k7swoRtYKoTLHGjkvO0GT51+ZguMoJnkhhzBw5KTu
	 jdio61EcrJYqHhoiEiHwd6zGkhW39NucfQKIZgPE9zQueCIYuLwtnzU7R4W4ukOtdW
	 H966kODVkOg+C23B34Qg3nOOZTl2V5BZ9LnkYgVwXAzKW2JACDCn7y+Q8FnLN/+5RD
	 RMlTL0TJDJkC8Da2W8nzvWgEOjuVqeoKigy4cJrp+qaZQUBHWGVOSsnsQghieFPNF5
	 IZkCmr7qF2SPg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B69faa0010001>; Wed, 06 May 2026 13:57:21 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Wed, 6 May 2026 13:57:21 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.039; Wed, 6 May 2026 13:57:21 +1200
From: Ronan Dalton <Ronan.Dalton@alliedtelesis.co.nz>
To: "meaganlloyd@linux.microsoft.com" <meaganlloyd@linux.microsoft.com>
CC: "tgopinath@linux.microsoft.com" <tgopinath@linux.microsoft.com>,
	"giometti@enneenne.com" <giometti@enneenne.com>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "code@tyhicks.com" <code@tyhicks.com>, "Chris
 Packham" <Chris.Packham@alliedtelesis.co.nz>, "sashal@kernel.org"
	<sashal@kernel.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] rtc: ds1307: handle oscillator stop flag for
 ds1337/ds1339/ds3231
Thread-Topic: [PATCH] rtc: ds1307: handle oscillator stop flag for
 ds1337/ds1339/ds3231
Thread-Index: AQHc2SYs/dzU9DqYhU6v2CJYbHsOHLX9qaOAgAAdmgCAAUXLgIAAM4CAgAA21oCAAASDAA==
Date: Wed, 6 May 2026 01:57:21 +0000
Message-ID: <ba58416f0bf0dfa4c6a0ccccbff1c94dd1ea5a8a.camel@alliedtelesis.co.nz>
References: <20260501044657.1003980-2-ronan.dalton@alliedtelesis.co.nz>
	 <20260504-fd90667b1274c4e3a38a0604@linux.microsoft.com>
	 <4c097ca4fffed215395ec5979f0f0f43ed85cb97.camel@alliedtelesis.co.nz>
	 <20260505-5c718cd011b56364fefc885d@linux.microsoft.com>
	 <39365e134ab175492292317ea14bb16172dd580b.camel@alliedtelesis.co.nz>
	 <20260505-ec9618931e890b4f0f1b62ab@linux.microsoft.com>
In-Reply-To: <20260505-ec9618931e890b4f0f1b62ab@linux.microsoft.com>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C264AC1A60395468B43F86AE20634B4@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=FPe4xPos c=1 sm=1 tr=0 ts=69faa001 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=BhaoXNk7gXQA:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=yMhMjlubAAAA:8 a=0jVvKzCKWKXArcw2624A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-Rspamd-Queue-Id: 6D87D4D57AE
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
	TAGGED_FROM(0.00)[bounces-6468-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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

T24gVHVlLCAyMDI2LTA1LTA1IGF0IDE4OjQxIC0wNzAwLCBNZWFnYW4gTGxveWQgd3JvdGU6DQo+
IFJldmlld2VkLWJ5OiBNZWFnYW4gTGxveWQgPG1lYWdhbmxsb3lkQGxpbnV4Lm1pY3Jvc29mdC5j
b20+DQoNClRoYW5rcyENCg==

