Return-Path: <linux-rtc+bounces-2686-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDD39EAA80
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Dec 2024 09:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2406188A07D
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Dec 2024 08:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4CE230981;
	Tue, 10 Dec 2024 08:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="QFGKfGD+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fHah57zA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B24922F3A1;
	Tue, 10 Dec 2024 08:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733819027; cv=none; b=b+dOOXY+PcIFdivtaULOW/hl9lknc3P4LuaIJFWj1g9XL21EoCUj55efN1ARONLrk+g6qP7MMrHAbOahEIO6mP0JU2OKOz4F4GGGpUXCUDpVuOPoUspxdU8uwOQHWTUe6tM/BCRh0eYG+Ta61N5ur8IpDQEGVqBTm1gbtEpWhQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733819027; c=relaxed/simple;
	bh=/ah24nBMa9yZF2baCDCd316+4iZJJMEXennJZCcAu7E=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=qLpO672QCXlO0JZjCSCz3gD6v6K4VeUf9p9GPmU7Cn1uomQZ6HwZ/eZX/jk2bc+HZ+0S6qGSam/Ma2F0TJqfs3bRvOeOm1qKidA0LWn7P5NVo8MWVetIVZ0NIn1XcmZFK3/WsQorPXlyAUFeApt3PqdwMr+e8Ipz8QsYzxTZ7RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=QFGKfGD+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fHah57zA; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 335A51140204;
	Tue, 10 Dec 2024 03:23:44 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 10 Dec 2024 03:23:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1733819024;
	 x=1733905424; bh=Lh11GirIpc36ixloYI6B6okGKgksZrMkp+1sP3UkiYk=; b=
	QFGKfGD+A8rKAR13pKORswcxTw9SnwNxmAAZ4wC8SAifKGaTqHsotTz2is93+7aw
	ADLblieYHx/utleucoO14oYvAncjzLEf5UUqPsJC/vfKqlrw6tC6bBIf9J0a6vej
	Rtl4A7+wZQSbdKLCp3XGE+DFK1bwk4o536TFuRlJyeZ/WbrCTMG9oIrmh0Vwhfr4
	hLeKzZWt6tiujPluiMJWTqguiQSfhrrCroHH/AhzSrvV6F4KJPN7TILdDsVxOHGd
	Ij45K9mxCvFW3GE+zFnmWSgc5ztneYzJi0WWQQ1+VGhPxFvnVA7QPGIS7SiWluNH
	u17YYD60Co1OWJ2psTnr5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733819024; x=
	1733905424; bh=Lh11GirIpc36ixloYI6B6okGKgksZrMkp+1sP3UkiYk=; b=f
	Hah57zAk/ZZ4SxJPpjSWbq9T1cuqnAKG4SYp0aHu5EztfkT3HngOn0y/Qnlgfix9
	FZ2aHMxxdnCq7X8nHU7ylq+DLyeW4HTmwHyZ+nuwfqWFv6ZiGAm+h8aMDbo7KoOB
	mL9LAWxz7jC/W91uyrJc2nzoDDDfkHwXWEUlOU7g9Fy5wcTqS6XOhylTA0n5wNOb
	zuUqyJKcztGdsd6zBrc6AeWMVGzI3W1usyiIUCQiTMos3jl1ecW/5ZE1NAvZqPl9
	mqk733IIC04/yx9GWhb1EoLHvsoEuz2lTci34p4S4WU1zkL8vrebBywPyhJiZo5Q
	lJRz2koPjGIU053aJ2+SA==
X-ME-Sender: <xms:j_pXZ6PuD4arYOKoBscVLl4X0wkAvOAXttHkWDA3d8K6U4KyqYO5Ew>
    <xme:j_pXZ48paQXknmb5gR4N4EfmlHosoTxGnNhk5E_q0Rc9XYPGyG7gFF3CTXwSwG3k_
    hiCdDi7LXz7OX8BWsE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrjeejgdduvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvddt
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrg
    hssegrrhhmrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihes
    sghoohhtlhhinhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepuggrnhhivghlrdhlvgiitggrnhhosehlihhnrghrohdr
    ohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtth
    hopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdr
    ohhrgh
