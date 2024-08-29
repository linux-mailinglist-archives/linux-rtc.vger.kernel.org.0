Return-Path: <linux-rtc+bounces-1779-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A99964B7A
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 18:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FD481F2146D
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2024 16:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4428A1B78FF;
	Thu, 29 Aug 2024 16:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mPd1GkGm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1D81B78FB;
	Thu, 29 Aug 2024 16:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724948283; cv=none; b=Wj8a7RtqYl25fIJJcui+hhbSTK8lrD/pSzMXpaORsSxTvHZU1zRelE6qAHWy/zfE0aigk7/Es6xMD10+91fr/hKe7x/xDLYO0BMjN+G2Tyf6eXxl3xbrFbDF8eiWVxjkIGPa9exBnG4AV75PQvXoJ1v458Go16asPYcAEq2/jQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724948283; c=relaxed/simple;
	bh=pnVQOit5esrOdWDax1UHkIVI8KzUprZRWP+rRMTsqXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owlTsPwUx7eAgFl/Y6x05CtLFdwE3EuvlddYNWThm1EMbbLW/xnQULRZIBgzk7k6ToOK4IsebxPlaExt6UnY4+L9sEk51Lj4O9nZ/Unbc4mtfSPRaX6p3dLq5I4TAuhOfnT1mtHM1WyGJpClIzsZUIbTcQ+7YiypLOq0XBtuJlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mPd1GkGm; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E154620003;
	Thu, 29 Aug 2024 16:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724948273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PPbweNLOln15v4/LrRjZ9XZdej7S6QSQGVF/NJJi1Ug=;
	b=mPd1GkGmHi486sj2v/JLrpOWlIDP8EIqkoFDqHq9cvOPGm6r9F8cOBbXl7pkGVTeD6zADp
	ZflWJABmmj/yF1evEX6pbh8k79TCoyKFSM2MlAl844ZQRmReNnDROnDH1oNKJAHQu3tygD
	abDD7/vsZrYBUSWA+MoGAP5DiUP7SA836V1YjtJ2sRIsOFdx54gqajy2d76XAaxmYqiqS3
	BWc2Sww4mMaWXNKQvQEaT7WhtDuHqdeXp8dCBhs/MFxeCRJhhTHXzVGjXkb3Qz51XV3u7J
	H7Dxq7WAP8RFKsYtWrcynH/TZXpJQJD5JRPl4LqoHn0w/f1aydEI1E6w4Z3lRg==
Date: Thu, 29 Aug 2024 18:17:52 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: gomba007@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, csokas.bence@prolan.hu,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 0/2] Add support for the DFRobot SD2405AL I2C RTC
 Module.
Message-ID: <202408291617526e31318b@mail.local>
References: <20240829-rtc-sd2405al-v6-0-4fbfe2624aa7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240829-rtc-sd2405al-v6-0-4fbfe2624aa7@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

This looks good, can you send v7 adressint Conor's comment, don't forget
to collect his tag.

On 29/08/2024 13:31:43+0200, Tóth János via B4 Relay wrote:
> This patch series adds a driver and the documentation for the SD2405AL I2C RTC.
> 
> To: Alexandre Belloni <alexandre.belloni@bootlin.com>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-rtc@vger.kernel.org
> Cc: csokas.bence@prolan.hu
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Tóth János <gomba007@gmail.com>
> 
> Changes in v6:
> - Add missing To-s and Cc-s.
> - Rebased onto v6.11-rc5
> - Link to v5: https://lore.kernel.org/r/20240828-rtc-sd2405al-v5-0-9e3f8fa5ea6b@gmail.com
> 
> Changes in v5:
> - Rework based on Alexandre Belloni's suggestions.
> - Drop explicit initialization of struct i2c_device_id::driver_data.
> - Add documentation.
> - Link to v4: https://lore.kernel.org/r/20240624-rtc-sd2405al-v4-1-2b2bc759f98f@gmail.com
> 
> Changes in v4:
> - Implement more comprehensive data validation.
> - Inline some temporary variables.
> - Link to v3: https://lore.kernel.org/r/20240620-rtc-sd2405al-v3-1-65d5bb01af50@gmail.com
> 
> Changes in v3:
> - #define-s of registers are reworked.
> - Minor revisions based on the reviewer's suggestions.
> - Link to v2: https://lore.kernel.org/r/20240619-rtc-sd2405al-v2-1-39bea29bd2a5@gmail.com
> 
> Changes in v2:
> - Refactored based on reviewer's suggestions.
> - I couldn't get the I2C IRQ to work on Raspberry Pi 4, so alarm is
>   skipped.
> - Link to v1: https://lore.kernel.org/r/20240607-rtc-sd2405al-v1-1-535971e7a866@gmail.com
> 
> ---
> Tóth János (2):
>       drivers: rtc: Add driver for SD2405AL.
>       dt-bindings: rtc: Add support for SD2405AL.
> 
>  .../devicetree/bindings/rtc/trivial-rtc.yaml       |   2 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>  MAINTAINERS                                        |   6 +
>  drivers/rtc/Kconfig                                |  10 +
>  drivers/rtc/Makefile                               |   1 +
>  drivers/rtc/rtc-sd2405al.c                         | 227 +++++++++++++++++++++
>  6 files changed, 248 insertions(+)
> ---
> base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
> change-id: 20240607-rtc-sd2405al-a0947377c73d
> 
> Best regards,
> -- 
> Tóth János <gomba007@gmail.com>
> 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

