Return-Path: <linux-rtc+bounces-1682-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCD6959A75
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2024 13:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83EF4281985
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2024 11:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC91E1B2EFE;
	Wed, 21 Aug 2024 11:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="sw8F8jf3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-28.smtpout.orange.fr [80.12.242.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E500158544;
	Wed, 21 Aug 2024 11:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724239382; cv=none; b=dcnxMyA94QchP+Xw457HEelfwEaA4qqqzhe3Esd627hKTtolyL5hFv3AKvBpA2t6n45RQXdFjQhGsumfbJdmNNHc9WeoS18ByDwFooLzzmXCBr0999Nq0YCw/nnNRL7WTizfHb8dnXAu53l53o3QHeiMl4sqwwOpflswC/V7018=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724239382; c=relaxed/simple;
	bh=Ugjph+YHEce2jyTaW3nH+5ga9AtRZVXzOi1bGmWBNQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OBIVhI3IeG2bn9yIpCzQgC1IrTSYmUHAgLTkpKk7DeOYL3e684EKETI3EL9ocowlMavLVmCZQlUWtSxG13T22OSBtvWLEmUIs/JVkUj8dn1NS6y0U+5tpI6gNblmyHnu8jCaWv1+uyeQ8zW7buHTjSZbMzylEYJLqvkakJhH5n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=sw8F8jf3; arc=none smtp.client-ip=80.12.242.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id gjQXsQHclCul1gjQYsEuVf; Wed, 21 Aug 2024 13:22:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1724239378;
	bh=mUeyV23CfZVG2pEZNl19hvzQex6Xm1ACjw8cE+gA8As=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=sw8F8jf3Kev+rFRE6+XDIrG2Wd3QpP0H+5r/rLBTW8VqwJqNghBxir+2t7J+wbmcm
	 8nXD8MS/Dy8m0goRABTmjTRrCgBsxbFCCDN2cTjRSRY+IOrlDA5F0UrEoJD4XC0tcx
	 ip+z6p1qBmB+dAM83VxWV2cdyStyAsF1lvfhEdOWHx8N1QRBb2Iy0MRRVqYjImtb4v
	 s6EC4ePO0411/MlMH1pX1TuKTPv0T9TBzPQCutPWxJuAzMF9Sv1AAfCC0e1jS0LEyN
	 t28pQDW2n6hFWpwZnJiUcJpBkke8qFeKrXiPd0QaKnk1f6nuCEa/+R/WzuYi+W/Sxv
	 A3sLmhPDe7YYQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 21 Aug 2024 13:22:58 +0200
X-ME-IP: 90.11.132.44
Message-ID: <29b1476e-28ca-4332-975d-c8ae630316bf@wanadoo.fr>
Date: Wed, 21 Aug 2024 13:22:56 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] rtc:rtc-at91rm9200:Use devm_clk_get_enabled() helpers
To: Liao Yuanhong <liaoyuanhong@vivo.com>, alexandre.belloni@bootlin.com,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240821092846.20138-1-liaoyuanhong@vivo.com>
 <20240821092846.20138-2-liaoyuanhong@vivo.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240821092846.20138-2-liaoyuanhong@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 21/08/2024 à 11:28, Liao Yuanhong a écrit :
> Use devm_clk_get_enabled() instead of clk functions in rtc-at91rm9200.
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>   drivers/rtc/rtc-at91rm9200.c | 18 +++---------------
>   1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
> index c16fe711a0d9..81b2556930bb 100644
> --- a/drivers/rtc/rtc-at91rm9200.c
> +++ b/drivers/rtc/rtc-at91rm9200.c
> @@ -498,14 +498,9 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
>   		return PTR_ERR(rtc);
>   	platform_set_drvdata(pdev, rtc);
>   
> -	sclk = devm_clk_get(&pdev->dev, NULL);
> +	sclk = devm_clk_get_enabled(&pdev->dev, NULL);

Hi,

so now the global sclk variable could easily be removed as well.

CJ

>   	if (IS_ERR(sclk))
>   		return PTR_ERR(sclk);
> -
> -	ret = clk_prepare_enable(sclk);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Could not enable slow clock\n");
> -		return ret;
>   	}
>   
>   	at91_rtc_write(AT91_RTC_CR, 0);
> @@ -521,7 +516,7 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
>   			       "at91_rtc", pdev);
>   	if (ret) {
>   		dev_err(&pdev->dev, "IRQ %d already in use.\n", irq);
> -		goto err_clk;
> +		return ret;
>   	}
>   
>   	/* cpu init code should really have flagged this device as
> @@ -539,7 +534,7 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
>   	rtc->range_max = RTC_TIMESTAMP_END_2099;
>   	ret = devm_rtc_register_device(rtc);
>   	if (ret)
> -		goto err_clk;
> +		return ret;
>   
>   	/* enable SECEV interrupt in order to initialize at91_rtc_upd_rdy
>   	 * completion.
> @@ -548,11 +543,6 @@ static int __init at91_rtc_probe(struct platform_device *pdev)
>   
>   	dev_info(&pdev->dev, "AT91 Real Time Clock driver.\n");
>   	return 0;
> -
> -err_clk:
> -	clk_disable_unprepare(sclk);
> -
> -	return ret;
>   }
>   
>   /*
> @@ -564,8 +554,6 @@ static void __exit at91_rtc_remove(struct platform_device *pdev)
>   	at91_rtc_write_idr(AT91_RTC_ACKUPD | AT91_RTC_ALARM |
>   					AT91_RTC_SECEV | AT91_RTC_TIMEV |
>   					AT91_RTC_CALEV);
> -
> -	clk_disable_unprepare(sclk);
>   }
>   
>   static void at91_rtc_shutdown(struct platform_device *pdev)


