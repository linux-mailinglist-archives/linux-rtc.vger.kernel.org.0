Return-Path: <linux-rtc+bounces-5618-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECCBCDDF0A
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Dec 2025 17:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FD69300C0E7
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Dec 2025 16:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65DB2517AC;
	Thu, 25 Dec 2025 16:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="x7BL1eqg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327BA202F71
	for <linux-rtc@vger.kernel.org>; Thu, 25 Dec 2025 16:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766681626; cv=none; b=GUr47DI3tVqTemqKHuyrc3IfODFWxrogkZG9yxeTS5b3b1yFmaz5V8noRm7SI7ogXFrcgTkqDmwFb3SdS7Zua/VaVRZ6kpt+WooQJU9//JzzsbZ52rXrRHheRWeBAxshB5V48RdgP2QSvOngVgMtMqG/1Gjy82fe1pkgay4gR6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766681626; c=relaxed/simple;
	bh=Dyk5KusdMTkoFl1JN6tSgFzsvFGqborzl0/Qs7d6tno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6jj/wmM8zyxKC9EWpkIupLWKWmwPnojhVk9WnhMZw+E1OSQd29iN25FphOFryTuRJblX9ggcF7hXJ1a264rqjZW7ElqGCtGslJW/tdyrsivnO8IfU0HvPDE2BAuUfgCNqwOfeHSTAi+oleEtdXD14ETIzezqjgPJH676qXtyV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=x7BL1eqg; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 95B661A2420;
	Thu, 25 Dec 2025 16:53:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5443E60742;
	Thu, 25 Dec 2025 16:53:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 970C7103C8CAF;
	Thu, 25 Dec 2025 17:53:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766681621; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=afdzq0G7wsigzO6RVOGJk2hczbqsJTxZQZ9HcD5yI2M=;
	b=x7BL1eqg+0xLhEmZMN3OS+aGPrn9OBS2gfRbN5PCEBw08tiIZnLhj29tFwQgLxdaL2i496
	AAgEa5BCZXdkEWMDD0A9DzNC6LYehVAjShKwa+HCuqKpbslkANFusCvJK0viyVHLmvxzFw
	jCp4NUnx10MWMoVuYz++hV7A74cgQBRLcQw1Bzp9QjWYzWwG7ccpANpG3Vse5PJc0WQHnT
	/hrJwEepy7h+JoWFgKbib0KW1PYIn1ZQIwjU9gz+uzDYxqmxavGTq4iP2H6yzdQQJ4ixHo
	V6bpKGhvfYHw8jXucie4hRQ596QJfvFTyGI3IWsN5YSQUEwFl4GjZDdkfQBwdg==
Date: Thu, 25 Dec 2025 17:53:36 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4 3/3] rtc: spacemit: default module when
 MFD_SPACEMIT_P1 is enabled
Message-ID: <202512251653368b33c7e7@mail.local>
References: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
 <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
X-Last-TLS-Session-Version: TLSv1.3

On 25/12/2025 15:46:33+0800, Troy Mitchell wrote:
> The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
> caused it to be built-in automatically whenever the PMIC support was
> set to y.
> 
> This is not always desirable, as the RTC function is not required on
> all platforms using the SpacemiT P1 PMIC.

But then, can't people simply change the config? I don't feel like
this is an improvement.

> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/rtc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 50dc779f7f983074df7882200c90f0df21d142f2..53866493e9bbaf35ff0de85cbfe43e8343eadc1e 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -410,7 +410,7 @@ config RTC_DRV_SPACEMIT_P1
>  	tristate "SpacemiT P1 RTC"
>  	depends on ARCH_SPACEMIT || COMPILE_TEST
>  	depends on MFD_SPACEMIT_P1
> -	default MFD_SPACEMIT_P1
> +	default m if MFD_SPACEMIT_P1
>  	help
>  	  Enable support for the RTC function in the SpacemiT P1 PMIC.
>  	  This driver can also be built as a module, which will be called
> 
> -- 
> 2.52.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

