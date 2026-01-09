Return-Path: <linux-rtc+bounces-5717-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FF5D0A331
	for <lists+linux-rtc@lfdr.de>; Fri, 09 Jan 2026 14:07:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D957F30CF5A0
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Jan 2026 12:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB72D31A069;
	Fri,  9 Jan 2026 12:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="mUO1cokS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-07.mail-europe.com (mail-0701.mail-europe.com [51.83.17.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B8F50094A
	for <linux-rtc@vger.kernel.org>; Fri,  9 Jan 2026 12:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.83.17.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767963286; cv=none; b=Uy+QuO8gAP9WFdb/O1snZeUxaeEDGlh3u7hdoTbovpYahYCdC4eTUnmmtTU8Vj8vQct+WdAUT0BQBGRXYRBPocUUxdSFU7p+KO0+xcYcxXbqgUl6Pm3W48TZH/E0zVjNVFKgJtGXtMrh35LSuj96+ztsxM6+DB4FNWdu28Yn9OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767963286; c=relaxed/simple;
	bh=3P6N9VFu+Ns23kDG3VeKvtOIn9dAHn55AaRPFk8Nd2w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AVCjbrZrbx0f8cRwUq8/m8N9RJjYyOSq5zll8jVoDzmFUkgYkotedSxj/Cq9N2OHrpgMif87bnC3utp9DT7951WT9g/qq0fSFo1e7KhF+4ENnhlg2F4erk14HOpBeRtwkE9VmrgMDzTMvlhHHizXgbUnR+EQSnmVlt+1OKDhXjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=fail smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=mUO1cokS; arc=none smtp.client-ip=51.83.17.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail2; t=1767963268; x=1768222468;
	bh=3P6N9VFu+Ns23kDG3VeKvtOIn9dAHn55AaRPFk8Nd2w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mUO1cokS4hogWoSrjn6OXrzhTJeBEJGv6ZJl/MzXAlop9bo6/0xn7J5APRetAdayr
	 mZdW2Sl+6gCl+4/zfNMxfo7beOFo41MU8rAnQBBgR6boHrmBUOfs4BlxNYoHtR+Cc9
	 ABZUoPIIqdluIrMd5/s05K9kyXMAxPSME9COnZXAepBlbozyvrBeh6ZGcz/qFhnbmu
	 rLCCPWkiSH6fA1+SytM2uCgrL1NSS4DC41SMk+/43jfyDPgskJN8NMhzW+lQM4eOX6
	 5kPYJxLUi+0xKMa0labeu4ZrdpCdzBptLdE653jbYgrTPie28lY+WwmU/Sgfs+ofPv
	 MIbjRhr9SE1Qg==
X-Pm-Submission-Id: 4dnhYb21Lsz1DHSC
From: Esben Haabendal <esben@geanix.com>
To: "Thorsten Leemhuis" <regressions@leemhuis.info>
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,  "Nick
 Bowler" <nbowler@draconx.ca>,  "Anthony Pighin (Nokia)"
 <anthony.pighin@nokia.com>,  "linux-rtc@vger.kernel.org"
 <linux-rtc@vger.kernel.org>,  "Linux kernel regressions list"
 <regressions@lists.linux.dev>
Subject: Re: [PATCH] rtc: interface: Alarm race handling should not discard
 preceding error
In-Reply-To: <45d14eb4-9495-4aa8-9382-8d756c0ae39e@leemhuis.info> (Thorsten
	Leemhuis's message of "Fri, 09 Jan 2026 13:18:29 +0100")
References: <BN0PR08MB6951415A751F236375A2945683D1A@BN0PR08MB6951.namprd08.prod.outlook.com>
	<80e7450d-d842-49ca-8219-a995c8ce8bfe@leemhuis.info>
	<g3phtogna3a55vzah6olpxekdcmi322q5lzzwxwq5za4oi4plr@js34hr72bemi>
	<g-ieyuLeDFTGFtwouEWeB6MrjQrUKtHEFHJ54X6mIFcHbsNLLLQyfejb9G2HRQ5xNam8jPp_RTli5Y6LSaF7Dg==@protonmail.internalid>
	<45d14eb4-9495-4aa8-9382-8d756c0ae39e@leemhuis.info>
Date: Fri, 09 Jan 2026 13:54:26 +0100
Message-ID: <87o6n3c5fh.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Thorsten Leemhuis" <regressions@leemhuis.info> writes:

> On 12/16/25 16:09, Nick Bowler wrote:
>> On Tue, Dec 16, 2025 at 11:51:30AM +0100, Thorsten Leemhuis wrote:
>>> Lo! FWIW, Nick Bowler (now CCed) reported that below patch fixes a
>>> regression for him caused by the commit from Esben (now also CCed) the
>>> Fixes: tag mentions. See "hwclock busted w/ M48T59 RTC (regression)" for
>>> details:
>>> https://lore.kernel.org/all/2t6bhs4udbu55ctbemkhlluchz2exrwown7kmu2gss6zukaxdm@ughygemahmem/
>>> and
>>>
>>> Nick, could you maybe provide a tested-by tag here? Maybe that would
>>> motivate someone to get this en route to mainline.
>>>
>>> Adding a "Cc: <stable@vger.kernel.org>" would be great, too, as Nick
>>> encountered this on earlier series, as it was backported all the way to
>>> 5.15.y
>>
>> It was backported to 5.10.y and 5.4.y too, but only after I had reported
>> this regression back in October (and I guess 5.4.y is EOL now).
>>
>> Tested-by: Nick Bowler <nbowler@draconx.ca>
>
> Esben (author of the culprit) and Alexandre (who merged it): do you
> still have reviewing/applying the patch at the start of this thread (
> https://lore.kernel.org/all/BN0PR08MB6951415A751F236375A2945683D1A@BN0PR08MB6951.namprd08.prod.outlook.com/#t)
> on your todo list?
>
> Sorry for nagging, would just be good to finally get this 6.18-rc1
> regression fixed in mainline so the fix can be backported to stable,
> too. And due to the holidays I thought a quick reminder might be wise.
>
> Or was this fixed somehow and I just missed it?

Sorry for introducing this error. The fix looks good to me. I have added
my Reviewed-by to it.

Am I correct in that it also fixes the problem reported by Nick Bowler?

/Esben

