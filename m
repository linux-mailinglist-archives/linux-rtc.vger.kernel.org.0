Return-Path: <linux-rtc+bounces-4666-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 706DFB209AD
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Aug 2025 15:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46D687B0C93
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Aug 2025 13:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B252DCBFB;
	Mon, 11 Aug 2025 13:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ha0LJNSf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392F12DCBE0;
	Mon, 11 Aug 2025 13:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754917752; cv=none; b=O0u+xCWlhOImLf0YRiaKSQ8YvgEye38BhyLslMxH2FvQ5sNJupl5Ahv90JyfxQ4ut5SSaxd/kFVB+DOQTbMPX/QpzqF5MbiNnYYdJ7zaFXfiptWTTfpqSNzHHuDITZkhN1xqOi1ASWaHBy82l4LJmn3xO34uTATB9JfQ18K8GI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754917752; c=relaxed/simple;
	bh=ffEAA1BYqRjEeT/y5IgqfC7xY5imc29KSXjgntGj8ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amjifL+U7wooFAmY3Jj8Wtu+BL0LabO7mXY3CyLOetLz+RSziPYBroB3w64vNqgkxAVyAvn0wAk0Kym17HsgPgXZZRwLP8SIfOF5e6go1eF1a/APIletMC19CDZf15fqNpr86UcKd+qLhLT54EDkeCzz8HPo8E+pVlOH+Qry1+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ha0LJNSf; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2794F43A15;
	Mon, 11 Aug 2025 13:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754917748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YmlXeyOWfKWSje0Td8DQAPRRqN2xhLGJ9irnz2oty0I=;
	b=ha0LJNSfZWuWdNA1z8Nq7Dwl77fZGwmujhb/DcMHJwWCo3WCIJaGWAxDRqO5yx1aLxoil9
	1cuXIqiQoX1OyrfXP6qoEZGBUJD+AbHGw4InLLM1xBhXR7vHmsp52RAlQ/rXZXuR1tJAs7
	o1HpE/yrhIilPMyWiZspJdXNLBSNmgCIUlPmhUUxcRvf/dWIHUiBj0R9RiuNdGB5Di0F4f
	pTa6F9GO9EyjF21LkSW9M1D240Bc17zC04BCgkOpOInAyex7XG+vz1vr97UHEguyPsyniE
	inU3b1EsUc1zTTWao0P6slM1nVa+TyfE0vmJpPT9fc7v2SZUcJcx/u32neKPWw==
Date: Mon, 11 Aug 2025 15:09:07 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: ot_shunxi.zhang@mediatek.com
Cc: Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, sirius.wang@mediatek.com,
	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Subject: Re: [PATCH v1 2/2] rtc: mt6397: Add BBPU alarm status reset and
 shutdown handling
Message-ID: <2025081113090716407d59@mail.local>
References: <20250811081543.4377-1-ot_shunxi.zhang@mediatek.com>
 <20250811081543.4377-3-ot_shunxi.zhang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811081543.4377-3-ot_shunxi.zhang@mediatek.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufedvheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemudgvfeefmehfledvleemhegvsgekmeduudegfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemudgvfeefmehfledvleemhegvsgekmeduudegfedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepohhtpghshhhunhigihdriihhrghnghesmhgvughirghtvghkrdgtohhmpdhrtghpthhtohepvgguughivgdrhhhurghnghesmhgvughirghtvghkrdgtohhmpdhrtghpt
 hhtohepshgvrghnrdifrghnghesmhgvughirghtvghkrdgtohhmpdhrtghpthhtohepmhgrthhthhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On 11/08/2025 16:15:34+0800, ot_shunxi.zhang@mediatek.com wrote:
> From: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
> 
> This patch introduces a new function, mtk_rtc_reset_bbpu_alarm_status,
> to reset the BBPU alarm status in the MT6397 RTC driver. This function
> writes the necessary bits to the RTC_BBPU register to clear the alarm
> status and ensure proper operation.
> 
> Additionally, the mtk_rtc_shutdown function is added to handle RTC
> shutdown events. It resets the BBPU alarm status and updates the
> RTC_IRQ_EN register to disable the one-shot alarm interrupt,
> ensuring a clean shutdown process.
> 
> Signed-off-by: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
> ---
>  drivers/rtc/rtc-mt6397.c | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> index 692c00ff544b..063bd399de8c 100644
> --- a/drivers/rtc/rtc-mt6397.c
> +++ b/drivers/rtc/rtc-mt6397.c
> @@ -37,6 +37,21 @@ static int mtk_rtc_write_trigger(struct mt6397_rtc *rtc)
>  	return ret;
>  }
>  
> +static void mtk_rtc_reset_bbpu_alarm_status(struct mt6397_rtc *rtc)
> +{
> +	u32 bbpu = RTC_BBPU_KEY | RTC_BBPU_PWREN | RTC_BBPU_RESET_AL;
> +	int ret;
> +
> +	ret = regmap_write(rtc->regmap, rtc->addr_base + RTC_BBPU, bbpu);
> +	if (ret < 0) {
> +		dev_err(rtc->rtc_dev->dev.parent, "%s: write rtc bbpu error\n",
> +			__func__);
> +		return;
> +	}
> +
> +	mtk_rtc_write_trigger(rtc);
> +}
> +
>  static irqreturn_t mtk_rtc_irq_handler_thread(int irq, void *data)
>  {
>  	struct mt6397_rtc *rtc = data;
> @@ -51,6 +66,8 @@ static irqreturn_t mtk_rtc_irq_handler_thread(int irq, void *data)
>  		if (regmap_write(rtc->regmap, rtc->addr_base + RTC_IRQ_EN,
>  				 irqen) == 0)
>  			mtk_rtc_write_trigger(rtc);
> +
> +		mtk_rtc_reset_bbpu_alarm_status(rtc);
>  		mutex_unlock(&rtc->lock);
>  
>  		return IRQ_HANDLED;
> @@ -297,6 +314,22 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>  	return devm_rtc_register_device(rtc->rtc_dev);
>  }
>  
> +static void mtk_rtc_shutdown(struct platform_device *pdev)
> +{
> +	struct mt6397_rtc *rtc = platform_get_drvdata(pdev);
> +	int ret = 0;
> +
> +	mtk_rtc_reset_bbpu_alarm_status(rtc);
> +
> +	ret = regmap_update_bits(rtc->regmap,
> +				 rtc->addr_base + RTC_IRQ_EN,
> +				 RTC_IRQ_EN_ONESHOT_AL, 0);
> +	if (ret < 0)
> +		return;
> +
> +	mtk_rtc_write_trigger(rtc);

The whole goal of the RTC is to wakeup the system, why would you disable
the alarm on shutdown?

> +}
> +
>  #ifdef CONFIG_PM_SLEEP
>  static int mt6397_rtc_suspend(struct device *dev)
>  {
> @@ -345,7 +378,8 @@ static struct platform_driver mtk_rtc_driver = {
>  		.of_match_table = mt6397_rtc_of_match,
>  		.pm = &mt6397_pm_ops,
>  	},
> -	.probe	= mtk_rtc_probe,
> +	.probe = mtk_rtc_probe,
> +	.shutdown = mtk_rtc_shutdown,
>  };
>  
>  module_platform_driver(mtk_rtc_driver);
> -- 
> 2.46.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

