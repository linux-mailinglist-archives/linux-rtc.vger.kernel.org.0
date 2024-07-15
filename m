Return-Path: <linux-rtc+bounces-1498-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F25BC930CF5
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jul 2024 05:24:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 655941F210FC
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jul 2024 03:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E324B24B5B;
	Mon, 15 Jul 2024 03:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+LFJA+q"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFD019BBA
	for <linux-rtc@vger.kernel.org>; Mon, 15 Jul 2024 03:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721013845; cv=none; b=fUQnFl7Zhd4VDeNB2oQKElI+GX9rSCcUsdez6TAXVcuBUraEqOoycSgkoBoZiiUq5AwEdnTDd4ykj/Bgp5dlxxL0uiALAB9HsuomeXYqjZHZfM7/NLbXmWEtZdqvJmuL/NJLTZBBz7Mq5pYPI2wUYsGzGFrGvcGZJSmDU0e9HPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721013845; c=relaxed/simple;
	bh=g1YDApc2ccKhd98RAf7V5ixKA8mgR5MTL5rSwC3fDPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b17NAqfl4cSSeQvRkWOV7YNbXvPcwFsKUS4ecalVJpCD0c9Dm8TfQ3AmbngCmwTNhJj2+gCU2o0yj5s+uGpQPp+b6+eAXaDFMh/bkQJ5/VeghYb4EVNSZJ+TjJR39ZsZmiHGh+ez+WakyaJsfnbTxk2HpEgJJsz81CH7gyzXtXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+LFJA+q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70506C4AF0B;
	Mon, 15 Jul 2024 03:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721013845;
	bh=g1YDApc2ccKhd98RAf7V5ixKA8mgR5MTL5rSwC3fDPw=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=e+LFJA+qsaoKSOzHGccIX1l9cgOZzK6Sq/cmqfZCnvy0VP3upzoxmUtAGRrmeRtcJ
	 9HLxRRVKKAcyfyx30SIM2kioFCAGuKlYh9/lVs7qAuuPew85QUD+scSEa3WfxCj1t2
	 h0OZxdyW5uAHpGwLCqVyUJtpIeIfUPbHQ+lm8eh/tNinYovTmVIf17xbHtpYUzO0Pt
	 JGA3ik3K6wAsYyLEey3ZnzTQipeQAPwuS1DMXdQ2XpcwOebqny2WVx0H9XhCTIKA9H
	 DswBKMNTkoun/1yPQLi6bdW0b6KasCmK3nwwEfxk9yP7bmsQ5sbnfKJN14KiWbw+Mu
	 H1LDGZZppqLtA==
Date: Sun, 14 Jul 2024 20:24:02 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v12 4/8] platform: cznic: turris-omnia-mcu: Add support
 for poweroff and wakeup
Message-ID: <20240715032402.GA2968547@thelio-3990X>
References: <20240617152606.26191-1-kabel@kernel.org>
 <20240617152606.26191-5-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240617152606.26191-5-kabel@kernel.org>

Hi Marek,

On Mon, Jun 17, 2024 at 05:26:02PM +0200, Marek Behún wrote:
> Add support for true board poweroff (MCU can disable all unnecessary
> voltage regulators) and wakeup at a specified time, implemented via a
> RTC driver so that the rtcwake utility can be used to configure it.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
...
> diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
> index d95e7c83c7ae..c1e719235517 100644
> --- a/drivers/platform/cznic/Kconfig
> +++ b/drivers/platform/cznic/Kconfig
> @@ -18,10 +18,14 @@ config TURRIS_OMNIA_MCU
>  	depends on I2C
>  	select GPIOLIB
>  	select GPIOLIB_IRQCHIP
> +	select RTC_CLASS
>  	help
>  	  Say Y here to add support for the features implemented by the
>  	  microcontroller on the CZ.NIC's Turris Omnia SOHO router.
>  	  The features include:
> +	  - board poweroff into true low power mode (with voltage regulators
> +	    disabled) and the ability to configure wake up from this mode (via
> +	    rtcwake)
>  	  - GPIO pins
>  	    - to get front button press events (the front button can be
>  	      configured either to generate press events to the CPU or to change

I am seeing the following Kconfig warning from ARCH=s390 allmodconfig:

WARNING: unmet direct dependencies detected for RTC_CLASS
  Depends on [n]: !S390 [=y]
  Selected by [m]:
  - TURRIS_OMNIA_MCU [=m] && CZNIC_PLATFORMS [=y] && (MACH_ARMADA_38X || COMPILE_TEST [=y]) && I2C [=m] && OF [=y] && WATCHDOG [=y]

because of:

menuconfig RTC_CLASS
    bool "Real Time Clock"
    default n
    depends on !S390

which appears to have ultimately come from commit 9556fb73edfc ("[S390]
Kconfig: unwanted menus for s390."). No other driver appears to
unconditionally select this (I only see it selected within
arch/*/Kconfig), so it does not look like this has come up before.
Should s390 be excluded from the COMPILE_TEST dependency?

Cheers,
Nathan


