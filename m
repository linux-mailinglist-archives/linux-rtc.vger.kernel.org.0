Return-Path: <linux-rtc+bounces-1863-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A8096A583
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 19:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DCA81C216B7
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 17:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E7F18E047;
	Tue,  3 Sep 2024 17:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HSGMd4Op"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4029218BC3A;
	Tue,  3 Sep 2024 17:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725384988; cv=none; b=Xb9loJlpF8mLJ9eHSjeRvBUCMwxEV6hlyvbbpXS8PXsdh1Jgq0HMfoVL/htxio3ahejt6nayMrnl+/m+Dj+IgQT0y1ukzSDSHSM0Z4xITiIgHQlNNnFqBlWXKvay8DTUFe9qxAOBzTY2VqoVIwv1QaDUidECVr+fl8VmggLu7u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725384988; c=relaxed/simple;
	bh=6wRImgCx+ngG+mf6PjxgW3JwfH1jcknTFnxBP4HSZk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UqW5LEttLpzfN6OA/WGBeByPRX3TIIbizTcCe3baVcz07KRhGcV2wVJyRv3AdjKIIM+xg6BmLaJlm7jUtyXI95kggzigu7rKwj90GcVLzmJLCpwmGjOwcug+yJliYQvGqhMwZq+1mKtEgbV+3DN6LU5W1YEHZOdinlaJpu7dH1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HSGMd4Op; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EDF88FF805;
	Tue,  3 Sep 2024 17:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725384977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ytJ7+V48kuNct1mxvlZovRxmCRiGxTsehGS1w1kVKnU=;
	b=HSGMd4Op5cYNUkfA1pUTtZUAhOuhh3jWsCrDdxEReBGxCmtwV8Ct7ij5nzTtEzcsCIzK4R
	C/IQ//w0N8J2KF8G3RXGmLt5P87hAP9qEtTWvctiGQ92BgiPJAmj8MPzGGa+E8sPFi7YZT
	H+UGW6ZdzyyBzkKJdtixOtYePtblEt4P9RhVUinwkcdmPBn2oo3CQZ41q9NckP+5RjOuDj
	c7JfnHqIfsE7GpNHAeN3e0GHAzkIxoeuftDWj/5FO0AYroqrWQw9KPaP9lYK+NerAUqwfc
	3EhP4f+goxzbZeCmBHW4szl8LrmH4/KZYoGrxPN1LoPHRBxu3aWvM/UNS9LZLg==
Date: Tue, 3 Sep 2024 19:36:15 +0200
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
Message-ID: <20240903173615b69cfd0d@mail.local>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-7-claudiu.beznea.uj@bp.renesas.com>
 <202408302225417622f1e7@mail.local>
 <a7f0a36b-3169-45f8-9169-50bb0c6c04dd@tuxon.dev>
 <2e49b73c-c645-446c-8606-7a531e0a74f8@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e49b73c-c645-446c-8606-7a531e0a74f8@tuxon.dev>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 03/09/2024 19:09:00+0300, claudiu beznea wrote:
> > 
> > Also, w/o this change the RTC remains blocked under the following scenarios
> > if the interrupts are not disabled in remove:
> 
> This intrigued me and did some further investigation. I found that
> something is wrong on the driver as described bellow.
> 
> The failures described in the previous emails were due to the fact that the
> RTC counter clock was requested by the driver as devres managed resource.
> This is the clock that feeds the RTC counting logic.
> 
> With the bellow diff applied on top of this series scenarios 1/ and 2/
> described in the previous email works just fine.
> 
> For scenario 3/ the system is not powered up (as expected) but there are no
> more failures on the next boots.
> 
> diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
> index f908d2a1017d..c9adcadc58c0 100644
> --- a/drivers/rtc/rtc-renesas-rtca3.c
> +++ b/drivers/rtc/rtc-renesas-rtca3.c
> @@ -747,10 +747,14 @@ static int rtca3_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
> 
> -       clk = devm_clk_get_enabled(dev, "counter");
> +       clk = devm_clk_get(dev, "counter");
>         if (IS_ERR(clk))
>                 return PTR_ERR(clk);
> 
> +       ret = clk_prepare_enable(clk);
> +       if (ret)
> +               return ret;
> +
>         spin_lock_init(&priv->lock);
>         atomic_set(&priv->alrm_sstep, RTCA3_ALRM_SSTEP_DONE);
>         init_completion(&priv->set_alarm_completion);
> @@ -783,7 +787,7 @@ static void rtca3_remove(struct platform_device *pdev)
> 
>         guard(spinlock_irqsave)(&priv->lock);
> 
> -       rtca3_alarm_irq_set_helper(priv, RTCA3_RCR1_AIE | RTCA3_RCR1_PIE, 0);
> +       //rtca3_alarm_irq_set_helper(priv, RTCA3_RCR1_AIE | RTCA3_RCR1_PIE, 0);
>  }
> 
> Question is: the RTC counter clock should stay on when the driver is
> unbinded, right?

