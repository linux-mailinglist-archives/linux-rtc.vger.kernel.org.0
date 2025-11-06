Return-Path: <linux-rtc+bounces-5277-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A055C3A432
	for <lists+linux-rtc@lfdr.de>; Thu, 06 Nov 2025 11:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1B7124F85F1
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Nov 2025 10:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8348B271A9A;
	Thu,  6 Nov 2025 10:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="sS2O1qPK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1562248B4;
	Thu,  6 Nov 2025 10:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762424760; cv=none; b=OH6sM+BzQHk0qRXWybbMiP64bQo7u5Fgl3wktGZtx7q7Oxx1ZYITYgtdng1yTdy/vPVn+qo37wYNgrAjDAhFUGJRpLMitSN4vZ4P3prwBU47CS/gmw7+ayBOeyF2Hnxa/nhcbtikOJ6APabOe7pHAgzd7Memmo1+/v58zmew9z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762424760; c=relaxed/simple;
	bh=l6IJfTSubUl1j+bVYQvNukvCpqigIfS4TZId0nfTM9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=exhOKCFMjMoVAdFgVTh49oVAjXp8hfC8/zXnmlVExB1uSdKIw/vJ4MncEvLSx1avjOn3VagDgDRZU0OjHL+AInEAs+ZT0nXpxJKeE3J70wwjCU/e0ecCMNi7yVgpwWIZyuPRfrK16fxzlqGEHRmZN5shsSdVusuXQQ7kRfRguLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=sS2O1qPK; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=2IClDRTOjvKr2LkZUS907ZmY/aBDdBWl2pRamxXXXKg=; t=1762424758;
	x=1762856758; b=sS2O1qPKH4NJcG4nSyZGwY4M8Ue1/enu3lw58G19vP13Gx2RFN+cMlnq1Hh1z
	GRhYu+CnKcLPTNiUY0Tg9SkYdMbEzKkcwGviLeYwfeH7v1Lx6CSxEy1XdkOfxYFPiw5YlOyNaRazN
	+2spBnGAC2VujXgqs1YR3EzO8OfbDhn6r/jypRRs+mnbVH0KShSPCtJTQAXBMgmQmtkexIdGETDfL
	RjeXewmAIcaqLrJcDXfl1IcaEtx5PyT6g0yWx8L+FzFWDVWTltmIgUDS1FkzRiuFYbip504Jny/7N
	jMkMuo4IiazhKKg4L5G5t1C0ypZWdo3+bGLWS+pRFj0QRMWqrQ==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vGxBk-005Y5i-1q;
	Thu, 06 Nov 2025 11:25:56 +0100
Message-ID: <35bd11bf-23fa-4ce9-96fb-d10ad6cd546e@leemhuis.info>
Date: Thu, 6 Nov 2025 11:25:55 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: hwclock busted w/ M48T59 RTC (regression)
To: Nick Bowler <nbowler@draconx.ca>, Esben Haabendal <esben@geanix.com>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 linux-rtc@vger.kernel.org, stable@vger.kernel.org, sparclinux@vger.kernel.org
References: <krmiwpwogrvpehlqdrugb5glcmsu54qpw3mteonqeqymrvzz37@dzt7mes7qgxt>
 <DmLaDrfp-izPBqLjB9SAGPy3WVKOPNgg9FInsykhNO3WPEWgltKF5GoDknld3l5xoJxovduV8xn8ygSupvyIFOCCZl0Q0aTXwKT2XhPM1n8=@geanix.com>
 <ni6gdeax2itvzagwbqkw6oj5xsbx6vqsidop6cbj2oqneovjib@mrwzqakbla35>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <ni6gdeax2itvzagwbqkw6oj5xsbx6vqsidop6cbj2oqneovjib@mrwzqakbla35>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1762424758;53ba1f3e;
X-HE-SMSGID: 1vGxBk-005Y5i-1q

Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
for once, to make this easily accessible to everyone.

Just wondering: was this fixed in between? Just asking, as I noticed the
culprit was backported to various stable/longterm series recently

Ciao, Thorsten

On 10/23/25 15:39, Nick Bowler wrote:
> On Thu, Oct 23, 2025 at 07:21:21AM +0000, Esben Haabendal wrote:
>> On Thursday, 23 October 2025 at 06:45, Nick Bowler <nbowler@draconx.ca> wrote:
>>
>>> After a stable kernel update, the hwclock command seems no longer
>>> functional on my SPARC system with an ST M48T59Y-70PC1 RTC:
>>>
>>> # hwclock
>>> [...long delay...]
>>
>> I assume this is 10 seconds long.
> 
> Yeah, about that.
> 
>>> hwclock: select() to /dev/rtc0 to wait for clock tick timed out
>>
>> And this is 100% reproducible, or does it sometimes work and sometimes fail?
> 
> It fails every time.
> 
>> Are you using the util-linux hwclock command? Which version?
> 
> hwclock from util-linux 2.40.2
> 
>> Do you have CONFIG_RTC_INTF_DEV_UIE_EMUL enabled?
> 
> No, this option is not enabled.
> 
>> Can you run `hwclock --verbose`, both with and without the reverted commit,
>> and send the output from that?
> 
> 6.18-rc2 (broken):
> 
>   # hwclock --verbose
>   hwclock from util-linux 2.40.2
>   System Time: 1761226454.799573
>   Trying to open: /dev/rtc0
>   Using the rtc interface to the clock.
>   Last drift adjustment done at 1657523820 seconds after 1969
>   Last calibration done at 1657523820 seconds after 1969
>   Hardware clock is on UTC time
>   Assuming hardware clock is kept in UTC time.
>   Waiting for clock tick...
>   hwclock: select() to /dev/rtc0 to wait for clock tick timed out
>   ...synchronization failed
> 
> 6.18-rc2 w/ revert (working):
> 
>   # hwclock --verbose
>   hwclock from util-linux 2.40.2
>   System Time: 1761226685.238753
>   Trying to open: /dev/rtc0
>   Using the rtc interface to the clock.
>   Last drift adjustment done at 1657523820 seconds after 1969
>   Last calibration done at 1657523820 seconds after 1969
>   Hardware clock is on UTC time
>   Assuming hardware clock is kept in UTC time.
>   Waiting for clock tick...
>   ioctl(3, RTC_UIE_ON, 0): Input/output error
>   Waiting in loop for time from /dev/rtc0 to change
>   ...got clock tick
>   Time read from Hardware Clock: 2025/10/23 13:38:06
>   Hw clock time : 2025/10/23 13:38:06 = 1761226686 seconds since 1969
>   Time since last adjustment is 103702866 seconds
>   Calculated Hardware Clock drift is 0.000000 seconds
>   2025-10-23 09:38:05.239100-04:00
> 
> Thanks,
>   Nick
> 


#regzbot poke

