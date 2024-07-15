Return-Path: <linux-rtc+bounces-1504-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D16A931C79
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jul 2024 23:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B400C2821DC
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jul 2024 21:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5657213C81B;
	Mon, 15 Jul 2024 21:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZBKx2m7Q"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5538013B5B6;
	Mon, 15 Jul 2024 21:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721077942; cv=none; b=rNBlwA/N0DsG8gmxVyOHNQgMXZLjVGENZbaAfjJeHha8hmELYMpJPZwlxDmNmwxqwPBJxIkoi4dLOP+0XEsvVDjgc2P2lEtfPlAoZ8PR6lhOLTNIuMZFmxXo1BNPpkpOAG1WKfF2s9AgJSQELJiq024/IjztSpnYHqRn/NpUYfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721077942; c=relaxed/simple;
	bh=zyGFrn/K6g9HJ0UNtwo4DiISe8PYQj+w1yIz1L/7LwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPFJwaRH9Ft9dbIWx3r8pRZOW4TqfyAvFAx1PTuPYIx9LHMgULvLW/YudptZlWeD4zPwPDulBXm0Ac0khR5GBqU50mwO0WCnM39/4IkwSY5nzo1Ntsf03ouAbFzOyjrDSacNmj5b1EX5NVFvCJdwALZLQrOr0NdYL0mXW8b2bq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZBKx2m7Q; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27A70FF803;
	Mon, 15 Jul 2024 21:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721077937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PrFsaEY3YFVMERSSxHwPf6/7rkdQhgSWQ843FPXb6VM=;
	b=ZBKx2m7QZN1wibY9E26Du5teUQrGS6KveFuXrHhyhD5Pq/PNKteH13nR6Vm6Zyc0jFXUi1
	Ac/u8zVk8E7U0h25euNwSPZKva97q6TrnO/87Wp5bxLf1xYuzdNyrvr33Sfrxc0Ua6jInH
	0W49CA1vq/OeH7PRcgK9U9asubq8oTaq/4naZR/Wk1px6FIZpF+NgESEjCkXjoNeYNlWnA
	ZsnAZMEVSk0dOo3YTq2qDPWrzaI9vXy0nS+2JAZUzUscTH8ZbXJ9HBC6ZK84xi+WoHHqxt
	WQb4Lc2807kqw4QBnUD8jcD2x2VL2jBI/SPYMaC4kDA495T6XqUeuoxI4nsTmA==
Date: Mon, 15 Jul 2024 23:12:16 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Valentin Caron <valentin.caron@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Amelie Delaunay <amelie.delaunay@foss.st.com>
Subject: Re: [PATCH 0/4] rtc: stm32: add pinctrl interface to handle RTC outs
Message-ID: <2024071521121650db391a@mail.local>
References: <20240711140843.3201530-1-valentin.caron@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711140843.3201530-1-valentin.caron@foss.st.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

On 11/07/2024 16:08:39+0200, Valentin Caron wrote:
> This series adds a pinctrl/pinmux interface to control STM32 RTC outputs.
> 
> Theses two signals output are possible:
>  - LSCO (Low Speed Clock Output) that allow to output LSE clock on a pin.
>    On STM32MPU Discovery boards, this feature is used to generate a clock
>    to Wifi/Bluetooth module.
>  - Alarm out that allow to send a pulse on a pin when alarm A of the RTC
>    expires.
> 
> First attempt [1] was based on 'st,' vendor properties, this one is based
> on pinctrl and pinmux framework.
> 
> As device-trees will be upstreamed separately, here is an example:
> 
> stm32-pinctrl {
>     rtc_rsvd_pins_a: rtc-rsvd-0 {
>         pins {
>             pinmux = <STM32_PINMUX('B', 2, AF1)>, /* OUT2 */
>                      <STM32_PINMUX('I', 8, ANALOG)>; /* OUT2_RMP */
>         };
>     };
> };
> 
> stm32-rtc {
>     pinctrl-0 = <&rtc_rsvd_pins_a &rtc_alarma_pins_a>;
> 
>     /* Enable by foo-device */
>     rtc_lsco_pins_a: rtc-lsco-0 {
>         pins = "out2_rmp";
>         function = "lsco";
>     };
> 
>     /* Enable by stm32-rtc hog */
>     rtc_alarma_pins_a: rtc-alarma-0 {
>         pins = "out2";
>         function = "alarm-a";
>     };
> };
> 
> foo-device {
>     pinctrl-0 = <&rtc_lsco_pins_a>;
> };
> 

This all seems good to me, I let you fix the various issues that have
been reported. I was just wondering whether the LSCO clock was registered
early enough to be used but I guess you tested that.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

