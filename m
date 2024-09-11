Return-Path: <linux-rtc+bounces-1945-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F62975D3C
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 00:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E2EE285740
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 22:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA1E155CAC;
	Wed, 11 Sep 2024 22:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hYEzcXuE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E81149DE3;
	Wed, 11 Sep 2024 22:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726093836; cv=none; b=CppBV2CAgwxSGsTfZkCeBA1E6ZFXUA8caNU34RJ22+Z2jpGQXIsWeFW6T0SBm1bjeEy5t3LunQcZ/flb3W2A8lkZ/nJ0+LptEXcvQZUF2AnYzHJ6f6CXcHmxGTCpm231BVMQGhH6mbTzV81bQNCO1j3DugFIjTJ7xnfJgugYm+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726093836; c=relaxed/simple;
	bh=16DAmtyXluiww3znXH0E4bF/DRcQegZFZDhG+/3GEh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1ggaCj9QNLij2eFOspPtvUu0Dx49c8Z97p38b5XEMJWeKGg/Lz3cQkws779W//XHEWcVY7jbXM5BEfRqbLFq8aUJweB3IpzradY1vGzlbrlH7yNGXRzL+aNf436CQUK0KhNLi3/2+zhzPruytuv1JTaJ+o8aBFoIz+rdd2GY5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hYEzcXuE; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE15F1BF203;
	Wed, 11 Sep 2024 22:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726093832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IX+3w90XDz+AnwsDUYP4XKgqT68dgajpBkw88bJjKxw=;
	b=hYEzcXuERfqWACfLZRzFCy13Cpy9Tk9ervIACpH6+4OLJPPx53v8R+yU422L6bJgpJbhzW
	7re/awyKPC4ghDOjMRAQkWAECusuX48GN1GKAbk0OqcLykjGcI0N5weo3YxxAqI17rXdx3
	UARoCeK0RIyjPDUeVZgXLS2x9Wy0ABb66Ya8+vsxuMw2j4zpXoOadFQFSveKDHMGAoM+47
	/gN0jzZ+oYFECbYr0xAfX40dus3rjRcZwlVwC+HJzDXspKeTf3n/j86rgkEWelo5kOqKdt
	Yh9nVx1ukDSc8LwBw0M3FSSk0/yyRGoSfDCkxfufetANbbHoqTIF700XBARDuQ==
Date: Thu, 12 Sep 2024 00:30:29 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Johan Hovold <johan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org
Subject: Re: [PATCH] rtc: at91sam9: fix OF node leak in probe() error path
Message-ID: <172609381395.1549758.8649440335633838885.b4-ty@bootlin.com>
References: <20240825183103.102904-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240825183103.102904-1-krzysztof.kozlowski@linaro.org>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Sun, 25 Aug 2024 20:31:03 +0200, Krzysztof Kozlowski wrote:
> Driver is leaking an OF node reference obtained from
> of_parse_phandle_with_fixed_args().
> 
> 

Applied, thanks!

[1/1] rtc: at91sam9: fix OF node leak in probe() error path
      https://git.kernel.org/abelloni/c/988d7f3571e8

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

