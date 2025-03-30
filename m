Return-Path: <linux-rtc+bounces-3705-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FEEA75A18
	for <lists+linux-rtc@lfdr.de>; Sun, 30 Mar 2025 14:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 673F7188B3FC
	for <lists+linux-rtc@lfdr.de>; Sun, 30 Mar 2025 12:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D121CAA87;
	Sun, 30 Mar 2025 12:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b="mLS6Ec1u"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECCA1C69D
	for <linux-rtc@vger.kernel.org>; Sun, 30 Mar 2025 12:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.222.135.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743338345; cv=none; b=UHtp/4iwuToZAIb1vk7bFxYFntMjAL3ePAnE9/Rlgai0aBSSV8OJhJG9fXzxooIqit0eX1Np9xfECQpvj20QGM2Yt+Ow1/n9DK8oQLcr/mlmGW09MjEIcOheQEZStUu1MBFgz9Wxdw8NAh4IIUHnyrdPuva58ETFq84NDMy3HpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743338345; c=relaxed/simple;
	bh=gClqjCZh9Kz32bL1aBMjsKWarsotUp4on4WdUJPJcfA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=oklMDMo05HH6wFWRNK27ZNv9gPOLcvMiiZFIGIk3fGbZU3fYrAmJL5RRYg+mDkoUjijLOjiJbdUhJ5si+ooFeGHs6zaKOHf/BlOiHmnhugXb2G5G+sNWSladsag8Ld7Ppvt5UrkE3G4x8lz6uog8iv/CS5IFRbfRIQm8sDGNFXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl; spf=pass smtp.mailfrom=o2.pl; dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b=mLS6Ec1u; arc=none smtp.client-ip=193.222.135.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Received: (wp-smtpd smtp.tlen.pl 28174 invoked from network); 30 Mar 2025 14:32:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=20241105;
          t=1743337942; bh=hoCDv68febeR3bUGtjvSv+eDR1SEWH0jExpg2Z6Cov4=;
          h=Subject:From:To:Cc;
          b=mLS6Ec1uk8rIFTMYwjjvGYZR8RStuGEi2maXF8ekp6qLZ9ZsOHTPfzd63jMvrrV/i
           kCfrN7WLikqrWWSqqXDjhPlfkfr7gSypTRZNylP5tFagamydYkas/YtNU4bFqc8pSh
           3La2pExpoxy/4mAPdOTFEqtEzrS/hXjxJwdEA6rWFru5NDtl+jzs+MqtsSn7UH/0E3
           BF2gDXBaCBTvjqikjym9CjklqyC9BIvhVj95/cu4QE86d88pMVk5aqzcu2SpT2thYW
           WXHJLuN4Fl0sAxdsFvSiOir3TT5m5kiYCVw7bkEkeICrGhSsm8K3W7YfLUQ4e8o4RP
           NSFm828n9Q0CA==
Received: from apn-78-30-75-194.dynamic.gprs.plus.pl (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[78.30.75.194])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <bp@alien8.de>; 30 Mar 2025 14:32:22 +0200
Message-ID: <45cee3c7-e1b2-4058-bc81-c6eb5935fad0@o2.pl>
Date: Sun, 30 Mar 2025 14:32:19 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ BUG: Invalid wait context ] rtc_lock at: mc146818_avoid_UIP
From: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To: Borislav Petkov <bp@alien8.de>, linux-rtc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: lkml <linux-kernel@vger.kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20250330113202.GAZ-krsjAnurOlTcp-@fat_crate.local>
 <947b1ceb-77a3-439b-bb7b-6eba38e12cb3@o2.pl>
Content-Language: en-GB, pl
Autocrypt: addr=mat.jonczyk@o2.pl; keydata=
 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
 TANkZ3QqXNX2
In-Reply-To: <947b1ceb-77a3-439b-bb7b-6eba38e12cb3@o2.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: e47304061ecc448764be7d6522469e98
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [obM0]                               

W dniu 30.03.2025 o 14:23, Mateusz Jończyk pisze:
> W dniu 30.03.2025 o 13:32, Borislav Petkov pisze:
>> So,
>>
>> while playing with suspend to RAM, I got this lockdep splat below.
>>
>> Poking around I found:
>>
>> ec5895c0f2d8 ("rtc: mc146818-lib: extract mc146818_avoid_UIP")
>>
>> which is doing this funky taking and dropping the rtc_lock and I 
>> guess that's
>> inherited from ye olde times.
>>
>> I "fixed" it so lockdeup doesn't warn by converting rtc_lock to a raw 
>> spinlock
>> but this is definitely not the right fix so let me bounce it off to 
>> the folks
>> on Cc who might have a better idea perhaps...
>>
>> Thx.
>
> Hello,
>
> This problem has been reported before, see
>
> https://lore.kernel.org/all/463fbc29-b41f-4d2d-a869-108114000cdb@o2.pl/
>
> I started work on converting rtc_lock to a raw spinlock, but got stuck 
> mostly to a lack
> of time etc. Only did some MIPS patches (unpublished).
>
> The problem is that timekeeping_suspend() takes a raw spinlock called 
> "tk_core.lock".
> With this lock taken, this function indirectly calls 
> mc146818_avoid_UIP(), which takes
> a normal spinlock called "rtc_lock". It is necessary to take the 
> rtc_lock while accessing
> the RTC: the RTC access cycle consists of writing to an index register 
> and then accessing
> the data register. If something else touches the index register in the 
> middle, we get garbage.
>
> During a RTC tick, the RTC date/time registers are in an unspecified 
> state - roughly during this
> time the UIP (Update In Progress) bit in an RTC register A is set. 
> This is handled by
> mc146818_avoid_UIP(). This function takes and releases the rtc_lock 
> multiple times,
> in order not to hold it for too long a time (while sleeping).

I meant "while waiting / while calling udelay()". mc146818_avoid_UIP() 
does not sleep.

> But the rtc_lock does need to be taken anyway.
>
> So the solutions would be:
>
> 1. Change the rtc_lock to a raw spinlock.
>
> 2. Change the tick_freeze_lock to a normal spinlock (if possible).
>
> 3. Possibly rewrite mc146818_avoid_UIP to avoid taking the rtc_lock if 
> the tick_freeze_lock is held (likely ugly).
>
> 4. Maybe something else I haven't thought about.
>
> Thanks,
>
> Mateusz

Greetings,

Mateusz


