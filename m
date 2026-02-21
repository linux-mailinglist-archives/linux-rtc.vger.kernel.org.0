Return-Path: <linux-rtc+bounces-5998-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IECjATTemWmJXAMAu9opvQ
	(envelope-from <linux-rtc+bounces-5998-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Feb 2026 17:32:52 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F47016D459
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Feb 2026 17:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5D3B302BE11
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Feb 2026 16:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE8C31BC94;
	Sat, 21 Feb 2026 16:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KSu0NGqF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE06B21D3CD
	for <linux-rtc@vger.kernel.org>; Sat, 21 Feb 2026 16:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771691569; cv=none; b=DIqEB8ZpnrU4EEgecdOYx7s625w2dCS0ZpPl7ImHUtSwM5vRMaDCWN3qN5pi6bN1cRKo0H+llSfsla1+HjiME7Q3cJp+2ptP48L8UUiuwXQh8ePVBY6SFXeb3k/8rwePEidUPDa3NtQQylQqQzHp4Sw0sLHybqqRW6/1eJmvu+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771691569; c=relaxed/simple;
	bh=T++o4PIPrW3bDyoXB1Mtj2wlyorw9tXJy62Q+71FGEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PRVbviWd2kAe4ClybieVEKckmq47eZTyKPncuzPh+fLzg23ku7iIirqBhk1XLxLL0FThK1azB4Rq2QcLN2JpM8uUWbBO0u5Gnr2Bry3iSPad+3gvmHPxykfMm4WUQCbA2uqo3FNhqPUzn5O3pFrrsij3qopuU9LTrEBzrYTwyq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KSu0NGqF; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <70d2f54c-a107-40b4-b90e-f4705cb8699c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771691555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T++o4PIPrW3bDyoXB1Mtj2wlyorw9tXJy62Q+71FGEk=;
	b=KSu0NGqFbCqbrcMXuENZwNVDFUOHh1k2R5OmKbWkKrncbHUa5+F7el8miNr5qfSAdS9lzw
	KnBcjRG9zbwlTTDtvuLMEZhbXhBFtdj9rKHUnxgRUadDMDTC3Qn9egeVsYUUvfk+rcyq2O
	0zBbZa3vULNMeEREu0kJORkfcoaG2SM=
Date: Sun, 22 Feb 2026 00:32:24 +0800
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops
 callbacks
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <20260116162203.296844-1-sunke@kylinos.cn>
 <20260116162203.296844-2-sunke@kylinos.cn>
 <DFSN0O9RRVD6.1LCI38JKGO1R0@kernel.org>
 <77d373dc-c5f2-4dca-b0d2-b5cee6a21b3b@gmail.com>
 <20260220225341c5eeb835@mail.local>
 <d1c9e33b-e1f3-41c6-af5e-a85fe2b86d10@linux.dev>
 <20260221111619162a41a1@mail.local>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <20260221111619162a41a1@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5998-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alvin.sun@linux.dev,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,i2c.rs:url,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 5F47016D459
X-Rspamd-Action: no action


On 2/21/26 19:16, Alexandre Belloni wrote:
> On 21/02/2026 17:31:09+0800, Alvin Sun wrote:
>> As in platform.rs [1] and i2c.rs [2], set_drvdata is always called by
>> the bus Adapter's probe_callback, not by the device driver.
>>
>> [1]:
>> https://elixir.bootlin.com/linux/v6.19-rc5/source/rust/kernel/platform.rs#L80
>> [2]:
>> https://elixir.bootlin.com/linux/v6.19-rc5/source/rust/kernel/i2c.rs#L160
>>
>> In Rust the Adapter already sets drvdata on the bus device in probe. If
>> the driver also calls amba_set_drvdata() there, it overwrites that
>> pointer; on remove/shutdown the framework then gets wrong data and can
>> hit use-after-free or crashes. So only the framework must set drvdata
>> on the bus device.
> But this is wrong, how do you then handle the class device on
> suspend/resume or on .remove?

There is a patch adding runtime PM for Tyr (platform device driver):

https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/60/diffs#dbdd2c5024317f2c80128c91a823e224b3a41550_240_256

If you are interested in adding Rust support for RTC, We can do some
research on top of it for RTC Rust drivers.

>
>> This applies only to the Rust implementation; in C, calling
>> amba_set_drvdata() is fine. In the Rust design the bus device owns the
>> bus device's drvdata and the class device owns the class device's
>> drvdata, so the class driver must not set drvdata on the bus device.
>>
>> This is my understanding of the Rust device driver abstraction design.
>> Danilo is the authority on this.
>>
>> Best regards,
>> Ke Sun
>>
>>> Out of 29 drivers, 18 are doing so.
>>>

