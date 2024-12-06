Return-Path: <linux-rtc+bounces-2678-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C56A09E6E72
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Dec 2024 13:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80D3D2811F6
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Dec 2024 12:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF222036F8;
	Fri,  6 Dec 2024 12:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="M/b16wYy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="krqYvCyz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A042036E8;
	Fri,  6 Dec 2024 12:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733488941; cv=none; b=kxX3GpQwwVFlu9dgjpefYJ0VbWm4NL/39Lt0IkURKbV8F43ZGyFTyq8YDEmNBvjGyywTe7fDUzhwls2yOkIL7twiYnObfvAX6jP0I2uJ1/fuz0EueUu38Eo4yAOeKriFIZ6anWbAA/b7jr4QyrXcbf2fGIosrWaEvne/NBDWYHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733488941; c=relaxed/simple;
	bh=GJltY0XaxhiQu4LqgEHvaPBbhgHvEa0EFruFh0UnWUQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pRc2wkydLEgWVPzIFZ+h1ocKrJgqsY086g7NX1kWKLoD11KO06/QOALfNiFlYmaCRNGWG4M+t0I4F+7c6NV4urT6mTynXf14k7H1viUnPsJ4Gg/OsqmlX3Xa/CHbhOFKk/JLbsXdhRQeCx6bPvv0KM/Vb6TWv7vseBRqxwOhhSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=M/b16wYy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=krqYvCyz; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 98A93138341A;
	Fri,  6 Dec 2024 07:42:18 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 06 Dec 2024 07:42:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1733488938;
	 x=1733575338; bh=x1weric6zZmvWu4UV+Y5UDAgbXws/QOCE+rGDxo8gCY=; b=
	M/b16wYyYsnI/s8XYS0cMZC8l+m9jwXwyywWsyiEWOWa0+Jz4tq4vDCXWJ58vqPn
	Vj94uvNy2rLl0aNRjNxb+j9KBBXworFDKOxIhbONkQiHaVd6UPMPmnwazlfRsb7I
	NgIyMxAqogq979jABuzZNVx6e/9kq+qfyg3DWAkYCW9hcm2SrForMIgL0A1680/E
	l0MOrf8y/n2eL9qUCHOM+NEQIb4pJIhz6NgRVKBhTt9dZvUOmaj26RktFrFzrsQh
	Js+9NlpzSSxXExqYUcIgBo5LHMYGD6jMQXt+Q4p6y49jR70SnmDckvWihcmJJWR4
	fnH22kBK+mFE/dOmO/ko9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733488938; x=
	1733575338; bh=x1weric6zZmvWu4UV+Y5UDAgbXws/QOCE+rGDxo8gCY=; b=k
	rqYvCyzVsmqaVOL2a9aaKizIgC/m4E/j7AtIF1/n2oQv47Pl15qFrk9Qnn/ouLG3
	ftQ3nZhLzU8k8A5XpuAXNNFlc7gznVQj0g05sBzRcjmasl+wKrthMJ7OHTb4JjWI
	4iaREQUesEzHwPjvBLsfnVboaFtKeKFOJFfshYXpOp1W7sTeYuZDLlE94o7l3D2C
	upZe0+2wJkYD/9/cMR7TyBynV4gx7R5FK478nAapoVO1RdlltGZSPqgv6lhwQQq/
	MFBs+0kCohmF2r8Q7Q8C6HhBEk4NTV0KBLK7AnLeip2/eNfcRvq24nEedSKM60bF
	21YXndFSpZBbY/sxmWTFQ==
X-ME-Sender: <xms:KvFSZ2HbZGPxrZSFzkMVsDotGkhONQaT36soRaG_Cpa0LGi_UQCFkQ>
    <xme:KvFSZ3WqbJIGm_jQVqkiQSsJFTb7je053okl5c_bGlMivKj7lJLzUM6jgm0__TFwx
    xg9hzCnrBz5QcPXhiI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrieelgdegvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffg
    vedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedukedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrsh
    esrghrmhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegs
    ohhothhlihhnrdgtohhmpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdr
    ihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuh
    igrdguvghvpdhrtghpthhtohepghhhvghnnhgrughirdhprhhotghophgtihhutgesnhig
    phdrtghomh
X-ME-Proxy: <xmx:KvFSZwIKpoqhOjksPy-RYhRsmbn8ptH_bJsu9Rc4YN3vWJRDjB-03Q>
    <xmx:KvFSZwF7a3DMGk_xUV242igARosECCfwipB6tzrDV_-qQABKP5y4mw>
    <xmx:KvFSZ8UJdu3h0eX0zSrDmA7ZxNPg7vMTjISiOU2Ikx9bhRp_J4kYaA>
    <xmx:KvFSZzPDi4DXTMFC1WwyPq8Dr53SgjhJxRSmudaA_NZqhe3uors_4w>
    <xmx:KvFSZyb2_1RniotkMjpKiRsqm6trs0jAS7Lu4xPTIGzGdCg0sL7wHrPr>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0E2D42220072; Fri,  6 Dec 2024 07:42:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Dec 2024 13:41:55 +0100
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
 "Ghennadi Procopciuc" <Ghennadi.Procopciuc@nxp.com>
