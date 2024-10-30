Return-Path: <linux-rtc+bounces-2382-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7639B6C5D
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Oct 2024 19:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3F04282975
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Oct 2024 18:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D72A1CEEA3;
	Wed, 30 Oct 2024 18:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lUebFpWw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14371C460A;
	Wed, 30 Oct 2024 18:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730314622; cv=none; b=HoMTM/rLmVUcdlMC54HZQluwYgumsXRtT47mfVlmL+ubrtGJyutCD+lTDNZ3zeP1/HT96bpDnZV8GcAth59vMiBj5ElYuwxpSF3UoLLkWvGOtvIU/AzCDNsL4k6QZPTcu9FZBopZG3pz7WF3CL1xjZ336bEZTBtY0OKNZ4BQT9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730314622; c=relaxed/simple;
	bh=M2a6h53NauRwweWqJhmomgrB2HPYYLMaW/NVf9W7CI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOlJtfmtYTxQGdf4lys6OiGskI1jSKbaDtcjo68PvrYGD7CWr0gb80DYHhHLoIMMgaga98ZQAXQ51cp+2s06kdXZTQd/GdXgtokUQbjkV0/zP30UB+9RToi89Bhrlzp1qchhAAME6hzIiGqgOQgBh9PP86yvoZN/n6RUNoGfdRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lUebFpWw; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13520C0006;
	Wed, 30 Oct 2024 18:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730314617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FzkcjRxagUY36d1VDj7H15a6opD55PTVefEIMiGCuaU=;
	b=lUebFpWwx1tewUnpH2diNVSx+7wBPUQD5JnQhUsryh4AKx7xfoLVUZUvG54jmuF71U8P7W
	C/Kyzn4GgW7cSpODleV0fKNh1/czzOwAH6XMC3Kmp03nS5dsOZ2ffhsc+MNpeJe/k2/Ozc
	g+Z6C/BVZe4hUsg5W42CdU3uVG9QGOjr7mcV3YWn2o3I67YyYAe8yjQRmJh6V8tnNv2SR1
	G/zNZ1ZOUq/oZrqgoAro60YpBuqspb4nLwt6uUUME3hO+vPeO2stab7xN7jMxURRlRBk3J
	eijp4Tnz4BDf1xkgXVtJCx+1GLwybFyx3QKw/iLTHYJsyQMY9NCzrsYXfYO47g==
Date: Wed, 30 Oct 2024 19:56:55 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org,
	Claudiu <claudiu.beznea@tuxon.dev>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 00/10] Add RTC support for the Renesas RZ/G3S SoC
Message-ID: <20241030185655bfd883a8@mail.local>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUwW98riCJ0VfZMzf59Lb4-gRm740z7mnSDQDTfQSJzWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUwW98riCJ0VfZMzf59Lb4-gRm740z7mnSDQDTfQSJzWw@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 30/10/2024 16:50:43+0100, Geert Uytterhoeven wrote:
> Hi Mike, Stephen, Alexander,
> 
> On Wed, Oct 30, 2024 at 12:01 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > On the Renesas RZ/G3S SoC the RTC clock is provided by the VBATTB
> > IP. A 32 KHz crystall oscillator could be connected to the VBATTB
> > input pins. The logic to control this clock (and pass it to RTC)
> > is inside the VBATTB IP. For this, the clk-vbattb driver was added
> > (patches 01-03/12).
> >
> > Patches:
> > - 01-03/10: add VBATTB support that provides the RTC clock
> > - 04-05/10: add the RTC driver
> > - 06-09/10: update the device trees with proper nodes to enable RTC
> > -    10/10: enable proper config flags for RTC to work on RZ/G3S SoC
> >
> > Merge strategy, if any:
> > - clock patches (01-03/10) need to go though the same tree because of
> >   patch 03/10 using the devm_clk_hw_register_gate_parent_hw() introduced
> >   in patch 02/12
> 
> Once Mike/Stephen are happy with 02, I can queue patches 01-03 in
> renesas-clk.
> 
> > - RTC patches (04-05/10) can go though RTC tree
> > - DTS and defconfig patches can go though Renesas tree
> 
> Patches 06 and 08 I can queue in renesas-devel soon.
> For 07 and 09, I am waiting for feedback from Alexandre on the RTC
> DT bindings.

I'll take 4 and 5 this cycle.

> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

