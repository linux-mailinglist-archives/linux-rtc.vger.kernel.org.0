Return-Path: <linux-rtc+bounces-1227-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E82FD8D5099
	for <lists+linux-rtc@lfdr.de>; Thu, 30 May 2024 19:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2505A1C2189B
	for <lists+linux-rtc@lfdr.de>; Thu, 30 May 2024 17:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E078E4436C;
	Thu, 30 May 2024 17:10:31 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6963F41A94;
	Thu, 30 May 2024 17:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717089031; cv=none; b=jyc+NkEFmcWYauUT/JxwkYvuyf643ClEdXMDpyYZ4r0Gbm9GijfDy7VGWmznAAPgBgOGgtPVnf6TAra63Gnbgr3jyVX68UZ5ybZJNlm96iiJnZcPDx/WdlqjuVdgp2Sg2KUJ23+c3Z7CuqG9/ey9QkrRBa2XirGfXzckMGMTryA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717089031; c=relaxed/simple;
	bh=0Hx1kCDf4CrTRIi/fOADLuEHpwsUT9fMTzXzqZC5WgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xb9gxdEtufVo6H3X9nHtZr6PMLvOOdFGAjYzJC9K5q8RrN/JKJ2DmvWp81TBlcT9A7z8xFp/KOFlFX9THG6Oxymnp+lh3CnbFV8L/5yJOS1x/++EXkIyNuNkrzv0Ind6ksj2C5XxNkb1KJ28GThJhbURPiJBYcdJ8D/jVsFn4pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF5AA339;
	Thu, 30 May 2024 10:10:51 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 358163F792;
	Thu, 30 May 2024 10:10:26 -0700 (PDT)
Date: Thu, 30 May 2024 18:10:22 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Alois Fertl <a.fertl@t-online.de>
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, linux-rtc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/1] drivers/rtc: rtc-sun6i: AutoCal Internal OSC
Message-ID: <20240530181022.6fbc5a7d@donnerap.manchester.arm.com>
In-Reply-To: <20240522182826.6824-1-a.fertl@t-online.de>
References: <20240522182826.6824-1-a.fertl@t-online.de>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 May 2024 20:28:26 +0200
Alois Fertl <a.fertl@t-online.de> wrote:

> I have a M98-8K PLUS Magcubic TV-Box based on the Allwinner H618 SOC.
> On board is a Sp6330 wifi/bt module that requires a 32kHz clock to
> operate correctly. Without this change the clock from the SOC is
> ~29kHz and BT module does not start up. The patch enables the Internal
> OSC Clock Auto Calibration of the H616/H618 which than provides the
> necessary 32kHz and the BT module initializes successfully.
> Add a flag and set it for H6.
> Also the code is developed on the H618 board it only modifies the H6 as
> there is no support for H616/H618 in the current code.

I am a bit confused: so this patch doesn't fix your problem then, because
the code you touch is not used on the H616/H618?
Actually I would have expected your patch to only change
drivers/clk/sunxi-ng/ccu-sun6i-rtc.c, since that's the only RTC clock
driver relevant for the H616.

> Signed-off-by: Alois Fertl <a.fertl@t-online.de>
> ---
> 
> v1->v2
> - add flag and activate for H6 AND H616
> 
> v2->v3
> - correct findings from review
> 
> v3->v4
> - adjust to mainline tree
> 
> I have also tried to test this using the new driver in sunxi-ng
> manually injecting the reverted patch
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=60d9f050da63b

So this was done on a H6 device? Because out of the box rtc-sun6i.c is
used on the H6 only, and ccu-sun6i-rtc.c is only used on the H616.

Maybe I am missing something here ...

> The code in drivers/clk/sunxi-ng/ccu-sun6i-rtc.c is being called and it
> initializes the relevant registers to the same values as the old driver,
> but the change ends up with a system that often hangs during booting and
> only ocasionally reaches the login state (one out of 10).
> The main difference I see adhoc is that the old drivers init is done
> using CLK_OF_DECLARE_DRIVER so initialization is done very early.
> The new driver does the initialisation via probe which is quite some
> time later.
> Can't tell if this is the cause for the problems.

That sounds odd, can you post your changes somewhere?

Generally, without a proper problem and without further testing, I would
not like to touch the H6 RTC code needlessly.
For the H616 we have a concrete problem at hand, that justifies a change,
also it's the proper driver for new devices, so that's where the change
should happen.

Cheers,
Andre

> 
> ---
>  drivers/rtc/rtc-sun6i.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index 8e0c66906..57aa52d3b 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -42,6 +42,11 @@
>  
>  #define SUN6I_LOSC_CLK_PRESCAL			0x0008
>  
> +#define SUN6I_LOSC_CLK_AUTO_CAL			0x000c
> +#define SUN6I_LOSC_CLK_AUTO_CAL_16MS		BIT(2)
> +#define SUN6I_LOSC_CLK_AUTO_CAL_ENABLE		BIT(1)
> +#define SUN6I_LOSC_CLK_AUTO_CAL_SEL_CAL		BIT(0)
> +
>  /* RTC */
>  #define SUN6I_RTC_YMD				0x0010
>  #define SUN6I_RTC_HMS				0x0014
> @@ -126,7 +131,6 @@
>   *     registers (R40, H6)
>   *   - SYS power domain controls (R40)
>   *   - DCXO controls (H6)
> - *   - RC oscillator calibration (H6)
>   *
>   * These functions are not covered by this driver.
>   */
> @@ -137,6 +141,7 @@ struct sun6i_rtc_clk_data {
>  	unsigned int has_out_clk : 1;
>  	unsigned int has_losc_en : 1;
>  	unsigned int has_auto_swt : 1;
> +	unsigned int has_auto_cal : 1;
>  };
>  
>  #define RTC_LINEAR_DAY	BIT(0)
> @@ -267,6 +272,14 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
>  	}
>  	writel(reg, rtc->base + SUN6I_LOSC_CTRL);
>  
> +	if (rtc->data->has_auto_cal) {
> +		/* Enable internal OSC clock auto calibration */
> +		reg = SUN6I_LOSC_CLK_AUTO_CAL_16MS |
> +			SUN6I_LOSC_CLK_AUTO_CAL_ENABLE |
> +			SUN6I_LOSC_CLK_AUTO_CAL_SEL_CAL;
> +		writel(reg, rtc->base + SUN6I_LOSC_CLK_AUTO_CAL);
> +	}
> +
>  	/* Yes, I know, this is ugly. */
>  	sun6i_rtc = rtc;
>  
> @@ -374,6 +387,7 @@ static const struct sun6i_rtc_clk_data sun50i_h6_rtc_data = {
>  	.has_out_clk = 1,
>  	.has_losc_en = 1,
>  	.has_auto_swt = 1,
> +	.has_auto_cal = 1,
>  };
>  
>  static void __init sun50i_h6_rtc_clk_init(struct device_node *node)