Message-Id: <94cba886-86cb-41f1-96ee-501623add7db@app.fastmail.com>
In-Reply-To: <6f4a0be8-4def-4066-9b44-d43059b7a90d@oss.nxp.com>
References: <20241206070955.1503412-1-ciprianmarian.costea@oss.nxp.com>
 <20241206070955.1503412-3-ciprianmarian.costea@oss.nxp.com>
 <2005af5d-bdb7-4675-8f0e-82cb817801af@app.fastmail.com>
 <6f4a0be8-4def-4066-9b44-d43059b7a90d@oss.nxp.com>
Subject: Re: [PATCH v6 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Dec 6, 2024, at 13:05, Ciprian Marian Costea wrote:
> On 12/6/2024 10:04 AM, Arnd Bergmann wrote:
>> 
>> However, the range of the register value is only 32 bits,
>> which means there is no need to ever divide it by a 64-bit
>> number, and with the 32kHz clock in the binding example,
>> you only have about 37 hours worth of range here.
>> 
>
> I am not sure what is the suggestion here. To cast 'cycles' variable to 
> 32-bit ?
> If yes, indeed 'div_u64' converts 'cycles' (the divisor) to 32-bit so I 
> agree it should be u32 instead of u64.
> If not, I would prefer to keep using a 64-by-32 division and avoid 
> casting 'hz' to 32-bit.

The confusing bit here is that the extra function just serves to
the dividend 'cycles' from 32-bit to 64-bit, and then calling
div_u64() implicitly casts the dividend 'hz' from 64-bit to
32-bit, so you definitely get a 32-by-32 division already
if the function is inlined properly.

I think storing 'rtc_hz' as a u32 variable and adding a range
check when filling it would help, mainly to save the next reader
from having to understand what is going on.

>> It would appear that this makes the rtc unsuitable for
>> storing absolute time across reboots, and only serve during
>> runtime, which is a limitation you should probably document.
>> 
>
> Actually there is the option to use DIV512 and/or DIV32 hardware 
> divisors for the RTC clock. The driver uses a DIV512 divisor by default 
> in order to achieve higher RTC count ranges (by achieving a smaller RTC 
> freq). Therefore, the 37 hours become 37 * 512 => ~ 2 years.

Ah, makes sense. Can you add comments in an appropriate place in
the code about this?

> However, the rtc limitation of not being persistent during reboot 
> remains, due to hardware RTC module registers present of NXP S32G2/S32G3 
> SoCs being reset during system reboot. On the other hand, during system 
> suspend, the RTC module will keep counting if a clock source is available.
>
> Currently, this limittion is documented as follows:
> "RTC tracks clock time during system suspend. It can be a wakeup source 
> for the S32G2/S32G3 SoC based boards.
>
> The RTC module from S32G2/S32G3 is not battery-powered and it is not 
> kept alive during system reset."

My bad, I really should not have skipped the patch
description ;-)

>> If 'counter' wraps every 37 hours, this will inevitably fail,
>> right? E.g. if priv->base.cycles was already at a large
>> 32-bit number, even reading it shortly later will produce
>> a small value after the wraparound.
>> 
>> Using something like time_before() should address this,
>> but I think you may need a custom version that works on
>> 32-bit numbers.
>> 
>
> This is correct. Would the following change be acceptable ?
>
> -       if (counter < priv->base.cycles)
> -               return -EINVAL;
> -
> -       counter -= priv->base.cycles;
> +       if (counter < priv->base.cycles) {
> +               /* A rollover on RTCCTN has occurred */
> +               counter += RTCCNT_MAX_VAL - priv->base.cycles;
> +               priv->base.cycles = 0;
> +       } else {
> +               counter -= priv->base.cycles;
> +       }

This is the same as just removing the error handling and
relying on unsigned integer overflow semantics.

The usual check we do in time_before()/time_after instead
checks if the elapsed time is less than half the available
range:

#define time_after(a,b)         \
        (typecheck(unsigned long, a) && \
         typecheck(unsigned long, b) && \
         ((long)((b) - (a)) < 0))

>>> +static int s32g_rtc_resume(struct device *dev)
>>> +{
>>> +     struct rtc_priv *priv = dev_get_drvdata(dev);
>>> +     int ret;
>>> +
>>> +     if (!device_may_wakeup(dev))
>>> +             return 0;
>>> +
>>> +     /* Disable wake-up interrupts */
>>> +     s32g_enable_api_irq(dev, 0);
>>> +
>>> +     ret = rtc_clk_src_setup(priv);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     /*
>>> +      * Now RTCCNT has just been reset, and is out of sync with priv->base;
>>> +      * reapply the saved time settings.
>>> +      */
>>> +     return s32g_rtc_set_time(dev, &priv->base.tm);
>>> +}
>> 
>> This also fails if the system has been suspended for more than
>> 37 hours, right?
>
> Actually, the system would not go into suspend (returning with error) if 
> the alarm setting passes the 32-bit / clk_freq range.
> The check is added in 'sec_to_rtcval' which is called from the suspend 
> routine.

Who sets that alarm though? Are you relying on custom userspace
for this, or is that something that the kernel already does
that I'm missing?

       Arnd

