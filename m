Return-Path: <linux-rtc+bounces-3321-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A3DA498BE
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 13:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99CB6168425
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 12:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F7926A1A5;
	Fri, 28 Feb 2025 12:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="NEWcRiId"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2AC25DD1F;
	Fri, 28 Feb 2025 12:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740744368; cv=none; b=DCpUMS5ZqYTJCKpgz+vKmVieU7xl9wx2O56Qc00pxLtx2BGCSSV2qizo1WST77bHGWtINe7tFEdhswuaf71sNRBuc7z8809IpLbHdHAzB9Me5CdRQ8/vEXMIPboTmnn9hmeZZRqq9THBbZTRnP+e+0l/vaG2OIAeNpA9/eUw3Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740744368; c=relaxed/simple;
	bh=vjrFCSFkFDUoYvXeLkML1Pi5eNOA5Upz4StAF9CujbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHxTiWsqGLykoj9HazgI6oCAklsRy/xpJLfTsEIjjIQLmy4S743mPtnApsFifhLyiBra848hZ/yey8bLeEZvFMUjMI056v5/XJ6xlBiUh6vrqDhH8ElQO62gVxVHWFQ9fGmflrrHLUSYVruvWUpXBvPjdIZTYBQK6fwlpuwBZgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=NEWcRiId; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vcftivxhuNL7EZgR4bopDnaiJhWUWXb/o3lnz2PgoJk=; b=NEWcRiIdSE6aiCAiUGqb7TAZpW
	1ltGKJMjg347KdnBEAF8j5GOZ8nurdthlGEfNStgBQPWpWb4xf0LAGAcECPZ6G9Oi1JbWQX8SqOP/
	uUA+GktLBcDkywUjud8eLbVrRAlzdR+qHNjkaOSao5tf0n2tUm6EG9/JImjZ2OM/ZrHQXi2TJt0OX
	SyXnHB51Go31S2MLRNUfJh3oqnCzAKOAa2pRX91hEQZ97E7x0BMlzuKOi6R4TRK/EGBG8PRMr+ggW
	kk/jznJc+hhs+AhVoS1orGei0pRO96Yo8HrW6MNFzHI0CV/HS7bg97VTs+37wJsANaqjj+dL7Ka53
	4UiXXsuw==;
Received: from [179.125.94.240] (helo=quatroqueijos)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tnz7m-002182-AB; Fri, 28 Feb 2025 13:05:56 +0100
Date: Fri, 28 Feb 2025 09:05:48 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH 2/2] m68k: rtc: dp8570a: make it a proper RTC class driver
Message-ID: <Z8GmnLgCndvht-th@quatroqueijos>
References: <20250226-m68k-rtc-v1-0-404641ec62e6@igalia.com>
 <20250226-m68k-rtc-v1-2-404641ec62e6@igalia.com>
 <CAMuHMdW_13wOxD0Q0PVCUXBwC9y8iKXTcwH=m5tvX856S9ZU1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW_13wOxD0Q0PVCUXBwC9y8iKXTcwH=m5tvX856S9ZU1w@mail.gmail.com>

On Thu, Feb 27, 2025 at 12:05:26PM +0100, Geert Uytterhoeven wrote:
> Hi Thadeu,
> 
> On Wed, 26 Feb 2025 at 13:27, Thadeu Lima de Souza Cascardo
> <cascardo@igalia.com> wrote:
> > In the past, each rtc implementation had to rewrite the same ioctls in
> > order to be compatible. But since 2006, a common RTC interface has been
> > introduced. Use it for the last user of RTC_MINOR.
> >
> > Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> 
> Thanks for your patch!
> 
> > --- a/arch/m68k/bvme6000/rtc.c
> > +++ b/arch/m68k/bvme6000/rtc.c
> 
> >
> >  static int __init rtc_DP8570A_init(void)
> >  {
> > +       struct platform_device *pdev;
> > +
> >         if (!MACH_IS_BVME6000)
> >                 return -ENODEV;
> >
> >         pr_info("DP8570A Real Time Clock Driver v%s\n", RTC_VERSION);
> > -       return misc_register(&rtc_dev);
> > +
> > +       pdev = platform_device_register_data(NULL, "rtc-generic", -1,
> > +                                            &dp8570a_rtc_ops,
> > +                                            sizeof(dp8570a_rtc_ops));
> 
> Doesn't this conflict with the creation of the same device in rtc_init()[1]?
> 

I didn't look too deep and just assumed that this would be one of those
cases where this was set for machines other than BVME6000.

Ah, right, that is because of this check around it.

#if defined(CONFIG_M68KCLASSIC) || defined(CONFIG_SUN3).

But CONFIG_M68KCLASSIC is set for BVME6000.

On the other hand, mach_hwclk is accessing the same registers as the rtc.c
code, so they are redundant. One thing that is missing is
local_irq_save/local_irq_restore around it. I can add that and remove
rtc.c, which would make more sense here.

Thanks.
Cascardo.

> On BVME6000, mach_hwclk is set:
> 
>     arch/m68k/bvme6000/config.c:    mach_hwclk           = bvme6000_hwclk;
> 
> > +
> > +       return PTR_ERR_OR_ZERO(pdev);
> >  }
> >  module_init(rtc_DP8570A_init);
> 
> [1] https://elixir.bootlin.com/linux/v6.13.4/source/arch/m68k/kernel/time.c#L144
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

