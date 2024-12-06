Return-Path: <linux-rtc+bounces-2676-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C729F9E686C
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Dec 2024 09:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EF272838B4
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Dec 2024 08:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C441DD894;
	Fri,  6 Dec 2024 08:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="P5E0ktnW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oOYHLgN4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6AF328B6;
	Fri,  6 Dec 2024 08:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733472292; cv=none; b=Euku6549VCrxS2v2uAt5XWBMmaaCWUNLkA5xmXjTnQnIcSaMzI0+QTQpEKkSoeWJGKVhFF0MfKBPyw/ik7bQzOItTzI69bvvX+EXrQjoykz3b1gWwRWX2S3c0VOZqHxecr8yeahaeuYfaVEJ4x+glv4DPxX/g1WVwb/Dw6BjRjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733472292; c=relaxed/simple;
	bh=tm0KNVA21OZ4SXncAJY19lTDh7zqCvm+WsLH1NXKVgQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=efpE5I/a5JicoL5SJ9dPujafdSkgv7lyjIDqnbmtKrN1f0JSv1adsQDOZO2ZJmLPJnLqMbw4x6CRywNNMrjoTe/GJLZaOGHgCleWkdlK9oxkCnxQbO12vMWGpJLO7gDioSTDMaIpBKBtdQTUosqAiatNaL2sG0sNnyoclDnSF2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=P5E0ktnW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oOYHLgN4; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id C9AFE114013D;
	Fri,  6 Dec 2024 03:04:48 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 06 Dec 2024 03:04:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1733472288;
	 x=1733558688; bh=yttDIhvUtMw6e5hq3bpLC7IVE+x1nQ+E4Z0RE9OfEO0=; b=
	P5E0ktnWTPpmP5VDREcEAwox0Q2IDJiYo1d0BqEPgSgpM2JYP31lH96fkxtZ97tT
	uRSmk3hZN/dJuI4iBDmkeK4cCt/t+kVLy5lgb4eeYdUTvUVny3O75raQbb0i+DLi
	tSydi+qBCJcU8ImQR+BvA0vvHTdayLFjxn/1IU/PgCZoNnJFtl7s6XmGrrboJWQ6
	WrK5Z4+E8cp9D64+htGCoC0d4MAD9dXEgICSZBS+1K/hBJi9dcv1kvSKzmCyVsop
	qDSAgsdMzdJ6NdPHu/+IAUoy3+Cdj9HjjO95Cces25pddvJH1jWgCtOIEwGPUAKB
	9OounoP/dYyIIvo8Z+WLEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733472288; x=
	1733558688; bh=yttDIhvUtMw6e5hq3bpLC7IVE+x1nQ+E4Z0RE9OfEO0=; b=o
	OYHLgN4PkVIR6stnw4Ngu9j7A3ItRXm5IcUROU4qruQV8SZ4RRmpK9O0iEubqtoG
	Ds4XD5KYoyTdtl8jkE+47j9yE0xUaJsleOfe6EkIzHRGaN2Q0AnDe7EGzxVoFkbo
	5kQfnlJG/J52fB8cVf6yx1oWKVRAejKder9YaAZtLM0GBpAT4lNwyenbjeBlbLD8
	tC/F0jxXG6J+hRnAzMLq91ospsd6gZO7/Z4WH5D35RAwZj0s3sOfl7PG/DNzTf2Q
	RYln0LxZrf5+1CivaM1LIXDch3wwTbLg/ZaQiWbMLAV832sUQFt18lU/VPa+R25N
	/bBQzNXrZYn0n+VNmREig==
X-ME-Sender: <xms:ILBSZ6z164FS0fTgeLr5-wzSY2fCehSDL-7v_hDLCsxJ-9Bx4fBRJQ>
    <xme:ILBSZ2Q-tjp6tDfEtchI7p5_xOvU7IJSnDiKIXNpOxcrU4mmXbnU3MLLWaKSaP4Uy
    8b8FTJW8HIu8Bda8ww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrieekgdduudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrg
    hssegrrhhmrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihes
    sghoohhtlhhinhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhs
    rdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinh
    hugidruggvvhdprhgtphhtthhopehghhgvnhhnrgguihdrphhrohgtohhptghiuhgtsehn
    gihprdgtohhm
