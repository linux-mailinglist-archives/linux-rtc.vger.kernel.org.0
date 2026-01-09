Return-Path: <linux-rtc+bounces-5715-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2040CD098C8
	for <lists+linux-rtc@lfdr.de>; Fri, 09 Jan 2026 13:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 34CEA304ACCD
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Jan 2026 12:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F5935971B;
	Fri,  9 Jan 2026 12:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="LpXrfCuy"
X-Original-To: linux-rtc@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9197224D6;
	Fri,  9 Jan 2026 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767961121; cv=none; b=IogyUWvjnfJyOwqJ1WEfUrVkHarF2aUe7AHMzEJK4J/opcADdhZSSJ8JF9WvcFujpbaaTgGN3DZ82/BMHUALf5csjBj+ok4IpGLuiafofGbRgMNT1aVtpFyDDtDDixLKUC0pXVSEoCdjiDNRLW4IJqZDk9zrISYbMX5KfBX1Oeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767961121; c=relaxed/simple;
	bh=wp4t49uOgFQwo3jUhdwdYJeGOJ5T9RfFuFAYySNVhV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VGZ3iNxWfMqQSm77GG6m6rmwJGVqwERG93K/nhdTWHlqvNMzyv76xmOI14iqLTiccKM2hoN8ZntTP5Y/Gsw+WPFQRZ8r81R/vY5jI+eA8BSBWcOTFIBmUCMvt2LyWu5VGfe6qBJRKThiCYjTFB7yT9snRAMo0zSCWAjNQnSpg24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=LpXrfCuy; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=ar6mP3k8e4hNfvWFbVeeR+sDHS5v5JnWCI9L102v4Ok=; t=1767961120;
	x=1768393120; b=LpXrfCuyARIc+XtOt131UhQmq58evQ+tU88UOyQQ7FEIN/iVCtdVf10tUuja1
	tmtTSkdkgGwJcn7I3oFGBSyEaSWvTCgAYXbDMbsXUxB7AOD3Ej7M13xn5f2xrXhP7agV21Js49tYd
	bnjnW12Bl4fDfQ2uO6eGAMWwATuIvZ+jRx3PzcLVhgzT58jWRU/DH+TnhkjaRsehGXr6MYiP8d95C
	GMiSSQl404qF86VmVm8bXCHr6579+eKg/00OHmfM+WdWq2hg55u4vpXhlKSoo9H2eQ2X6icNk36q0
	FFi4MWsfhEpPO6ODYWDU8kmVa9Os3MtrT6kOC7Gso664eiCfvg==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1veBRm-00EVEq-17;
	Fri, 09 Jan 2026 13:18:30 +0100
Message-ID: <45d14eb4-9495-4aa8-9382-8d756c0ae39e@leemhuis.info>
Date: Fri, 9 Jan 2026 13:18:29 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: interface: Alarm race handling should not discard
 preceding error
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 Esben Haabendal <esben@geanix.com>
Cc: Nick Bowler <nbowler@draconx.ca>,
 "Anthony Pighin (Nokia)" <anthony.pighin@nokia.com>,
 "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <BN0PR08MB6951415A751F236375A2945683D1A@BN0PR08MB6951.namprd08.prod.outlook.com>
 <80e7450d-d842-49ca-8219-a995c8ce8bfe@leemhuis.info>
 <g3phtogna3a55vzah6olpxekdcmi322q5lzzwxwq5za4oi4plr@js34hr72bemi>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <g3phtogna3a55vzah6olpxekdcmi322q5lzzwxwq5za4oi4plr@js34hr72bemi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1767961120;aafc1b09;
X-HE-SMSGID: 1veBRm-00EVEq-17

On 12/16/25 16:09, Nick Bowler wrote:
> On Tue, Dec 16, 2025 at 11:51:30AM +0100, Thorsten Leemhuis wrote:
>> Lo! FWIW, Nick Bowler (now CCed) reported that below patch fixes a
>> regression for him caused by the commit from Esben (now also CCed) the
>> Fixes: tag mentions. See "hwclock busted w/ M48T59 RTC (regression)" for
>> details:
>> https://lore.kernel.org/all/2t6bhs4udbu55ctbemkhlluchz2exrwown7kmu2gss6zukaxdm@ughygemahmem/
>> and
>>
>> Nick, could you maybe provide a tested-by tag here? Maybe that would
>> motivate someone to get this en route to mainline.
>>
>> Adding a "Cc: <stable@vger.kernel.org>" would be great, too, as Nick
>> encountered this on earlier series, as it was backported all the way to
>> 5.15.y
> 
> It was backported to 5.10.y and 5.4.y too, but only after I had reported
> this regression back in October (and I guess 5.4.y is EOL now).
> 
> Tested-by: Nick Bowler <nbowler@draconx.ca>

Esben (author of the culprit) and Alexandre (who merged it): do you
still have reviewing/applying the patch at the start of this thread (
https://lore.kernel.org/all/BN0PR08MB6951415A751F236375A2945683D1A@BN0PR08MB6951.namprd08.prod.outlook.com/#t)
on your todo list?

Sorry for nagging, would just be good to finally get this 6.18-rc1
regression fixed in mainline so the fix can be backported to stable,
too. And due to the holidays I thought a quick reminder might be wise.

Or was this fixed somehow and I just missed it?

Ciao, Thorsten

#regzbot ignore-activity

