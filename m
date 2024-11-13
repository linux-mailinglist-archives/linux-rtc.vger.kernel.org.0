Return-Path: <linux-rtc+bounces-2550-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DECC9C6B14
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Nov 2024 10:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E993281DD6
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Nov 2024 09:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D25B18A6A0;
	Wed, 13 Nov 2024 09:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O+cSYTJp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57A318A937;
	Wed, 13 Nov 2024 09:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731488420; cv=none; b=dl1ZwWFnU4hzuL19BUMl72tfCI4qSv16F/1SjlSjy9mauyyC0tImSiIxFFEHdMr0Zx0SxtV6tgKrCjtSsN8BTW/5xRagjC9OaHzcTKdOTOaVW1+wuoE+7LP84Cs/hJ933xUAWyaY8AYhuB6ygoLBRmkRnm15HGNjDFMVUSdKk74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731488420; c=relaxed/simple;
	bh=w+kbwyCcsp4OkwGLeTAr8r+rxqSs6z8mgmGHDMrLs7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZ/YdKaYgshmJf0MOxRLolSBhZMJaTuZ0zltOU0NVssUWYAPg5pr5vF9/+xNc3D27tyB1LbccdITXi21Pudks4HBzhGL30PMgK/u7UHLfL0JMusZ7ducc0nwOm1lDf3fg4y3fGepR1kTCOaC4cdiMidJRR/LwbQVNt2FALCompQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O+cSYTJp; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06D74E0003;
	Wed, 13 Nov 2024 09:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731488409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E9njZBTIcLfCJhjDXkZM9IcrPjxMe5ftrTxBl5Q+hx0=;
	b=O+cSYTJpFtM59gEG2fZwS7Kx64rVoZIN/fz8XtKBOJzQMqYjJSxrv3pcM2VZGX9E6YcSvZ
	emU0OCIPrY7gwusoiN5YBL8JKFiJTvlkli3Fcfl+C94ok0g8Z5vUk5GBG6Yh3vT862KnTe
	khUuzcc3GVP6/AD3nJ3ou7nvae/zV6+/lOjftJvSkrurn5Hb3nc5VreqnsInfcFSmCBoGp
	uUGl00j3aNMkHIWhD6Yz67oaGJ4L0W1COTCmsnsm9elzfh4hyrq8S80sOC9i70V4mX6nuQ
	CHhL3lJv0mOL3HsldCGmhi94uYX+s7oSLUy0kAKdPRb5QsuBmTQPsFUicTpPIw==
Date: Wed, 13 Nov 2024 10:00:06 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, linux-amlogic@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 0/5] Merge RTC Haoyu HYM8563 into RTC PCF8563
Message-ID: <2024111309000615fd9fbd@mail.local>
References: <20241113085355.1972607-1-iwamatsu@nigauri.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113085355.1972607-1-iwamatsu@nigauri.org>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 13/11/2024 17:53:50+0900, Nobuhiro Iwamatsu wrote:
> RTC Haoyu HYM8563 has the same hardware structure as RTC PCF8563, and
> operates with the same device driver. Therefore, since we do not need
> two drivers with the same function, this merges HYM8563 into PCF8563.
> 

I've seen that but last I checked both drivers are not functionally
identical so this is not that simple.

> This series was tested with PCF8563 and HYM8563 on khadas vim3 board.
> 
> Nobuhiro Iwamatsu (5):
>   ARM: multi_v7_defconfig: Add RTC PCF8563 support
>   rtc: pcf8563: Add support Haoyu HYM8563
>   dt-bindings: rtc: pcf8563: Add Haoyu HYM8563 compatibility
>   rtc: Remove HYM8563 RTC driver
>   dt-bindings: rtc: hym8563: Remove hym8563 binding
> 
>  .../bindings/rtc/haoyu,hym8563.yaml           |  56 --
>  .../devicetree/bindings/rtc/nxp,pcf8563.yaml  |  18 +-
>  arch/arm/configs/multi_v7_defconfig           |   2 +-
>  arch/arm64/configs/defconfig                  |   1 -
>  drivers/rtc/Kconfig                           |  11 -
>  drivers/rtc/Makefile                          |   1 -
>  drivers/rtc/rtc-hym8563.c                     | 587 ------------------
>  drivers/rtc/rtc-pcf8563.c                     |   2 +
>  8 files changed, 17 insertions(+), 661 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml
>  delete mode 100644 drivers/rtc/rtc-hym8563.c
> 
> -- 
> 2.45.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

