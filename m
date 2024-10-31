Return-Path: <linux-rtc+bounces-2407-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B239B86E3
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 00:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A58B282836
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 23:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B0D1DFD81;
	Thu, 31 Oct 2024 23:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bn2fG+8+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41CC1CC8B7;
	Thu, 31 Oct 2024 23:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730416658; cv=none; b=DR/A2L1EedYNlL/eei+LkJuN/ifjJuLnbgphEvyfuikPuO13BI8/VOXK7dqxZlK2rgMqWFAWam0o9O5CIp0gwQyJLp/ytRhhfnsIM4kBMuqEhJ6y3FJs/s8dDzz4JGoMP3LL653XirTiIJYLRbGLv9uzGBoNPKwa/WndlMr1diI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730416658; c=relaxed/simple;
	bh=guKQZ269YoJkWNOHN8n+zpW1sLw/rcZPJRVDIFG7ssQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcRUiFMJJrI9Onyh7j/raIVjbloR6cdzrFBSwhFT34ri8UarMq1XOSP45o9BuMjh9HlXPdH/iH5FyJ6f5QGCBD5ouBYb3eNbFIOKEtPQ0v3ykaMKgtX8HH8QED3sZXVYemQ2B+4LvYMhNebuuNgSVm6mgLF6fNFaaSdAp/b0eXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bn2fG+8+; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 038AE20002;
	Thu, 31 Oct 2024 23:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730416650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q2N3NKmH49hjRiqnrVgcxvKSV4bVv8lUQzTG26S2d3Y=;
	b=bn2fG+8+pXP2OIG5T46ZntHVHumfx4xU2hVMnhQuJ0sX3uPBQlHbiUl8Tr+WHUjbwvYqPP
	sx+mKsfBDuoCjVzFeyumLm7B+ttWP5/ZzPeTO9f1D3KWdkJ1RehsIGLwytozpfoGFnZZ8j
	atWicNRrYbfkVY+jje2eoTo3oSby7g4dOgJnU6LBHvhPIm5awdpcj0Gl9c4erLIIj4VrK1
	gQMvCk0NZ3DZ4+aE98JcxX5+5ws5Pju+ox4zxRNI62UNW/chM/4iKZPCBV+rjfO3M5UVAd
	4qaWLxpxrLJY/c+Cx95/wPVuJbFtPjnCbrlpcCJwCS1k05muZTYVjEiST3utQg==
Date: Fri, 1 Nov 2024 00:17:28 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	magnus.damm@gmail.com, p.zabel@pengutronix.de,
	Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: (subset) [PATCH v5 00/10] Add RTC support for the Renesas RZ/G3S
 SoC
Message-ID: <173041660392.2394403.11154347678487291985.b4-ty@bootlin.com>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Wed, 30 Oct 2024 13:01:10 +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> On the Renesas RZ/G3S SoC the RTC clock is provided by the VBATTB
> IP. A 32 KHz crystall oscillator could be connected to the VBATTB
> input pins. The logic to control this clock (and pass it to RTC)
> is inside the VBATTB IP. For this, the clk-vbattb driver was added
> (patches 01-03/12).
> 
> [...]

Applied, thanks!

[04/10] dt-bindings: rtc: renesas,rzg3s-rtc: Document the Renesas RTCA-3 IP
        https://git.kernel.org/abelloni/c/71c61a45c951
[05/10] rtc: renesas-rtca3: Add driver for RTCA-3 available on Renesas RZ/G3S SoC
        https://git.kernel.org/abelloni/c/d4488377609e

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

