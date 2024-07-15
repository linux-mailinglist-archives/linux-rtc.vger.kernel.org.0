Return-Path: <linux-rtc+bounces-1499-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A3257930DCD
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jul 2024 08:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 055F3B20DD3
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jul 2024 06:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CDC913AA3E;
	Mon, 15 Jul 2024 06:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="qRJGJcmV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lHuXNzC7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCE71DFF8
	for <linux-rtc@vger.kernel.org>; Mon, 15 Jul 2024 06:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721023523; cv=none; b=HSAcUs1FHEwqSF6kqzKsmhfzX9sAXEYqKpnYuUBFrV8yCdAmdWbmtyJ6Yftig70GNScKsgBprLVayaWyK5sYaV32zZ6fK+TxHq0cWsBzKZLXGbDJDX4PzV7uunLVKVtEYmqz9U3m3AI827N0s+XB6kbnutSqcY2igfRn/yEsQBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721023523; c=relaxed/simple;
	bh=6eKcTLveIu9JgaublsyxJOpc4Lw8W6ufYO1V/yEEu2c=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=ppdJoKL7YtJbBZSQSRbbNwXZ+0g14/KKUeObowyLErbtdZgsJUVuHA3mVntpvpzwnHZlJqpGrM2Z701oGJM/r+txxaaEUhAEJ6apzq67ARZG/ZKaLRIQtM8LYc0S0LUGAtzvgfE7yiNOubqzwCQy2wJGP43LUzek6oLZ1oLr0j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=qRJGJcmV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lHuXNzC7; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id E0F7D1388E18;
	Mon, 15 Jul 2024 02:05:19 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 15 Jul 2024 02:05:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1721023519;
	 x=1721109919; bh=kZr8228ulZTO2HxstFqspMH7kKPMPcCpBfqncqWcCO8=; b=
	qRJGJcmVzRlTSZw1aa8jUINbIRWoqaAJzUAMuME0k5/0tYXaRbkSPXOlFaXnyW/J
	lbvERurQ+CK47yJPX4A4rdGIj2No5idU+SeiYgVKAiHYOpCUmUIFVUSkwrKaXZM/
	JfdT/xFp/KdZlLnmCTomuAIIRHfrA059oXJ65OeiJGkOY/twZKCt+58xcahJDsZo
	a9YA/2q6Nuilur7FpQFXXfhGj7GUK5nsSYT+Ilga7WMJE6/TX8r1kvApvr2nuJxn
	PESgZ5StWr+cjYCrgosk/RzWbeSEYI1eNUgfI4aRHPUEpio8/vgpwNiWpQXmyKie
	uYj4Au8CrzQXXfC7jzwanA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1721023519; x=
	1721109919; bh=kZr8228ulZTO2HxstFqspMH7kKPMPcCpBfqncqWcCO8=; b=l
	HuXNzC7pvJXo6NNhXO971521iYwgrQODbOTvY4dft2MBPJ8XwDicWAArHGgZ95de
	ub8ZHjy3otXjviTljILnVHeN0ZGsMkXS7EVdW4SU11fV82sWNHV4mA1EkMiDso9f
	miwdHbuEtzf46E+b2Unud0GR6uIOjb4HaLDAZyFELwUJEWvJ+KW7wpFMqtKGMuda
	J7wucYTJdV8kUeO7hCEWYgCGB9qnLg2gbjvp2cvAZyUwrBDNos/63UuuXd6VWK1z
	DS6eP9IvMRT+8k0yRluAQmWbO/ZMgy8vBowDr1e21r2y/d/RHwmFfRtGixWN+WOz
	WleORalLLHWrsWFlx+uhw==
X-ME-Sender: <xms:HryUZlyVpz3fdM_cZsMASMlyPuZ5m3ms5FNBJpAn45IB2p8sZ4TQvw>
    <xme:HryUZlRcUZHbT-364oCm8BCGt5a6tEM4jRBdCBYeALuy2-x9PvdqaTjhLHCEUzwlv
    l9A6QtJvEy8f3Ec3XU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgedugddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:HryUZvUfaOXnXw0jkTv3HQwr8vOZgCJXoa-AwXuH1K1ZnsKi56Gb5g>
    <xmx:HryUZngly2ryDr4D6kzcvbykkmg1m0UodnInWqdvrpmoW6GKUJiymQ>
    <xmx:HryUZnCIDNMKvXgihcV3KwCLuzyeLCzWXMraqeb3yRRdvUpUoFVd2w>
    <xmx:HryUZgJUEYfjydmaqvoRAdOx2NyU_8S3oSfz3BGXjdd7FuLWcYSEpA>
    <xmx:H7yUZr56yaJMTfUfXkfXMr02WISsi1HnrrCgL2FQwxC657KrUTEomeNh>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 57609B6008F; Mon, 15 Jul 2024 02:05:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <c7cdd2a7-4201-47bb-b31e-d0279e96fcdb@app.fastmail.com>
In-Reply-To: <20240715032402.GA2968547@thelio-3990X>
References: <20240617152606.26191-1-kabel@kernel.org>
 <20240617152606.26191-5-kabel@kernel.org>
 <20240715032402.GA2968547@thelio-3990X>
