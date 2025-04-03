Return-Path: <linux-rtc+bounces-3770-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3528A7B292
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 01:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44F38179655
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 23:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD081DE3BC;
	Thu,  3 Apr 2025 23:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b="AJskXdOA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE80170A26
	for <linux-rtc@vger.kernel.org>; Thu,  3 Apr 2025 23:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.222.135.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743724431; cv=none; b=RFu9c3ZLMbd5axKops1VkGudQ3hyweHBhwd0FoCEZq5BAtcTlWF/vCPxJ+fERBv7jTlvOv2DPvuuF4WYVyFG+YJlzQEbyv8ScdkAFx6FghD66nEAXEm3Xz7qf+m+gmgxVbaiMkcbNogN9TMwqSTc78HaTOISe8KwzaPSW6DmIkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743724431; c=relaxed/simple;
	bh=pUOM7qngJS/jshmlgMYFtO+tcVmuDk/7q1p8jw4r6gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=srXfhwICiObXjcCqvk5lLe0xWDJ6JxTpthwD4vI2N/EfgrMMhkp6Ry5ci23QeVx5W4r4ERc+Vfw+UAPmgQI/jMuomcC4c8I8S6XFdc4J6QvacMzCHcNTsdfuXmIosL29EIHzPHYiTcSEH/CATAyV05PlHO0fXtXeF09T4ivnECY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl; spf=pass smtp.mailfrom=o2.pl; dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b=AJskXdOA; arc=none smtp.client-ip=193.222.135.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Received: (wp-smtpd smtp.tlen.pl 34089 invoked from network); 4 Apr 2025 01:47:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=20241105;
          t=1743724026; bh=5BfgGDSBvrOxgmq2pN+qeDgnWeZMHncc567X07Eiy9k=;
          h=Subject:To:Cc:From;
          b=AJskXdOA8ns7LIDR0Jb7ppJf0e0s0seZzDPdXnS2RukC6FonhOQa80iz8iItSgSm1
           ZKxGWj5ezGz4Wq7AiT99cCgey8YJZTxCedbjc9xqVuWQUyCyhr7PX4/97CrEa4Kf9o
           khvFUD89Gkdrncq7v4MaAEhqB3URMrh8aY0YZtiD4PxRe4stq9EwDVWLVMn/l0Orpu
           mcM11+R83knd6EhirgvHX168xnyZ3j1RyAbbvxYnYYeMREaK9bJJCS3FHVg848CjWI
           HoUC/MEMcsrELTsAz83YmUTSvpn7/3nZBg5JAsikZ8cowqF00kZdbXN8DSe9k3Sw2d
           O/92AOaUgQLIQ==
Received: from apn-78-30-73-179.dynamic.gprs.plus.pl (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[78.30.73.179])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <tglx@linutronix.de>; 4 Apr 2025 01:47:06 +0200
Message-ID: <8b7dedfc-b97d-4ff8-86af-8c92b3fb37cf@o2.pl>
Date: Fri, 4 Apr 2025 01:46:19 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ BUG: Invalid wait context ] rtc_lock at: mc146818_avoid_UIP
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 linux-rtc@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: lkml <linux-kernel@vger.kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Chris Bainbridge <chris.bainbridge@gmail.com>
References: <20250330113202.GAZ-krsjAnurOlTcp-@fat_crate.local>
 <87sempv17b.ffs@tglx>
Content-Language: en-GB, pl
From: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Autocrypt: addr=mat.jonczyk@o2.pl; keydata=
 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
 TANkZ3QqXNX2
In-Reply-To: <87sempv17b.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: d63111ab4b34202c8c63b3759b5597c4
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [4XMk]                               

W dniu 3.04.2025 o 15:12, Thomas Gleixner pisze:
> On Sun, Mar 30 2025 at 13:32, Borislav Petkov wrote:
>> while playing with suspend to RAM, I got this lockdep splat below.
>>
>> Poking around I found:
>>
>> ec5895c0f2d8 ("rtc: mc146818-lib: extract mc146818_avoid_UIP")
>>
>> which is doing this funky taking and dropping the rtc_lock and I guess that's
>> inherited from ye olde times.
>>
>> I "fixed" it so lockdeup doesn't warn by converting rtc_lock to a raw spinlock
>> but this is definitely not the right fix so let me bounce it off to the folks
>> on Cc who might have a better idea perhaps...
> Converting it to a raw lock "fixes" the problem, but RT people will hunt
> you down with a big latency bat.
>
> But this is not related to the commit above and not new.
>
> timekeeping_suspend() has always invoked mach_get_cmos_time() with the
> freeze lock held and mc146818_get_time() has always locked rtc_lock.
>
> I wonder, why this splat hasn't popped before. On RT lockdep should have
> complained forever. Sebastian???

Hello,

I was able to trigger the bug on Linux 6.1.0 with
CONFIG_PROVE_RAW_LOCK_NESTING enabled and I suspect it can be
triggered much earlier.

It is likely that only after

commit 560af5dc839eef ("lockdep: Enable PROVE_RAW_LOCK_NESTING with PROVE_LOCKING.")

people are seeing this simply because no one previously did
the test with CONFIG_PROVE_RAW_LOCK_NESTING=y.

See https://lore.kernel.org/all/CAP-bSRZ0CWyZZsMtx046YV8L28LhY0fson2g4EqcwRAVN1Jk+Q@mail.gmail.com/ :

> This splat happens on suspend/resume on a HP laptop. It doesn't appear
> to be a recent regression, as a bisect only leads to 560af5dc839e
> ("lockdep: Enable PROVE_RAW_LOCK_NESTING with PROVE_LOCKING.") -

Ccing Chris Bainbridge <chris.bainbridge@gmail.com>, author of the 
previous bug report.

Greetings,

Mateusz


