Return-Path: <linux-rtc+bounces-3198-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB0DA351E4
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Feb 2025 00:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C5ED3ACE0A
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 23:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01FC9270EBF;
	Thu, 13 Feb 2025 23:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Az83w22h"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C7226E14F;
	Thu, 13 Feb 2025 23:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739487624; cv=none; b=mPJ8pWs0fP7dleN1odcsRhyIX63oY3kN5QNuyhb7axSJBpRYEgQYe0HO0yurgpi7Fki6J1yDT3Qtl1MppSZPQF74qQeq1KC/qh1ZJfOtp+pKzbjpPn/7vTYDvHdJE8f6KfDCfNwDOOH0mGVcYLuuGSMZ24mci7MWLU5WyLjoc0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739487624; c=relaxed/simple;
	bh=qSew3Ilv6r0V80osYWxsPxiGy+drA6ufbjQbXlIjsNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ii/+XEq9P72iRCmOK3sPqWyss+sBG8sJXrRHJauyi1pfcV1OccIkgT8DUYX3UTZSYZn7GgbgIPX1tuwVAJ5yUPtxJ3eNJIgqN9SuSliwsim0z2275Zp8oZs+EEdL1wxQGbZ1TZqxIFLOJRiSctcByh7GoW6hg9twBcbozILYzM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Az83w22h; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC5C31F764;
	Thu, 13 Feb 2025 23:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739487619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SMbFIP0hXOQDBlKRcsdm79YcouV95TghdG4+3UcuP1c=;
	b=Az83w22hwSpu+jWDQlxwg7RHVZLeWBu7AS+PA2fadSCbJgw5KY1KWHpslgnWrP3HiRoHPk
	CXU4GNZsewKrTXhfECA8omUnixYr60bQeUenYOPaSFb6J1Bl6xWZ1/OimRRASoDH7L7tYM
	JdHiywvV3RA6u9VU+JBT2wmVkxKFv6BFf/a/QRsVyHhnWZ37plwSkmivSr9ls6oKrh+752
	E/qXCvZ7cVTWgLlg0zJkjFbQyvyX6/hqf88zl3xAzmSxyjrlzklGfooGx1aQbFn3U8ek1c
	JPkRNRPlQNTCUYBBCdJs0ZV3g5bcUHsENTFbq53dh7cSjQ5qePTt+cjczuhQow==
Date: Fri, 14 Feb 2025 00:00:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org, Inochi Amaoto <inochiama@gmail.com>,
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, unicorn_wang@outlook.com,
	inochiama@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, dlan@gentoo.org,
	linux-kernel@vger.kernel.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v11 3/3] rtc: sophgo: cv18xx: Add restart handler
Message-ID: <20250213230017eaa89034@mail.local>
References: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
 <20250213215655.2311793-4-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213215655.2311793-4-alexander.sverdlin@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegkedtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopegrlhgvgigrnhguvghrrdhsvhgvrhgulhhinhesghhmrghilhdrtghomhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehinhhotghhihgrmhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhiodgutheslhhinhgrrhhordhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On 13/02/2025 22:56:47+0100, Alexander Sverdlin wrote:
> Currently provided ATF firmware for ARM64 Sophgo SoCs is binary-only.
> To make Linux independent from this binary firmware, provide restart
> handler triggering COLD or WARM reboot directly via RTC HW block as
> alternative to PSCI interface.
> 
> Handler priority SYS_OFF_PRIO_DEFAULT of 0 is desired, because if PSCI
> is indeed present, its priority of 129 will override the new one. On RiskV
> side the behaviour is unchanged as well because SBI SRST handler has higher
> priority as well (192).
> 
> Tested on SG2000 in ARM64 mode.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> v11:
> - patch introduced;
> 
>  drivers/rtc/rtc-cv1800.c | 51 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-cv1800.c b/drivers/rtc/rtc-cv1800.c
> index 5c30f7388983..586d7195f1f4 100644
> --- a/drivers/rtc/rtc-cv1800.c
> +++ b/drivers/rtc/rtc-cv1800.c
> @@ -9,17 +9,23 @@
>  #include <linux/irq.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/notifier.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/rtc.h>
>  
> +#define CTRL_UNLOCKKEY         0x0004
> +#define CTRL0                  0x0008
>  #define SEC_PULSE_GEN          0x1004
>  #define ALARM_TIME             0x1008
>  #define ALARM_ENABLE           0x100C
>  #define SET_SEC_CNTR_VAL       0x1010
>  #define SET_SEC_CNTR_TRIG      0x1014
>  #define SEC_CNTR_VAL           0x1018
> +#define EN_PWR_CYC_REQ         0x10C8
> +#define EN_WARM_RST_REQ        0x10CC
>  
>  /*
>   * When in VDDBKUP domain, this MACRO register
> @@ -28,6 +34,10 @@
>  #define MACRO_RO_T             0x14A8
>  #define MACRO_RG_SET_T         0x1498
>  
> +/* CTRL0 bits */
> +#define REQ_PWR_CYC            BIT(3)
> +#define REQ_WARM_RST           BIT(4)
> +
>  #define ALARM_ENABLE_MASK      BIT(0)
>  #define SEL_SEC_PULSE          BIT(31)
>  
> @@ -160,6 +170,29 @@ static const struct rtc_class_ops cv1800_rtc_ops = {
>  	.alarm_irq_enable = cv1800_rtc_alarm_irq_enable,
>  };
>  
> +static int cv1800_restart_handler(struct sys_off_data *data)
> +{
> +	struct cv1800_rtc_priv *info = data->cb_data;
> +	u32 reg_en = EN_WARM_RST_REQ;
> +	u32 request = 0xFFFF0800;
> +
> +	if (data->mode == REBOOT_COLD) {
> +		reg_en = EN_PWR_CYC_REQ;
> +		request |= REQ_PWR_CYC;
> +	} else {
> +		request |= REQ_WARM_RST;
> +	}
> +
> +	/* Enable reset request */
> +	regmap_write(info->rtc_map, reg_en, 1);
> +	/* Enable CTRL0 register access */
> +	regmap_write(info->rtc_map, CTRL_UNLOCKKEY, 0xAB18);
> +	/* Request reset */
> +	regmap_write(info->rtc_map, CTRL0, request);
> +
> +	return NOTIFY_DONE;
> +}
> +
>  static int cv1800_rtc_probe(struct platform_device *pdev)
>  {
>  	struct cv1800_rtc_priv *rtc;
> @@ -205,7 +238,23 @@ static int cv1800_rtc_probe(struct platform_device *pdev)
>  		return dev_err_probe(&pdev->dev, ret,
>  				     "cannot register interrupt handler\n");
>  
> -	return devm_rtc_register_device(rtc->rtc_dev);
> +	ret = devm_rtc_register_device(rtc->rtc_dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "cannot register RTC\n");

This message is useless, there is no failure path without a message in
devm_rtc_register_device.

> +
> +	/*
> +	 * SYS_OFF_PRIO_DEFAULT of 0 is desired here because both RiscV SBI SRST
> +	 * (prio 192) and ARM PSCI (prio 129) will override this one; this
> +	 * handler shall serve as a fallback in cases where firmware is not
> +	 * present.
> +	 */
> +	ret = devm_register_restart_handler(&pdev->dev, cv1800_restart_handler,
> +					    rtc);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "cannot register restart handler\n");


Probe must never fail after devm_rtc_register_device.

> +
> +	return 0;
>  }
>  
>  static const struct of_device_id cv1800_dt_ids[] = {
> -- 
> 2.48.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

