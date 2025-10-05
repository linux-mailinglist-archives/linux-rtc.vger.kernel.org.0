Return-Path: <linux-rtc+bounces-5054-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F18BBCCA6
	for <lists+linux-rtc@lfdr.de>; Sun, 05 Oct 2025 23:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 636A13B4533
	for <lists+linux-rtc@lfdr.de>; Sun,  5 Oct 2025 21:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7A923A564;
	Sun,  5 Oct 2025 21:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PvZjfjqA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B581191F98
	for <linux-rtc@vger.kernel.org>; Sun,  5 Oct 2025 21:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759700584; cv=none; b=p++dqe4CR8gyHexz6f9CLkOIn5+y9jXmPKOynof7pYmRzpXwv5l8YOECC6VFMLHPO9cMaH++LtTeCikuFZsdIzO9k6hIV8NBWcHfvK2hs5nPriTJu1Q9Ng2P9DvZSRGosUu60ViSpdC97fH13qB0F/CnbSkqzWKNTzNwBytJ870=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759700584; c=relaxed/simple;
	bh=5XJgpqDZDnylQZRR2q1O9ljc7bO6cYURHlEah3vm1sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRz1nsXODdj9Pbg0FbmfFbewqRO9/xPXMj+pdWL/L4oNPbf5bEo81ccqZyT6AITwtJlHw2SFEdrzky8wOYe7Pg0fh2xjfGeoHZWxEJMHfScZ1eylDVOAnxXlIgfqfmbt2KEC8VG4xCFtcYTa3YxcwajifSyLUO2f/kjN4XUGKvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PvZjfjqA; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BC4D14E40EB5;
	Sun,  5 Oct 2025 21:42:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E86F6065F;
	Sun,  5 Oct 2025 21:42:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5495102F1CFA;
	Sun,  5 Oct 2025 23:42:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759700578; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ikxEv8Gm2su2ZZEUWd9/OL6i4Bjm4NlNTOBJiXZjuKs=;
	b=PvZjfjqAbdQefUvmkSB9K7Y2494tOfSCjqAXKt1DMeY5Xtl8NrI/4bvMwtNvT81hWqfAgy
	7tjvcLVuSsvQsngJL/cuSH1qfegGQo1x6oFGN4CRYawRaR04v8R9cy6qMSbFMGQg0sUzCN
	iCE05d/25g9mU91lgHCmlCcIgYsB2jfKIo335J0dKHdIMhcQM1FF1MuvdIbaAlljEpzsU/
	xEhl7lu59CW8XVTxe5DyGl4B7Z34MtPft0UKKu9XarYPuL3y+Jp0SZfIB8izS7dfm9Xwc1
	wOdWCHgFeUcz7xW2+cncOlUmJxX1VaigvGbmv4bnNaHd79/hM+DjN80aWYkZ5A==
Date: Sun, 5 Oct 2025 23:42:53 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Devang Tailor <dev.tailor@samsung.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	henrik@grimler.se, faraz.ata@samsung.com
Subject: Re: [PATCH v3 0/3] On-chip RTC support for ExynosAutov9
Message-ID: <202510052142538d7fd672@mail.local>
References: <CGME20250905105708epcas5p159281b73f87fae88e824b97889908649@epcas5p1.samsung.com>
 <20250905110554.2212304-1-dev.tailor@samsung.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905110554.2212304-1-dev.tailor@samsung.com>
X-Last-TLS-Session-Version: TLSv1.3

On 05/09/2025 16:35:51+0530, Devang Tailor wrote:
> Enable on-chip RTC support. The on-chip RTC of this SoC is similar
> to the previous version of Samsung SoCs except for TICNT tick time
> counter. So re-use the existing RTC driver with applicable call-backs
> for initialization and IRQ handling without accessing TICNT counter.
> 
> As suggested in review comment, instead of adding separate disable()
> call-back, re-used the existing s3c24xx_rtc_disable() by adding a new
> bool 'use_s3c2410_ticnt' in rtc_data to avoid accessing TICNT counter
> which is not valid for RTC of ExynosAutov9.
> 
> Setting and getting hardware clock has been tested using 'hwclock'
> and 'date' utilities.
> 
> Alarm interrupt has been checked with incrementing interrupt
> count via "cat /proc/interrupts | grep rtc" for 10sec
> wakeup time via "echo +10 > /sys/class/rtc/rtc0/wakealarm"
> 
> changelog
> ---
> Changes in v3:
> - 1/3 : Added Tag 'Reviewed-by'
> - 2/3 : Fixed the review comment of v2 to re-use the existing disable()
> 	instead of adding new one.
>       : Not adding Tag 'Reviewed-by' from V2 since the patch has been
> 	changed
> - 3/3 : Added Tag 'Reviewed-by'
> link for v2 : https://lore.kernel.org/linux-rtc/20250710083434.1821671-1-dev.tailor@samsung.com/
> 
> 
> Changes in v2:
> - Fixed the review comment of v1 for mis-aligmnent & asymmetry bit logic.
> - link for v1 : https://lore.kernel.org/linux-rtc/20250702052426.2404256-1-dev.tailor@samsung.com/
> 
> 
> Devang Tailor (3):
>   dt-bindings: rtc: s3c-rtc: add compatible for exynosautov9
>   rtc: s3c: support for exynosautov9 on-chip RTC
>   arm64: dts: exynosautov9: add RTC DT node
> 
>  .../devicetree/bindings/rtc/s3c-rtc.yaml      |  1 +
>  .../boot/dts/exynos/exynosautov9-sadk.dts     |  4 ++++
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 10 +++++++++
>  drivers/rtc/rtc-s3c.c                         | 21 ++++++++++++++++---
>  4 files changed, 33 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 4ac65880ebca1b68495bd8704263b26c050ac010

You should rebase on top of rtc-next as s3c2410 support has been
removed.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

