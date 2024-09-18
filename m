Return-Path: <linux-rtc+bounces-2022-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B5797B996
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Sep 2024 10:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B59C51F27A72
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Sep 2024 08:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F2C176ACA;
	Wed, 18 Sep 2024 08:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NfXmsEDL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D1E1714AE;
	Wed, 18 Sep 2024 08:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726649378; cv=none; b=V3A1FkCzdYQBQs4RmpxMq/1Jk1F5ygU3g2N7G3eVVnn+haqd6JngSbItijfc7uSbjNZDCwnGNik4glCl+8bJdaie9ouRUCJsbtOuczH6dRWLE3gtV5z/Jm5lJtNyVyh6Pl/dqwO28cc2u4GGJkKQRYHI5zcK0HgzX2JtEv2kZZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726649378; c=relaxed/simple;
	bh=ceNiEzHbo+qZUaAGkn1Evpwy7WKZHm2h+Cn0CtLJL+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpedbQUe51FMsiJ587vX8AMck5LZE0x7ZiYRyhzaS7nbRP5uFgkqWaMJnGTJLtb66HYcCol+uYV+g4eRa8AMboYAxld/uuqGC5TTlK6plhpBJ5ncTsyLvBjwh2OFoxxDEisTSmHvN3SU3SrFkF4zPEF9Y4mHLP7t1nXEg8Gjokc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NfXmsEDL; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE13E60006;
	Wed, 18 Sep 2024 08:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726649367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N7PSUp9F0oicxLKbSiglCWIy2JAE0zQFupsKW0WeIOI=;
	b=NfXmsEDLfH59Fde0cGBF/U+AlUovywqvIfUMbtIRp1h5wMpDF82iTBVKKVxlO+JrpZtpyx
	CWYeIOQ7XUIw4iAt5+pE3cfM/r2rUcbb5VEihJ+yqL8ObZhUxPoiJ1CnBNXrk40C2Sanyo
	GdXCeYsA8/we755vWK3TxoM4mF0pz5GRag8AvT6wPZGSAw76rJ74kPz283biXIlEOVZe8Q
	dwoD0UWFC3EmGKfvCT8k7liYrO0IjowrZK+R/A+5zEd3bRsivr4mFJ06y1iQEjdhFzLlqG
	PXYXEQh8NrQysrBNiHslLk9HHdO2YCO57hyyyrVJR/zJ4DUXi9UawAwtfO7JBQ==
Date: Wed, 18 Sep 2024 10:49:26 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heiko@sntech.de, Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v3 3/6] dt-bindings: rtc: microcrystal,rv3028:
 add #clock-cells property
Message-ID: <172664935562.7925.8121058581671553092.b4-ty@bootlin.com>
References: <20240912142451.2952633-1-karthikeyan@linumiz.com>
 <20240912142451.2952633-4-karthikeyan@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912142451.2952633-4-karthikeyan@linumiz.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Thu, 12 Sep 2024 19:54:48 +0530, Karthikeyan Krishnasamy wrote:
> RV3028 RTC has a clock out features, the clk out can be
> controlled using clkout register, to consume the clock out
> from rv3028 '#clock-cells' property is added.
> 
> 

Applied, thanks!

[3/6] dt-bindings: rtc: microcrystal,rv3028: add #clock-cells property
      https://git.kernel.org/abelloni/c/4015580e983d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