X-ME-Proxy: <xmx:ILBSZ8XANu-RSLVdm36Vpd9abv59S-x6ku57HYkblN-EqHhXOIsrww>
    <xmx:ILBSZwh-ANwu2jdedGwWBWeyEnD7Z8CMYEroseJhF_aQDq0B7JN7ow>
    <xmx:ILBSZ8CdFHkRuFR07-1-ZzGno9xBri8OX5S-vJyi8fk3MdlDMhyWaA>
    <xmx:ILBSZxJHaIG1YG60pRfFH4TwCg_2uGkGQP8l6j2wnqPzg6cvd48OYA>
    <xmx:ILBSZ826rvu48Uz0LIEXGu08Aw7fEKkVAUbVCePg4_eiRMv9OWVbJr79>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 097F52220072; Fri,  6 Dec 2024 03:04:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Dec 2024 09:04:02 +0100
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
Message-Id: <2005af5d-bdb7-4675-8f0e-82cb817801af@app.fastmail.com>
In-Reply-To: <20241206070955.1503412-3-ciprianmarian.costea@oss.nxp.com>
References: <20241206070955.1503412-1-ciprianmarian.costea@oss.nxp.com>
 <20241206070955.1503412-3-ciprianmarian.costea@oss.nxp.com>
Subject: Re: [PATCH v6 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Dec 6, 2024, at 08:09, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> Add a RTC driver for NXP S32G2/S32G3 SoCs.
>
> RTC tracks clock time during system suspend. It can be a wakeup source
> for the S32G2/S32G3 SoC based boards.
>
> The RTC module from S32G2/S32G3 is not battery-powered and it is not kept
> alive during system reset.
>
> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

I read through the driver and this looks all good to me, but there
are two fairly minor things I noticed:

> +	u64 rtc_hz;

I see the clock rate is a 64-bit value, which is clearly what
comes from the clk interface in the kernel

> +static u64 cycles_to_sec(u64 hz, u64 cycles)
> +{
> +	return div_u64(cycles, hz);
> +}

and you divide by the clk rate to convert the register value
to seconds (as expected)

> +	u32 delta_cnt;
> +
> +	if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, RTCCNT_MAX_VAL))
> +		return -EINVAL;

However, the range of the register value is only 32 bits,
which means there is no need to ever divide it by a 64-bit
number, and with the 32kHz clock in the binding example,
you only have about 37 hours worth of range here.

It would appear that this makes the rtc unsuitable for
storing absolute time across reboots, and only serve during
runtime, which is a limitation you should probably document.

> +static s64 s32g_rtc_get_time_or_alrm(struct rtc_priv *priv,
> +				     u32 offset)
> +{
> +	u32 counter;
> +
> +	counter = ioread32(priv->rtc_base + offset);
> +
> +	if (counter < priv->base.cycles)
> +		return -EINVAL;

If 'counter' wraps every 37 hours, this will inevitably fail,
right? E.g. if priv->base.cycles was already at a large
32-bit number, even reading it shortly later will produce
a small value after the wraparound.

Using something like time_before() should address this,
but I think you may need a custom version that works on
32-bit numbers.

> +static int s32g_rtc_resume(struct device *dev)
> +{
> +	struct rtc_priv *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!device_may_wakeup(dev))
> +		return 0;
> +
> +	/* Disable wake-up interrupts */
> +	s32g_enable_api_irq(dev, 0);
> +
> +	ret = rtc_clk_src_setup(priv);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
> +	 * reapply the saved time settings.
> +	 */
> +	return s32g_rtc_set_time(dev, &priv->base.tm);
> +}

This also fails if the system has been suspended for more than
37 hours, right?

One more minor comment: you are using ioread32()/iowrite32()
to access the MMIO registers, which is a bit unusual. I would
suggest changing those to the more common readl()/writel()
that do the exact same thing on arm64.

        Arnd