X-ME-Proxy: <xmx:j_pXZxSEURJ9ytKBAcBumtrHG4TM7RJcBtLu8MwDgiNFrDNxBiaJsg>
    <xmx:j_pXZ6ugsmhZSPlyiKLeX0-IQ40r5tWpoiWTqgsiWI580ukWrcdnJQ>
    <xmx:j_pXZyfPT7Rq8P5vA9Plx-ANsVDtpLtwkL_HduNlXSneQdX92GrLjA>
    <xmx:j_pXZ-3Z8sSe1nsFK-ShJS1KGNxx8MPyk2ewgadZYxbBvDZoqiuSDQ>
    <xmx:kPpXZ_CDy2tvt9Ylh2Gumxy5Lz5CEXqiTnTZKEPbzSW4ZZXnfBTvvx4I>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 58C1F2220072; Tue, 10 Dec 2024 03:23:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 10 Dec 2024 09:22:51 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ciprian Costea" <ciprianmarian.costea@oss.nxp.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "NXP S32 Linux Team" <s32@nxp.com>, imx@lists.linux.dev,
 "Christophe Lizzi" <clizzi@redhat.com>, "Alberto Ruiz" <aruizrui@redhat.com>,
 "Enric Balletbo" <eballetb@redhat.com>,
 "Bogdan Hamciuc" <bogdan.hamciuc@nxp.com>,
 "Ghennadi Procopciuc" <Ghennadi.Procopciuc@nxp.com>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Thomas Gleixner" <tglx@linutronix.de>
Message-Id: <fc50d8a7-cc59-42dd-aafd-7da49fadee45@app.fastmail.com>
In-Reply-To: <42d39f8e-0b59-4185-af1f-f778522608d2@oss.nxp.com>
References: <20241206070955.1503412-1-ciprianmarian.costea@oss.nxp.com>
 <20241206070955.1503412-3-ciprianmarian.costea@oss.nxp.com>
 <2005af5d-bdb7-4675-8f0e-82cb817801af@app.fastmail.com>
 <6f4a0be8-4def-4066-9b44-d43059b7a90d@oss.nxp.com>
 <94cba886-86cb-41f1-96ee-501623add7db@app.fastmail.com>
 <42d39f8e-0b59-4185-af1f-f778522608d2@oss.nxp.com>
Subject: Re: [PATCH v6 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Dec 9, 2024, at 18:17, Ciprian Marian Costea wrote:
> On 12/6/2024 2:41 PM, Arnd Bergmann wrote:

>> I think storing 'rtc_hz' as a u32 variable and adding a range
>> check when filling it would help, mainly to save the next reader
>> from having to understand what is going on.
>> 
>
> The confusion on my end is that I cannot see where 'div_u64() implicitly 
> casts the dividend 'hz' from 64-bit to 32-bit' by following the method's 
> implementation [1]

I mean passing a 64-bit variable into a function that takes a
32-bit argument truncates the range.

> But I agree that 'rtc_hz' can be stored into a 32-bit variable with a 
> range check added when it is taken from the Linux clock API to avoid any
> unneeded abstractions.

ok

>> 
>> This is the same as just removing the error handling and
>> relying on unsigned integer overflow semantics.
>> 
>> The usual check we do in time_before()/time_after instead
>> checks if the elapsed time is less than half the available
>> range:
>> 
>> #define time_after(a,b)         \
>>          (typecheck(unsigned long, a) && \
>>           typecheck(unsigned long, b) && \
>>           ((long)((b) - (a)) < 0))
>> 
>
> Ok. Thanks for the suggestion. I will look into using 
> 'time_before()/time_after()' API instead of directly checking via 
> comparison operators.

To be clear: you can't directly use time_before() here because
that takes an 'unsigned long' argument, so you want the
same logic, but for u32 values. I have not found an existing
helper for that, but it's possible I missed it.

>> Who sets that alarm though? Are you relying on custom userspace
>> for this, or is that something that the kernel already does
>> that I'm missing?
>
> The test usage is via 'rtcwake' [2] userspace tool.
> I've detailed a bit the testing scenario in the cover letter for this 
> patchset [3]:
>
> "
> Following is an example of Suspend to RAM trigger on S32G2/S32G3 SoCs,
> using userspace tools such as rtcwake:
> # rtcwake -s 2 -m mem
> # rtcwake: assuming RTC uses UTC ...
> # rtcwake: wakeup from "mem" using /dev/rtc0 at Wed Feb  6 06:28:36 2036

Got it. I feel this also needs either some documentation in
the source code, or some infrastructure in the rtc layer if
this is a common problem in other drivers as well. If there
is a maximum time that the system can be suspended for without
a wakeup, why not just set an earlier wakeup in the kernel
when you have all the information for it?

Or maybe this should not actually be an 'rtc' driver at all?
In the old days, we used drivers like
arch/arm/mach-omap1/timer32k.c to register a handler
for read_persistent_clock64(), which completely bypasses
the RTC layer and provides both automatic wakeup and more
accurate accounting of sleep time. 

Another example was the tegra clocksource driver, which used
to use read_persistent_clock64() but changed to being
a CLOCK_SOURCE_SUSPEND_NONSTOP source in 95170f0708f2
("clocksource/drivers/tegra: Rework for compensation of
suspend time"). The same seems true for timer-ti-32k.c and
timer-sprd.c.

Alexandre, Daniel, any recommendations here?

     Arnd

