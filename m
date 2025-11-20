Return-Path: <linux-rtc+bounces-5441-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E95FC737BB
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Nov 2025 11:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F3ABE353F8E
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Nov 2025 10:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FEA932D0FD;
	Thu, 20 Nov 2025 10:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQwbhnL/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B1D32BF51;
	Thu, 20 Nov 2025 10:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763634961; cv=none; b=BARy+0jITz1IKIAWz315feoL9R4lUki2Rw/6N5abs56yFRToPVZt4sXiVoCyYLaK6TjhgThKNWDsaidRfCD7vqCL3e7PGGLAcFWeDjWJ//CMUcjnH7JWKmEIKy/fd1rwBPJfAi29wB5uVcSqsNJ0OQaxwRVEciThs4LIleVfdA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763634961; c=relaxed/simple;
	bh=XsmA4t9AbJrvHRQUEfyRn4XQRxwLTBAHh8NanUZYlwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAvd8USRN4Ji/XQ8KrDVysPjoMlNj98mH4wAHhW+OydsRot70Y62DVlcnlkhhgp7ViCuxeYxo62wsQuM6Snhxn0QPYf3PksPEIsqhfYLosoBlqRYQY/uoIqShMfJfiA1w5Y5+ruWI+2SXSI0v3ExST+siDLFan+/ZjEfPakuVvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQwbhnL/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061FDC116B1;
	Thu, 20 Nov 2025 10:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763634959;
	bh=XsmA4t9AbJrvHRQUEfyRn4XQRxwLTBAHh8NanUZYlwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQwbhnL/uFVyZlcP/xcuO1rleP1JmB+XR1OW4qxH/y2QByy1N9atuneG0B8rLJ4Zh
	 03d5oGWBQPuLdHBEj/dGxedTPbplF8kGzwjKfttYwcW/ftSlap2zxvCefuokof9efi
	 lIxXYi8Sle8vBt6tM5RMuNkg4FcsvMufjJ2Ja4UX8ge0EmPzUexDST+2+xcKzgaRG3
	 T9J3kb4w5oVjL/eNOkX8UPY1fDY/ZqpZOYmaxOaqmXn8dHGm/J7GGszcM7bnJcNlqx
	 0t004y1JLwnNrtgJud86mOkIntTIH/78YaK/wsNJsW7ewV2qIPV2jrVlUdUjaO6sCj
	 cZDyqNpZcjQOA==
Date: Thu, 20 Nov 2025 10:35:53 +0000
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>,
	Douglas Anderson <dianders@chromium.org>, kernel-team@android.com,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH 3/3] mfd: sec: drop now unused struct
 sec_pmic_dev::irq_data
Message-ID: <20251120103553.GZ1949330@google.com>
References: <20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org>
 <20251114-s5m-alarm-v1-3-c9b3bebae65f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251114-s5m-alarm-v1-3-c9b3bebae65f@linaro.org>

On Fri, 14 Nov 2025, André Draszik wrote:

> This was used only to allow the s5m RTC driver to deal with the alarm
> IRQ. That driver now uses a different approach to acquire that IRQ, and
> ::irq_data doesn't need to be kept around anymore.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  drivers/mfd/sec-common.c         |  5 +++--
>  drivers/mfd/sec-core.h           |  2 +-
>  drivers/mfd/sec-irq.c            | 10 ++--------
>  include/linux/mfd/samsung/core.h |  1 -
>  4 files changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
> index 77370db52a7ba81234136b29f85892f4b197f429..794c4e5398e7dd1a816aff9a6559a6c19fec75a5 100644
> --- a/drivers/mfd/sec-common.c
> +++ b/drivers/mfd/sec-common.c
> @@ -163,6 +163,7 @@ sec_pmic_parse_dt_pdata(struct device *dev)
>  int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
>  		   struct regmap *regmap, struct i2c_client *client)
>  {
> +	struct regmap_irq_chip_data *irq_data;
>  	struct sec_platform_data *pdata;
>  	const struct mfd_cell *sec_devs;
>  	struct sec_pmic_dev *sec_pmic;
> @@ -187,7 +188,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
>  
>  	sec_pmic->pdata = pdata;
>  
> -	ret = sec_irq_init(sec_pmic);
> +	ret = sec_irq_init(sec_pmic, &irq_data);
>  	if (ret)
>  		return ret;
>  
> @@ -240,7 +241,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
>  				     sec_pmic->device_type);
>  	}
>  	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
> -				   NULL, 0, regmap_irq_get_domain(sec_pmic->irq_data));
> +				   NULL, 0, regmap_irq_get_domain(irq_data));
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/mfd/sec-core.h b/drivers/mfd/sec-core.h
> index 92c7558ab8b0de44a52e028eeb7998e38358cb4c..c639180ea686f4308af3f872cb1d2209d201b2e7 100644
> --- a/drivers/mfd/sec-core.h
> +++ b/drivers/mfd/sec-core.h
> @@ -18,6 +18,6 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
>  		   struct regmap *regmap, struct i2c_client *client);
>  void sec_pmic_shutdown(struct device *dev);
>  
> -int sec_irq_init(struct sec_pmic_dev *sec_pmic);
> +int sec_irq_init(struct sec_pmic_dev *sec_pmic, struct regmap_irq_chip_data **irq_data);
>  
>  #endif /* __SEC_CORE_INT_H */
> diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
> index c5c80b1ba104e6c5a55b442d2f10a8554201a961..05d4cc350a351d994e00ba08f5ce966d0d5c6a0b 100644
> --- a/drivers/mfd/sec-irq.c
> +++ b/drivers/mfd/sec-irq.c
> @@ -253,7 +253,7 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
>  	.ack_base = S5M8767_REG_INT1,
>  };
>  
> -int sec_irq_init(struct sec_pmic_dev *sec_pmic)
> +int sec_irq_init(struct sec_pmic_dev *sec_pmic, struct regmap_irq_chip_data **irq_data)

Instead of passing around pointers to pointers, why not return irq_data
or NULL?

>  {
>  	const struct regmap_irq_chip *sec_irq_chip;
>  	int ret;
> @@ -302,17 +302,11 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
>  
>  	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
>  				       sec_pmic->irq, IRQF_ONESHOT,
> -				       0, sec_irq_chip, &sec_pmic->irq_data);
> +				       0, sec_irq_chip, irq_data);
>  	if (ret)
>  		return dev_err_probe(sec_pmic->dev, ret,
>  				     "Failed to add %s IRQ chip\n",
>  				     sec_irq_chip->name);
>  
> -	/*
> -	 * The rtc-s5m driver requests S2MPS14_IRQ_RTCA0 also for S2MPS11
> -	 * so the interrupt number must be consistent.
> -	 */
> -	BUILD_BUG_ON(((enum s2mps14_irq)S2MPS11_IRQ_RTCA0) != S2MPS14_IRQ_RTCA0);
> -
>  	return 0;
>  }
> diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
> index d785e101fe795a5d8f9cccf4ccc4232437e89416..c7c3c8cd8d5f99ef0cc3188e1c3b49031f4750f2 100644
> --- a/include/linux/mfd/samsung/core.h
> +++ b/include/linux/mfd/samsung/core.h
> @@ -69,7 +69,6 @@ struct sec_pmic_dev {
>  
>  	int device_type;
>  	int irq;
> -	struct regmap_irq_chip_data *irq_data;
>  };
>  
>  struct sec_platform_data {
> 
> -- 
> 2.52.0.rc1.455.g30608eb744-goog
> 

-- 
Lee Jones [李琼斯]

