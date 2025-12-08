Return-Path: <linux-rtc+bounces-5507-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C54CCAD780
	for <lists+linux-rtc@lfdr.de>; Mon, 08 Dec 2025 15:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4417301B100
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Dec 2025 14:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02732EC563;
	Mon,  8 Dec 2025 14:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="hXmRSfSs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F821EA84;
	Mon,  8 Dec 2025 14:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765204546; cv=none; b=CliW7j+2fWJyKKsr0/2DEzyPmGN0tMF50oz4MJrJ57plNN/Kwem8UeO9vYn3+/2HjBoL82MJMM2o1HuUjNB6XsfY5uDZoxP8EbrmjgKdgpccUu/uNlxC3qAx6N3H5yJcaz/vD9duZAT52Zi5Wsddz3RJX0zBo+i3tg2T9HiL5hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765204546; c=relaxed/simple;
	bh=xO8dU7UTBPxQOjnMZaRCLB/JI4X0kHsARttn4ZBj7MM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ot+h6EqAudLKUZGplTsGZyRdvOf7n+tBbJCd8R2NLMcZENPDD2+f+3fWjyX51u+SuPm6HC38ZLqAPPvLR8pQIHSM7T/kiz9YeSoU/Ejza2sY5nhg6Fv+Y0o96zmb4YCaLQ9Q+e62Atu2ftCOqxS4g6RcI3CvLRE2Lga1N1QfRe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=hXmRSfSs; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Ba46iqGvPVxQZaXq9WNEuTq1PH6XqEj/ZP2zxUaVvwI=; t=1765204545;
	x=1765636545; b=hXmRSfSs4IQmLAgk0mXKuMmkey7EYvODbZWFEVfOx6Cm+aRbBnsrmElemaMMK
	iNhY9538uwbcSCNlBV9PWbP27VyMFQ/BtubDVM522jRZOJi0yjPF9N8jddt0dSUTEbu66F9B87w5n
	orp86R6GV+rqExAnPYnm/TJv2t8Qgm53HNGyABBfUZxevsvERTdjNsywLeEeuRZ91rHReyAozCQsA
	6Hw59mXs+pKudA69g/DsKLN46k+Ufi5QCshzHN8Vb64hgeBoKMB5UIF6dQi6W9Bew42GVLjhVaIV0
	+DzVc8s+/riXkhkun0aQRxjZcWbcDa5roLHwdaVRLBcdP6v+Iw==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vScL0-004U9y-37;
	Mon, 08 Dec 2025 15:35:43 +0100
Message-ID: <48db01b1-f4e5-4687-8ffb-472981d153ed@leemhuis.info>
Date: Mon, 8 Dec 2025 15:35:42 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: hwclock busted w/ M48T59 RTC (regression)
To: Nick Bowler <nbowler@draconx.ca>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, linux-rtc@vger.kernel.org
Cc: Esben Haabendal <esben@geanix.com>, stable@vger.kernel.org,
 sparclinux@vger.kernel.org
References: <krmiwpwogrvpehlqdrugb5glcmsu54qpw3mteonqeqymrvzz37@dzt7mes7qgxt>
 <gfwdg244bcmkv7l44fknfi4osd2b23unwaos7rnlirkdy2rrrt@yovd2vewdviv>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <gfwdg244bcmkv7l44fknfi4osd2b23unwaos7rnlirkdy2rrrt@yovd2vewdviv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1765204545;f93b2119;
X-HE-SMSGID: 1vScL0-004U9y-37

Lo!

On 11/26/25 04:18, Nick Bowler wrote:
> Any thoughts?

Not really, just a vague idea (and reminder, this is not my area or
expertise, I'm just tracking regressions):

Two fixes were proposed for the culprit, see:

https://lore.kernel.org/all/BN0PR08MB69510928028C933749F4139383D1A@BN0PR08MB6951.namprd08.prod.outlook.com/
https://lore.kernel.org/all/BN0PR08MB6951415A751F236375A2945683D1A@BN0PR08MB6951.namprd08.prod.outlook.com/

Wondering if they might help. Esben might have an idea, but in case
Esben does not reply maybe just give them a spin if you have a minute.

Ciao, Thorsten

> The problem is still present in 6.18-rc7 and reverting the commit
> indicated below still fixes it.
> 
> I am also seeing the same failure on a totally different system with
> Dallas DS1286 RTC, which is also fixed by reverting this commit.
> 
> Since the initial report this regression has been further backported
> to all the remaining longterm kernel series.
> 
> Thanks,
>   Nick
> 
> On Thu, Oct 23, 2025 at 12:45:13AM -0400, Nick Bowler wrote:
>> Hi,
>>
>> After a stable kernel update, the hwclock command seems no longer
>> functional on my SPARC system with an ST M48T59Y-70PC1 RTC:
>>
>>   # hwclock
>>   [...long delay...]
>>   hwclock: select() to /dev/rtc0 to wait for clock tick timed out
>>
>> On prior kernels, there is no problem:
>>
>>   # hwclock
>>   2025-10-22 22:21:04.806992-04:00
>>
>> I reproduced the same failure on 6.18-rc2 and bisected to this commit:
>>
>>   commit 795cda8338eab036013314dbc0b04aae728880ab
>>   Author: Esben Haabendal <esben@geanix.com>
>>   Date:   Fri May 16 09:23:35 2025 +0200
>>   
>>       rtc: interface: Fix long-standing race when setting alarm
>>
>> This commit was backported to all current 6.x stable branches,
>> as well as 5.15.x, so they all have the same regression.
>>
>> Reverting this commit on top of 6.18-rc2 corrects the problem.
>>
>> Let me know if you need any more info!
>>
>> Thanks,
>>   Nick
> 
> 


