Return-Path: <linux-rtc+bounces-5718-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F583D0A60C
	for <lists+linux-rtc@lfdr.de>; Fri, 09 Jan 2026 14:22:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8220C3038893
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Jan 2026 13:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA4635B159;
	Fri,  9 Jan 2026 13:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="RKCtpPEi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BF833C1A3;
	Fri,  9 Jan 2026 13:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767963861; cv=none; b=kBjCHv7QwKWFwzmvb6DH6BSRpBOIi4vmW2iAkESuXDUgd+IDyArF4DULhNsw9UwC1G6Vr3ZeGvYbpt4YPzjeNlckwV6UkVkZZ06qZ7qdBzDmme6hyJ/vQfCX6Aw/VJ8vuK9wZIK+6uxyiHA+pjTaeoNGPLTi/qqRXmXbzJP/wwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767963861; c=relaxed/simple;
	bh=dnNwzyAdDwT0QcUrCttuAhXpKn9kQgbD7etuOywvWuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l12pVco7DoSg1n7mAn7qITPlYWJh6d8iCXd4YbyYQn4KkxaFGxDcHZWNMzowqoxo1FPOF0IDHaPLdVnFNL6jM831ax3aoHIXTebZoLPfuWR2xhTP4vofI062SuVdhV3WYox8jOuRgTCgKR2Sk/r5mlsja2CiP80+FPDsOpODRBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=RKCtpPEi; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=xBYm0tKHHeQAfZTn0/2r2fANxyL6ov2/UFOEdRE7jlg=; t=1767963859;
	x=1768395859; b=RKCtpPEiwzgW0KVI2FYOqW3OW4m40woWkUMO2W3OmPLmp5siqdO3iFkFk5qTv
	rEg6eev74GidyBUKOBtzYwGXIitpigwtfE3DLK2od66/BJJveq8lQWo42+ASv+GlDlKSmrOGisiem
	HmLEhiUS1w2WsM/eG0H9VkxfZ+mhP37b1FmUmMfQ723tp2TbvBMC9BaC+s8QCKaf3hdZbSW5HiEO4
	1f9jrw4BEitEqCbSbyse5KFCtMoXaRGuavc9ca7MB7pPm5TKoHxFwGTBHU6tz8gO2dddvPJ/73G/F
	R/E0FRFNVZ+Xrko6Z8/CX+sgD5LYEkrpgWpFnKHDo8dvXxxAbA==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1veCA5-00EfB0-0H;
	Fri, 09 Jan 2026 14:04:17 +0100
Message-ID: <1789c8b3-9688-4ded-b206-aa24540624d8@leemhuis.info>
Date: Fri, 9 Jan 2026 14:04:16 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: interface: Alarm race handling should not discard
 preceding error
To: Esben Haabendal <esben@geanix.com>
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 Nick Bowler <nbowler@draconx.ca>,
 "Anthony Pighin (Nokia)" <anthony.pighin@nokia.com>,
 "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <BN0PR08MB6951415A751F236375A2945683D1A@BN0PR08MB6951.namprd08.prod.outlook.com>
 <80e7450d-d842-49ca-8219-a995c8ce8bfe@leemhuis.info>
 <g3phtogna3a55vzah6olpxekdcmi322q5lzzwxwq5za4oi4plr@js34hr72bemi>
 <g-ieyuLeDFTGFtwouEWeB6MrjQrUKtHEFHJ54X6mIFcHbsNLLLQyfejb9G2HRQ5xNam8jPp_RTli5Y6LSaF7Dg==@protonmail.internalid>
 <45d14eb4-9495-4aa8-9382-8d756c0ae39e@leemhuis.info>
 <87o6n3c5fh.fsf@geanix.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <87o6n3c5fh.fsf@geanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1767963859;d690020e;
X-HE-SMSGID: 1veCA5-00EfB0-0H



On 1/9/26 13:54, Esben Haabendal wrote:
> "Thorsten Leemhuis" <regressions@leemhuis.info> writes:
> 
>> On 12/16/25 16:09, Nick Bowler wrote:
>>> On Tue, Dec 16, 2025 at 11:51:30AM +0100, Thorsten Leemhuis wrote:
>>>> Lo! FWIW, Nick Bowler (now CCed) reported that below patch fixes a
>>>> regression for him caused by the commit from Esben (now also CCed) the
>>>> Fixes: tag mentions. See "hwclock busted w/ M48T59 RTC (regression)" for
>>>> details:
>>>> https://lore.kernel.org/all/2t6bhs4udbu55ctbemkhlluchz2exrwown7kmu2gss6zukaxdm@ughygemahmem/
>>>> and
>>>>
>>>> Nick, could you maybe provide a tested-by tag here? Maybe that would
>>>> motivate someone to get this en route to mainline.
>>>>
>>>> Adding a "Cc: <stable@vger.kernel.org>" would be great, too, as Nick
>>>> encountered this on earlier series, as it was backported all the way to
>>>> 5.15.y
>>>
>>> It was backported to 5.10.y and 5.4.y too, but only after I had reported
>>> this regression back in October (and I guess 5.4.y is EOL now).
>>>
>>> Tested-by: Nick Bowler <nbowler@draconx.ca>
>>
>> Esben (author of the culprit) and Alexandre (who merged it): do you
>> still have reviewing/applying the patch at the start of this thread (
>> https://lore.kernel.org/all/BN0PR08MB6951415A751F236375A2945683D1A@BN0PR08MB6951.namprd08.prod.outlook.com/#t)
>> on your todo list?
>>
>> Sorry for nagging, would just be good to finally get this 6.18-rc1
>> regression fixed in mainline so the fix can be backported to stable,
>> too. And due to the holidays I thought a quick reminder might be wise.
>>
>> Or was this fixed somehow and I just missed it?
> 
> Sorry for introducing this error.

Happens, no worries.

> The fix looks good to me. I have added my Reviewed-by to it.

Thx!

> Am I correct in that it also fixes the problem reported by Nick Bowler?

Yes, see the "Tested-by" quoted above.

Ciao, Thorsten

