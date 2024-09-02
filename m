Return-Path: <linux-rtc+bounces-1828-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF470968EDD
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Sep 2024 22:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52332B22425
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Sep 2024 20:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26A31C62B4;
	Mon,  2 Sep 2024 20:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="F3Qc+8AX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724CB19CC04;
	Mon,  2 Sep 2024 20:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725308906; cv=none; b=nuzs90xHmvx8KvrNH1g3oVpMA8QrBlMv9ArJ8OV4sVY78deThWPvReN9eED8S0MtEvOCTk8KqyXHKMYFIBueXAAtkXOf821stVuAWN5qbuopVmhDdxwAbep9wHDEsRP2KIol8LB+N5Q3qgO7q/EKPmTBxmbFLJn9M/4BBlWNUZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725308906; c=relaxed/simple;
	bh=byvMvMs6cQe+rkDvGuGDD5gUm8DvBPi1Lovd4gjQBhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejNTgAgW3OAGEmLBz9E2VFn8pIydnhce2qXvC+f+bhvshnQkjb/4P+LkkYexLdASCYxs5VNPnmMuTKq+QbwhhDfkFpAEmhvFuOnYiSKaGfk4x7u0gEIRfxagAEVmWEduXKYoRqjsEcdyzMzmFwp2Jqv9yyDR5gMA7to7nZONV98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=F3Qc+8AX; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B9FA60002;
	Mon,  2 Sep 2024 20:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725308901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/acNWIGC7J/l+lCj9xbwfTsap0VDe5s6cnY9+w/1Cgo=;
	b=F3Qc+8AXy4XVfyxeE/R7AjyxDNhZStf4Ngzq3cE/0udfpTXLq5utZIhTRlno2r5HNxDqFW
	7FYsHvNI2HirrQv1DaQjwcuBZmNSDzFcz9CxhEiebQYoCy+gfOJ1k0jarbgqFu22bbaOb6
	tFlKj00ASPoxjX4Lc1JOzAnRHtjPVzDuHY42HxzOtCqemhBOtE7G7Y8LOm1dL2UYQyzxKP
	0AQEna6l8JcAoX7cFb43qflsYcmmYoMZs5aTfU7KEFdxqlrNUEJ654L+/DOz7negI+iw0D
	ctLVRyaFGnT/XT/FPCu2zeftLhyP90QGqO6j8prD0p4RtcUoLB+7bMrWA6ja5w==
Date: Mon, 2 Sep 2024 22:28:19 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	magnus.damm@gmail.com, p.zabel@pengutronix.de,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 06/12] rtc: renesas-rtca3: Add driver for RTCA-3
 available on Renesas RZ/G3S SoC
Message-ID: <20240902202819e2bf5630@mail.local>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-7-claudiu.beznea.uj@bp.renesas.com>
 <202408302225417622f1e7@mail.local>
 <a7f0a36b-3169-45f8-9169-50bb0c6c04dd@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7f0a36b-3169-45f8-9169-50bb0c6c04dd@tuxon.dev>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 02/09/2024 17:49:14+0300, claudiu beznea wrote:
