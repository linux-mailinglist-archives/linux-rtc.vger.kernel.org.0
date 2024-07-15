Return-Path: <linux-rtc+bounces-1502-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB1D9313D3
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jul 2024 14:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DB811C21407
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jul 2024 12:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D98F187357;
	Mon, 15 Jul 2024 12:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qy4gIjGw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293361862AC
	for <linux-rtc@vger.kernel.org>; Mon, 15 Jul 2024 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721045721; cv=none; b=gqD3c/buVggeRbqGGkG2G93+8RPEEAEudXB6GDQSEeKZaJQys0eteDv2HtcnZuLKqSit2c2TQ6TETJaeZms/H1Q0Qe2cQ0qZsFUaY1N0GrDbHEKvGhp7YO87gX5I9Flqxu4hIZ+kEZkrvEJqFDBNpl/+vEaZP42aQeylVbqtQ/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721045721; c=relaxed/simple;
	bh=5xQhG8nlXIRtYqjYTvRs/WOOIOO6JKvWOMa1sLZcaEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=slGxON1iAA3dnEqk77OAC/6YRyXT0t6wf0wvr47i2ZdHjKTBlNJ3zCfT3ehjkXoK8pkm0qzz4orxqg+cnOaOpft1x0j44Il5aDQF3X2X7v/fdD1r2ZdnIaPzZmgtzJC5eoKLBSoFa+1ZASNiS/i6cUVromW/DFPoaOFwNAktp7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qy4gIjGw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC8BC32782;
	Mon, 15 Jul 2024 12:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721045720;
	bh=5xQhG8nlXIRtYqjYTvRs/WOOIOO6JKvWOMa1sLZcaEY=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=qy4gIjGwqtIyw0dHtIViEc2qyYpBZO7O6981IfKdACXOOGCZgh268dn+kcZsu91fC
	 id/rax7ugkMLpgHAVZvxesBDCU6DS6Zmli0FvcNLEcACQNkQpB2RNC022GHv30MQur
	 dMytBO5K32dERFA2uUxNP/HBNfE9k0GltjaTXxzv1JFIZwtzkoFEmLQevN6UZpUu8z
	 6SauGqTVPULbzazpgsPtb0bBgSuV+f/e0Bn4gHn+CcNy5kvEvnp7hMjSQZV4egOZnK
	 JZfuvEqTsv8e+vtOYi1U2H3t9MgrpTwuX4d+55nFM1qHXlc+BN2a4WN6w4AREtBsg9
	 enRV4W6BJ2tgw==
Date: Mon, 15 Jul 2024 14:15:15 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, soc@kernel.org, 
	arm <arm@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v12 4/8] platform: cznic: turris-omnia-mcu: Add support
 for poweroff and wakeup
Message-ID: <mnviqych4f3g2xexnnf5pt6ashprda5cmtbv6mkuwgcco7oabt@kz3ztt4gnfvi>
References: <20240617152606.26191-1-kabel@kernel.org>
 <20240617152606.26191-5-kabel@kernel.org>
 <20240715032402.GA2968547@thelio-3990X>
 <c7cdd2a7-4201-47bb-b31e-d0279e96fcdb@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7cdd2a7-4201-47bb-b31e-d0279e96fcdb@app.fastmail.com>

On Mon, Jul 15, 2024 at 08:12:39AM +0200, Arnd Bergmann wrote:
> On Mon, Jul 15, 2024, at 05:24, Nathan Chancellor wrote:
> > On Mon, Jun 17, 2024 at 05:26:02PM +0200, Marek Behún wrote:
...
> >
> > I am seeing the following Kconfig warning from ARCH=s390 allmodconfig:
> >
> > WARNING: unmet direct dependencies detected for RTC_CLASS
> >   Depends on [n]: !S390 [=y]
> >   Selected by [m]:
> >   - TURRIS_OMNIA_MCU [=m] && CZNIC_PLATFORMS [=y] && (MACH_ARMADA_38X 
> > || COMPILE_TEST [=y]) && I2C [=m] && OF [=y] && WATCHDOG [=y]
> >
> > because of:
> >
> > menuconfig RTC_CLASS
> >     bool "Real Time Clock"
> >     default n
> >     depends on !S390
> >
> > which appears to have ultimately come from commit 9556fb73edfc ("[S390]
> > Kconfig: unwanted menus for s390."). No other driver appears to
> > unconditionally select this (I only see it selected within
> > arch/*/Kconfig), so it does not look like this has come up before.
> > Should s390 be excluded from the COMPILE_TEST dependency?
> 
> There is really no reason for a driver to select another subsystem,
> it not just causes problems like this one but also leads to
> circular dependencies and surprises when someone turns on
> a random driver and then turns it off again, leaving the
> the other subsystems accidentally enabled.

Makes sense.

> I've applied the fixup below now, leaving GPIOLIB_IRQCHIP
> as the only selected symbol since this is not user-visible.

Thanks.

> Marek, you could consider changing the driver so it doesn't
> actually require all those subsystems at build time but instead
> just leaves out the functionality. Some subsystems actually
> have a stub implementation that makes it work by just dropping
> the dependency, but I did not try that here.

I will look into that.

Marek