Date: Mon, 15 Jul 2024 08:12:39 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: "Gregory Clement" <gregory.clement@bootlin.com>, soc@kernel.org,
 arm <arm@kernel.org>, "Andy Shevchenko" <andy@kernel.org>,
 "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Alessandro Zummo" <a.zummo@towertech.it>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Linus Walleij" <linus.walleij@linaro.org>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v12 4/8] platform: cznic: turris-omnia-mcu: Add support for
 poweroff and wakeup
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024, at 05:24, Nathan Chancellor wrote:
> On Mon, Jun 17, 2024 at 05:26:02PM +0200, Marek Beh=C3=BAn wrote:
>> Add support for true board poweroff (MCU can disable all unnecessary
>> voltage regulators) and wakeup at a specified time, implemented via a
>> RTC driver so that the rtcwake utility can be used to configure it.
>>=20
>> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
>> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> ...
>> diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/=
Kconfig
>> index d95e7c83c7ae..c1e719235517 100644
>> --- a/drivers/platform/cznic/Kconfig
>> +++ b/drivers/platform/cznic/Kconfig
>> @@ -18,10 +18,14 @@ config TURRIS_OMNIA_MCU
>>  	depends on I2C
>>  	select GPIOLIB
>>  	select GPIOLIB_IRQCHIP
>> +	select RTC_CLASS
>>  	help
>>  	  Say Y here to add support for the features implemented by the
>>  	  microcontroller on the CZ.NIC's Turris Omnia SOHO router.
>>  	  The features include:
>> +	  - board poweroff into true low power mode (with voltage regulators
>> +	    disabled) and the ability to configure wake up from this mode (=
via
>> +	    rtcwake)
>>  	  - GPIO pins
>>  	    - to get front button press events (the front button can be
>>  	      configured either to generate press events to the CPU or to c=
hange
>
> I am seeing the following Kconfig warning from ARCH=3Ds390 allmodconfi=
g:
>
> WARNING: unmet direct dependencies detected for RTC_CLASS
>   Depends on [n]: !S390 [=3Dy]
>   Selected by [m]:
>   - TURRIS_OMNIA_MCU [=3Dm] && CZNIC_PLATFORMS [=3Dy] && (MACH_ARMADA_=
38X=20
> || COMPILE_TEST [=3Dy]) && I2C [=3Dm] && OF [=3Dy] && WATCHDOG [=3Dy]
>
> because of:
>
> menuconfig RTC_CLASS
>     bool "Real Time Clock"
>     default n
>     depends on !S390
>
> which appears to have ultimately come from commit 9556fb73edfc ("[S390]
> Kconfig: unwanted menus for s390."). No other driver appears to
> unconditionally select this (I only see it selected within
> arch/*/Kconfig), so it does not look like this has come up before.
> Should s390 be excluded from the COMPILE_TEST dependency?

There is really no reason for a driver to select another subsystem,
it not just causes problems like this one but also leads to
circular dependencies and surprises when someone turns on
a random driver and then turns it off again, leaving the
the other subsystems accidentally enabled.

I've applied the fixup below now, leaving GPIOLIB_IRQCHIP
as the only selected symbol since this is not user-visible.

Marek, you could consider changing the driver so it doesn't
actually require all those subsystems at build time but instead
just leaves out the functionality. Some subsystems actually
have a stub implementation that makes it work by just dropping
the dependency, but I did not try that here.

    Arnd

8<------------
commit ed46f1f7731d2cd77d623c0f895df9e23c0bffb6
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Mon Jul 15 08:02:30 2024 +0200

    platform: cznic: turris-omnia-mcu: fix Kconfig dependencies
   =20
    The newly added driver causes a Kconfig warning:
   =20
    WARNING: unmet direct dependencies detected for RTC_CLASS
      Depends on [n]: !S390 [=3Dy]
      Selected by [m]:
      - TURRIS_OMNIA_MCU [=3Dm] && CZNIC_PLATFORMS [=3Dy] && (MACH_ARMAD=
A_38X || COMPILE_TEST [=3Dy]) && I2C [=3Dm] && OF [=3Dy] && WATCHDOG [=3D=
y]
   =20
    The problem here is that it selects entire subsystems, which normal
    device drivers should not do. Changes all of these to 'depends on'
    instead.
   =20
    Fixes: dfa556e45ae9e ("platform: cznic: turris-omnia-mcu: Add suppor=
t for MCU connected GPIOs")
    Fixes: 90e700fd12b61 ("platform: cznic: turris-omnia-mcu: Add suppor=
t for poweroff and wakeup")
    Fixes: ab89fb5fb92c7 ("platform: cznic: turris-omnia-mcu: Add suppor=
t for MCU watchdog")
    Fixes: 41bb142a40289 ("platform: cznic: turris-omnia-mcu: Add suppor=
t for MCU provided TRNG")
    Reported-by: Nathan Chancellor <nathan@kernel.org>
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kco=
nfig
index 2a5235cf6844..cb0d4d686d8a 100644
--- a/drivers/platform/cznic/Kconfig
+++ b/drivers/platform/cznic/Kconfig
@@ -18,11 +18,11 @@ config TURRIS_OMNIA_MCU
 	depends on I2C
 	depends on OF
 	depends on WATCHDOG
-	select GPIOLIB
+	depends on GPIOLIB
+	depends on HW_RANDOM
+	depends on RTC_CLASS
+	depends on WATCHDOG_CORE
 	select GPIOLIB_IRQCHIP
-	select HW_RANDOM
-	select RTC_CLASS
-	select WATCHDOG_CORE
 	help
 	  Say Y here to add support for the features implemented by the
 	  microcontroller on the CZ.NIC's Turris Omnia SOHO router.

