Return-Path: <linux-rtc+bounces-2478-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABE89C34EA
	for <lists+linux-rtc@lfdr.de>; Sun, 10 Nov 2024 23:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B4812816D2
	for <lists+linux-rtc@lfdr.de>; Sun, 10 Nov 2024 22:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459D0156F55;
	Sun, 10 Nov 2024 22:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Rns4DMup"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7451C28E;
	Sun, 10 Nov 2024 22:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731276213; cv=none; b=qqkvVbFpWxhM9blFq/Oq++uDaneagLHBhtcWDfAwUxoJngTmjGMuCQyT0hbh79S7u6K+y4RJCbaUAGP5GxQOkke3x+8pGgxHK4WgYxhsJOb8SoEK7RK8FgRldznNBM91eeK1yYBCCyG5fgdIC01KN5XJy6SwOrH3LMvlIF3Q/Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731276213; c=relaxed/simple;
	bh=pqRqI2jmd4AdLey0jMIMasD26E9RLTsTefIdt/wcjcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sztv+PjMvrOLmiYjai+x21UfeIEJSRmdvTGdqyZN7i3VeOd6fE0tGVU6qD2hblgNh5Hl1JW0tAE8Kt664XA0WHyAnO2kEkDDDEiDt74ez5IczyoLnquFzcxlk1kF4hVZOKuO8J8ncJPZQibqeUn5poYZhIF+Rs4t+Truyv0YOVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Rns4DMup; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A4CD1BF203;
	Sun, 10 Nov 2024 22:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731276202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tWhowCiinxkZBttCctlBPj85PTRboz8ciP7T5QcNJGg=;
	b=Rns4DMup/Zg21qWpZWnrWdvk/k/iS1yuTfyx8O6WuFMftNitR70TSv0nRHj6tNs1fFFWhC
	/sGF/1oGoxN3wpuaLDfgF09JP2jVeGZdEsNzQe3rzGi1EMtUFKLfEHNRWhPREMmRLhllnB
	d/dZEML6MBGCgf5AIL6xnW6vsMuKZ98vunLD/YqDn2Xlve649nLQckxAR1TblmaC4ELHf9
	/d518Q8nYmR26zqqe+PGcjD0u75eiQl88Wve8BytkaQqEbtDUx4VwFqiHsYNjZTJegizlo
	LnyPdwLYtEhbgLSRNwiYqHu4x1tbc/0hx0l9KunlyhNHr5JwtfCCR4rdAlw/AA==
Date: Sun, 10 Nov 2024 23:03:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	magnus.damm@gmail.com, p.zabel@pengutronix.de,
	Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: (subset) [PATCH v6 4/9] rtc: renesas-rtca3: Fix compilation
 error on RISC-V
Message-ID: <173127618341.3020900.11768591767157204558.b4-ty@bootlin.com>
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
 <20241101095720.2247815-5-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101095720.2247815-5-claudiu.beznea.uj@bp.renesas.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Fri, 01 Nov 2024 11:57:15 +0200, Claudiu wrote:
> Fix the following compilation errors when building the RTCA3 for RISCV:
> 
> ../drivers/rtc/rtc-renesas-rtca3.c:270:23: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   270 |         tm->tm_sec = bcd2bin(FIELD_GET(RTCA3_RSECCNT_SEC, sec));
>       |                              ^
> ../drivers/rtc/rtc-renesas-rtca3.c:369:23: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   369 |         tm->tm_sec = bcd2bin(FIELD_GET(RTCA3_RSECAR_SEC, sec));
>       |                              ^
> ../drivers/rtc/rtc-renesas-rtca3.c:476:11: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   476 |         cycles = FIELD_GET(RTCA3_RADJ_ADJ, radj);
>       |                  ^
> ../drivers/rtc/rtc-renesas-rtca3.c:523:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   523 |         radj = FIELD_PREP(RTCA3_RADJ_ADJ, abs(cycles));
>       |                ^
> ../drivers/rtc/rtc-renesas-rtca3.c:658:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   658 |         val = FIELD_PREP(RTCA3_RCR1_PES, RTCA3_RCR1_PES_1_64_SEC);
>       |               ^
> 
> [...]

Applied, thanks!

[4/9] rtc: renesas-rtca3: Fix compilation error on RISC-V
      https://git.kernel.org/abelloni/c/8f315a5c7376

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

