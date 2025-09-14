Return-Path: <linux-rtc+bounces-4891-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B3FB56AA3
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Sep 2025 18:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B6EC74E01ED
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Sep 2025 16:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDF92D5C92;
	Sun, 14 Sep 2025 16:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Hn+TQJVM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F84169AD2;
	Sun, 14 Sep 2025 16:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757867721; cv=none; b=X4EhFp2HNhf5B2Pr84RixwlGULth3qgYd3bbOOlbLJMpOo0MkTfS7ksTtl5fdmk9M12EY8na8es72IU1JYQyUn/786BRm2lEahLkkI0EXp/UMuJ5Zn/Cnt2yWFiDqJxA9c6sC7z/yw0b+v6C9jln2tvlhuQrYOoeUAA2iycwQzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757867721; c=relaxed/simple;
	bh=d/DksVt1jOUUNg1guB1c26u/tAnFGmp64Nkbi1kNFUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tIjSn0RsPzemtXLjBrpPGVrCZIFBzGHX0rqUAS3JZYrmukYOWPPkyNwmPNGf0vuADwOwArWW65MRa3dMbkTEbp6LnSjOyHuMKkrgkVZNyUJm246OQkjJHMtQqRCIeBQRm1LmHg4s0fyLP9B8VmZAmf+VQS2HDa9U1s7vsuE0FDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Hn+TQJVM; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 723BF1A0DE4;
	Sun, 14 Sep 2025 16:35:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 452446063F;
	Sun, 14 Sep 2025 16:35:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2DC5102F29EC;
	Sun, 14 Sep 2025 18:35:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757867707; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=vXWzLeRrS8rJvdtCJ4XG5FPGmNASV270FtQzQBagios=;
	b=Hn+TQJVM/yb935GC19LuIgIYljMxAJmsmLz7UaedBGkBq/dhvPV2kQcBfy3bsc+VYXcPvq
	4XUFb6o+qmnPzfVk378L06lKM+0Hwh+WAzIpJHjswaV58/hO9T1QUoRI0PMih9eIsarw1E
	RWXDHDGZUvfBkPlD5M1A57aL01icQ+8Oi/dPRiq0n7sQvMJnCQi029NnobOzpevUcLjmIS
	5bxND2CPJVCPzKcaZU/42UyHVvpvIGDjW85vIXyx9QxPCKQBdBBu50iWY8OOIh6k6oflLB
	WT/l5aXKGv2IA0teOtyOhhBPaCsU/F2mgRhdhGXJrWwvcUFzxk9AWq+G8dMZXg==
Date: Sun, 14 Sep 2025 18:35:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 6/7] rtc: s5m: add support for S2MPS16 RTC
Message-ID: <2025091416350055a27358@mail.local>
References: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914124227.2619925-7-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914124227.2619925-7-ivo.ivanov.ivanov1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On 14/09/2025 15:42:26+0300, Ivaylo Ivanov wrote:
> Add support for Samsung's S2MPS16 PMIC RTC, which has pretty much
> identical functionality to the existing S2MPS15 support, with the
> difference being the ST2 register.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/rtc/rtc-s5m.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
> index a7220b4d0..910248731 100644
> --- a/drivers/rtc/rtc-s5m.c
> +++ b/drivers/rtc/rtc-s5m.c
> @@ -18,6 +18,7 @@
>  #include <linux/mfd/samsung/irq.h>
>  #include <linux/mfd/samsung/rtc.h>
>  #include <linux/mfd/samsung/s2mps14.h>
> +#include <linux/mfd/samsung/s2mps16.h>
>  
>  /*
>   * Maximum number of retries for checking changes in UDR field
> @@ -254,6 +255,11 @@ static int s5m_check_pending_alarm_interrupt(struct s5m_rtc_info *info,
>  		ret = regmap_read(info->regmap, S5M_RTC_STATUS, &val);
>  		val &= S5M_ALARM0_STATUS;
>  		break;
> +	case S2MPS16X:
> +		ret = regmap_read(info->s5m87xx->regmap_pmic, S2MPS16_REG_ST2,
> +				  &val);
> +		val &= S2MPS_ALARM0_STATUS;
> +		break;
>  	case S2MPG10:
>  	case S2MPS15X:
>  	case S2MPS14X:
> @@ -303,6 +309,7 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
>  		udr_mask |= S5M_RTC_TIME_EN_MASK;
>  		break;
>  	case S2MPG10:
> +	case S2MPS16X:
>  	case S2MPS15X:
>  	case S2MPS14X:
>  	case S2MPS13X:
> @@ -354,6 +361,7 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  	switch (info->device_type) {
>  	case S5M8767X:
>  	case S2MPG10:
> +	case S2MPS16X:
>  	case S2MPS15X:
>  	case S2MPS14X:
>  	case S2MPS13X:
> @@ -378,6 +386,7 @@ static int s5m_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	switch (info->device_type) {
>  	case S5M8767X:
>  	case S2MPG10:
> +	case S2MPS16X:
>  	case S2MPS15X:
>  	case S2MPS14X:
>  	case S2MPS13X:
> @@ -416,6 +425,7 @@ static int s5m_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>  	switch (info->device_type) {
>  	case S5M8767X:
>  	case S2MPG10:
> +	case S2MPS16X:
>  	case S2MPS15X:
>  	case S2MPS14X:
>  	case S2MPS13X:
> @@ -455,6 +465,7 @@ static int s5m_rtc_stop_alarm(struct s5m_rtc_info *info)
>  	switch (info->device_type) {
>  	case S5M8767X:
>  	case S2MPG10:
> +	case S2MPS16X:
>  	case S2MPS15X:
>  	case S2MPS14X:
>  	case S2MPS13X:
> @@ -494,6 +505,7 @@ static int s5m_rtc_start_alarm(struct s5m_rtc_info *info)
>  	switch (info->device_type) {
>  	case S5M8767X:
>  	case S2MPG10:
> +	case S2MPS16X:
>  	case S2MPS15X:
>  	case S2MPS14X:
>  	case S2MPS13X:
> @@ -532,6 +544,7 @@ static int s5m_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>  	switch (info->device_type) {
>  	case S5M8767X:
>  	case S2MPG10:
> +	case S2MPS16X:
>  	case S2MPS15X:
>  	case S2MPS14X:
>  	case S2MPS13X:
> @@ -613,6 +626,7 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
>  		break;
>  
>  	case S2MPG10:
> +	case S2MPS16X:
>  	case S2MPS15X:
>  	case S2MPS14X:
>  	case S2MPS13X:
> @@ -680,6 +694,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
>  		struct i2c_client *i2c;
>  
>  		switch (device_type) {
> +		case S2MPS16X:
>  		case S2MPS15X:
>  			regmap_cfg = &s2mps14_rtc_regmap_config;
>  			info->regs = &s2mps15_rtc_regs;
> @@ -817,6 +832,7 @@ static const struct platform_device_id s5m_rtc_id[] = {
>  	{ "s2mps13-rtc",	S2MPS13X },
>  	{ "s2mps14-rtc",	S2MPS14X },
>  	{ "s2mps15-rtc",	S2MPS15X },
> +	{ "s2mps16-rtc",	S2MPS16X },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(platform, s5m_rtc_id);
> -- 
> 2.43.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