Yes, the lifecycle of the RTC and its ressources is longer than the
system's as the whole point is to keep the time and date running while
the system is off.

> 
> Thank you,
> Claudiu Beznea
> 
> > 
> > 1/ Configure wake alarm and unbind the RTC driver with the following commands:
> > # echo +10 > /sys/class/rtc/rtc0/wakealarm
> > # echo /sys/bus/platform/drivers/rtc-rtca3/1004ec00.rtc > unbind
> > # sleep 12
> > # echo /sys/bus/platform/drivers/rtc-rtca3/1004ec00.rtc > bind
> > 
> > When rebinding the re-configuration of the RTC device times out:
> > [  121.854190] rtc-rtca3 1004ec00.rtc: error -ETIMEDOUT: Failed to setup
> > the RTC!
> > [  121.861511] rtc-rtca3 1004ec00.rtc: probe with driver rtc-rtca3 failed
> > with error -110
> > -sh: echo: write error: Connection timed out
> > 
> > 2/ Configure wake alarm, unbind the RTC driver and switch to s2idle with
> > the following commands:
> > # echo s2idle > /sys/power/mem_sleep
> > # echo +10 > /sys/class/rtc/rtc0/wakealarm
> > # echo /sys/bus/platform/drivers/rtc-rtca/31004ec00.rtc > unbind
> > # echo mem > /sys/power/state
> > # #system is resumed by non RTC wakeup source (as the RTC alarm is not
> > working anymore in this case)
> > # echo /sys/bus/platform/drivers/rtc-rtca/1004ec00.rtc > bind
> > 
> > The system is not waked up from RTC alarm (as expected) and the rebinding
> > fails again:
> > 
> > [  172.483688] rtc-rtca3 1004ec00.rtc: error -ETIMEDOUT: Failed to setup
> > the RTC!
> > [  172.491003] rtc-rtca3 1004ec00.rtc: probe with driver rtc-rtca3 failed
> > with error -110
> > -sh: echo: write error: Connection timed out
> > 
> > 3/ configure the RTC alarm, unbind and power off (with the following commands):
> > # echo +60 > /sys/class/rtc/rtc0/wakealarm
> > # echo /sys/bus/platform/drivers/rtc-rtca/1004ec00.rtc > unbind
> > # poweroff
> > 
> > The system is not started after 60 seconds and at the next reboot the RTC
> > configuration on probe is failing the same:
> > 
> > [    0.292068] rtc-rtca3 1004ec00.rtc: error -ETIMEDOUT: Failed to setup
> > the RTC!
> > [    0.292182] rtc-rtca3 1004ec00.rtc: probe with driver rtc-rtca3 failed
> > with error -110
> > 
> > In all scenarios the RTC is recovered only if removing/re-applying the
> > power to the SoC area where it resides.
> > 
> > These tests were done with the patches in this series and then I tried it
> > with the following diff on top of the patches in this series. The results
> > were the same:
> > 
> > diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
> > index 822c055b6e4d..720fdac3adc6 100644
> > --- a/drivers/rtc/rtc-renesas-rtca3.c
> > +++ b/drivers/rtc/rtc-renesas-rtca3.c
> > @@ -586,7 +586,7 @@ static int rtca3_initial_setup(struct clk *clk, struct
> > rtca3_priv *priv)
> >         usleep_range(sleep_us, sleep_us + 10);
> > 
> >         /* Disable alarm and carry interrupts. */
> > -       mask = RTCA3_RCR1_AIE | RTCA3_RCR1_CIE;
> > +       mask = RTCA3_RCR1_AIE | RTCA3_RCR1_CIE | RTCA3_RCR1_PIE;
> >         ret = rtca3_alarm_irq_set_helper(priv, mask, 0);
> >         if (ret)
> >                 return ret;
> > @@ -784,7 +784,7 @@ static void rtca3_remove(struct platform_device *pdev)
> >         guard(spinlock_irqsave)(&priv->lock);
> > 
> >         /* Disable alarm, periodic interrupts. */
> > -       rtca3_alarm_irq_set_helper(priv, RTCA3_RCR1_AIE | RTCA3_RCR1_PIE, 0);
> > +       //rtca3_alarm_irq_set_helper(priv, RTCA3_RCR1_AIE | RTCA3_RCR1_PIE, 0);
> >  }
> > 
> > Thank you,
> > Claudiu Beznea
> > 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

