Return-Path: <linux-rtc+bounces-4200-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C90D8AC82FA
	for <lists+linux-rtc@lfdr.de>; Thu, 29 May 2025 22:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D754F7A4BE0
	for <lists+linux-rtc@lfdr.de>; Thu, 29 May 2025 20:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADDF0231838;
	Thu, 29 May 2025 20:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="GWCMbljt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E96C1DF25A
	for <linux-rtc@vger.kernel.org>; Thu, 29 May 2025 20:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748549303; cv=none; b=d0jukRpdjSj8+C+ZbaZTfKRjwLT0BmwBSarpdYVHns6BxhNqkemoCFaPIoh8lyL3hBRcvfKU4D6AgshcEbFGjZY+1sChlnHlSc5xQOJMVZWB0xIJeCWzTecBESmOzmy6+bBbZ3mWVWjs4XfRXpStuluLqNURqG4hNE0HComSAf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748549303; c=relaxed/simple;
	bh=CXNAYLSwaOiqbWkKREgXTKeSv8KXzgK/5/KOmyqpvxQ=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=lWygpO6rTan8z1dEjkvJKUAE9TbAzmlJZgEE9kA350k859Msz0i4wv0qMUf5qcUWQGHIVVdeZ5p3o2WVFDWCZYNDkXCSFF2lEsmOAOoSkza7+FA1wa1DsHSlYfTWoId5+ytaphTbA8jf+9l9tFZ1QtENwCAab9uaecKsA5m+67g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=GWCMbljt; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=VUziaQ7e7K7bTIDaUvEuGRwY4sbFx2FNqWIXbGlHcLI=; b=GWCMbljtBGEupU8oC+EJdxhqwy
	t1kxXKTZKnWw9rMqFACdg0n2edQs1l33z34ZAZ8kV0w+Es2i0GCp2jvB1Tl9DzfEkxoJFW3JcOMfk
	s5GhPImbUbfHuWTINnmcgpjQfunTE6zpWJ3oqf9J2evhc87jGY31KW8pDt4e5kzD2yO8=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:50710 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1uKjXu-0004Ll-Uv; Thu, 29 May 2025 16:08:11 -0400
Date: Thu, 29 May 2025 16:08:10 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Elena Popa <elena.popa@nxp.com>
Cc: <alexandre.belloni@bootlin.com>, <hvilleneuve@dimonoff.com>,
 <r.cerrato@til-technologies.fr>, <linux-rtc@vger.kernel.org>
Message-Id: <20250529160810.140a9ddc6a48be5f8c6249bb@hugovil.com>
In-Reply-To: <20250529075326.612550-1-elena.popa@nxp.com>
References: <20250529075326.612550-1-elena.popa@nxp.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -2.8 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH] rtc: pcf2127: fix command byte for PCF2131
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

Hi Elena,
please specify SPI in your commit message to reduce confusion and
identify that it is only relevant when using SPI:

-> "...fix SPI command ..."


On Thu, 29 May 2025 10:53:26 +0300
Elena Popa <elena.popa@nxp.com> wrote:

> PCF2131 was not responding to read/write operations. PCF2131 has a
> different command byte definition, compared to PCF2127/29. Added the new
> command byte definition when PCF2131 is detected.
> 
> Signed-off-by: Elena Popa <elena.popa@nxp.com>
> ---
>  drivers/rtc/rtc-pcf2127.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 31c7dca8f469..2c7917bc2a31 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -1538,6 +1538,11 @@ static int pcf2127_spi_probe(struct spi_device *spi)
>  		variant = &pcf21xx_cfg[type];
>  	}
>  
> +	if (variant->type == PCF2131) {
> +		config.read_flag_mask = 0x0;
> +		config.write_flag_mask = 0x0;
> +	}
> +

With the above commit message changed:

Acked-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>


>  	config.max_register = variant->max_register,
>  
>  	regmap = devm_regmap_init_spi(spi, &config);
> -- 
> 2.34.1
> 

