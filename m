Return-Path: <linux-rtc+bounces-3782-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 249B5A7BA08
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 11:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B67E6189C153
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 09:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD121ABEAC;
	Fri,  4 Apr 2025 09:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9MtoQrI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249CB16132F;
	Fri,  4 Apr 2025 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743759281; cv=none; b=Hj3lwSo+F+OGC4YJjHfw2Vf4HydczP4/aQ3WEFAbx0DKMvEEf0iZgfdZtEeGNzUTBvBYcvnF6gHTSqI/mHbO9xDUjEGXhlf6zGWqZJtmhPTDDg6qnXMH9Vb2ZW6ZrdU/Ns+23hUVvnPyp5wI5ND+yy6ukNujCJflNAgbzygYquI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743759281; c=relaxed/simple;
	bh=n0DVXYKk8hiZe5RfNnARym5BTewBVaBxsH/5mlip/ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAh+Xwk6zJFDMxyfcEwd2M8fYcV682cpZhUhK2il32imHhA1GNV6TjEAjAaF5T1cOPuR9sOpcawFpvogpdsunuRO7cTVFIV31rhq3DG1jvfKe1hGLi2KFJnFuoRSvaNnvXQhx6kpTuKrpJWVkW/b3pXNgoUvCtczOog8+aqqxhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9MtoQrI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31422C4CEE5;
	Fri,  4 Apr 2025 09:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743759280;
	bh=n0DVXYKk8hiZe5RfNnARym5BTewBVaBxsH/5mlip/ik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d9MtoQrIT/Zn9pYbxRaCfVq9RrDir4kWKIFZQM17jaDiUtXizwIwDAb0+SzveV7Oz
	 uypNUT5s6r8mDEUZEu3bb8QHKrHFF3JJFD2fTe1X/Faudp1NqluPMNjwUon/SPc7hz
	 mAp91vJyLx+ZceZCCIzr6ukASR27nslWKnfRXax1NJu5K9k+FkfYOAkoIuGQneKO8Z
	 YmdYgaQBTeqFFiaq0psUl3RF2B02Vnh8ytPVZocWkpckIm2aZ6tYTq5Kar38bnoDmg
	 XL749/d5k9frjLLDWjhCfAOTKFYMEmLkJQBegWm40iGonmHeyVW4hxSJmxF/3kScem
	 s9Wh8W2Tg5vBw==
Date: Fri, 4 Apr 2025 10:34:33 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 15/32] mfd: sec: s2dos05: doesn't support interrupts
 (it seems)
Message-ID: <20250404093433.GE43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
 <20250403-s2mpg10-v3-15-b542b3505e68@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250403-s2mpg10-v3-15-b542b3505e68@linaro.org>

Patch is fine, but the subject line should be more assertive.

Also, there is seldom any need for sub-sentences in ()'s in them.

IOW, drop the "(it seems)" part.

> The commit bf231e5febcf ("mfd: sec-core: Add support for the Samsung
> s2dos05") adding s2dos05 support didn't add anything related to IRQ
> support, so I assume this works without IRQs.
> 
> Rather than printing a warning message in sec_irq_init() due to the
> missing IRQ number, or returning an error due to a missing irq chip
> regmap, just return early explicitly.
> 
> This will become particularly important once errors from sec_irq_init()
> aren't ignored anymore in an upcoming patch and helps the reader of
> this code while reasoning about what the intention might be here.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  drivers/mfd/sec-irq.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
> index 9f0173c48b0c8186a2cdc1d2179db081ef2e09c4..79a3b33441fa5ab48b4b233eb8d89b4c20c142ed 100644
> --- a/drivers/mfd/sec-irq.c
> +++ b/drivers/mfd/sec-irq.c
> @@ -452,16 +452,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
>  	int type = sec_pmic->device_type;
>  	const struct regmap_irq_chip *sec_irq_chip;
>  
> -	if (!sec_pmic->irq) {
> -		dev_warn(sec_pmic->dev,
> -			 "No interrupt specified, no interrupts\n");
> -		return 0;
> -	}
> -
>  	switch (type) {
>  	case S5M8767X:
>  		sec_irq_chip = &s5m8767_irq_chip;
>  		break;
> +	case S2DOS05:
> +		return 0;
>  	case S2MPA01:
>  		sec_irq_chip = &s2mps14_irq_chip;
>  		break;
> @@ -492,6 +488,12 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
>  				     sec_pmic->device_type);
>  	}
>  
> +	if (!sec_pmic->irq) {
> +		dev_warn(sec_pmic->dev,
> +			 "No interrupt specified, no interrupts\n");
> +		return 0;
> +	}
> +
>  	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
>  				       sec_pmic->irq, IRQF_ONESHOT,
>  				       0, sec_irq_chip, &sec_pmic->irq_data);
> 
> -- 
> 2.49.0.472.ge94155a9ec-goog
> 

-- 
Lee Jones [李琼斯]