> >> +	/* Disable alarm, periodic interrupts. */
> >> +	rtca3_alarm_irq_set_helper(priv, RTCA3_RCR1_AIE | RTCA3_RCR1_PIE, 0);
> > 
> > Why do you disable alarms on driver remove? I think you need to add a
> > comment if this is because it can't system up, else this is a bad
> > practice.
> 
> The RTC cannot power on the system after a power off. It can't also resume
> it from a deep sleep state (when only the SoC area where the RTC resides
> remains power on (there is no way to signal from RTC to the power supply
> chain that an alarm happened)). It can only wake it up from s2idle mode
> where all SoC components remains powered on.
> 
> Also, w/o this change the RTC remains blocked under the following scenarios
> if the interrupts are not disabled in remove:
> 
> 1/ Configure wake alarm and unbind the RTC driver with the following commands:
> # echo +10 > /sys/class/rtc/rtc0/wakealarm
> # echo /sys/bus/platform/drivers/rtc-rtca3/1004ec00.rtc > unbind
> # sleep 12
> # echo /sys/bus/platform/drivers/rtc-rtca3/1004ec00.rtc > bind
> 
> When rebinding the re-configuration of the RTC device times out:
> [  121.854190] rtc-rtca3 1004ec00.rtc: error -ETIMEDOUT: Failed to setup
> the RTC!
> [  121.861511] rtc-rtca3 1004ec00.rtc: probe with driver rtc-rtca3 failed
> with error -110
> -sh: echo: write error: Connection timed out
> 
> 2/ Configure wake alarm, unbind the RTC driver and switch to s2idle with
> the following commands:
> # echo s2idle > /sys/power/mem_sleep
> # echo +10 > /sys/class/rtc/rtc0/wakealarm
> # echo /sys/bus/platform/drivers/rtc-rtca/31004ec00.rtc > unbind
> # echo mem > /sys/power/state
> # #system is resumed by non RTC wakeup source (as the RTC alarm is not
> working anymore in this case)
> # echo /sys/bus/platform/drivers/rtc-rtca/1004ec00.rtc > bind
> 
> The system is not waked up from RTC alarm (as expected) and the rebinding
> fails again:
> 
> [  172.483688] rtc-rtca3 1004ec00.rtc: error -ETIMEDOUT: Failed to setup
> the RTC!
> [  172.491003] rtc-rtca3 1004ec00.rtc: probe with driver rtc-rtca3 failed
> with error -110
> -sh: echo: write error: Connection timed out
> 
> 3/ configure the RTC alarm, unbind and power off (with the following commands):
> # echo +60 > /sys/class/rtc/rtc0/wakealarm
> # echo /sys/bus/platform/drivers/rtc-rtca/1004ec00.rtc > unbind
> # poweroff
> 
> The system is not started after 60 seconds and at the next reboot the RTC
> configuration on probe is failing the same:
> 
> [    0.292068] rtc-rtca3 1004ec00.rtc: error -ETIMEDOUT: Failed to setup
> the RTC!
> [    0.292182] rtc-rtca3 1004ec00.rtc: probe with driver rtc-rtca3 failed
> with error -110
> 
> In all scenarios the RTC is recovered only if removing/re-applying the
> power to the SoC area where it resides.
> 
> These tests were done with the patches in this series and then I tried it
> with the following diff on top of the patches in this series. The results
> were the same:
> 
> diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
> index 822c055b6e4d..720fdac3adc6 100644
> --- a/drivers/rtc/rtc-renesas-rtca3.c
> +++ b/drivers/rtc/rtc-renesas-rtca3.c
> @@ -586,7 +586,7 @@ static int rtca3_initial_setup(struct clk *clk, struct
> rtca3_priv *priv)
>         usleep_range(sleep_us, sleep_us + 10);
> 
>         /* Disable alarm and carry interrupts. */
> -       mask = RTCA3_RCR1_AIE | RTCA3_RCR1_CIE;
> +       mask = RTCA3_RCR1_AIE | RTCA3_RCR1_CIE | RTCA3_RCR1_PIE;
>         ret = rtca3_alarm_irq_set_helper(priv, mask, 0);
>         if (ret)
>                 return ret;
> @@ -784,7 +784,7 @@ static void rtca3_remove(struct platform_device *pdev)
>         guard(spinlock_irqsave)(&priv->lock);
> 
>         /* Disable alarm, periodic interrupts. */
> -       rtca3_alarm_irq_set_helper(priv, RTCA3_RCR1_AIE | RTCA3_RCR1_PIE, 0);
> +       //rtca3_alarm_irq_set_helper(priv, RTCA3_RCR1_AIE | RTCA3_RCR1_PIE, 0);
>  }

Thanks for the detailed explanation. Can you add a small comment, I
really want t avoid people cargo-culting this behavior as this has
already been the case.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

