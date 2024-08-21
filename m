Return-Path: <linux-rtc+bounces-1683-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B35959AC1
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2024 13:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F207B28FBF
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2024 11:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291A21B5ED2;
	Wed, 21 Aug 2024 11:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="sWxej33/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from msa.smtpout.orange.fr (msa-215.smtpout.orange.fr [193.252.23.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027BE1B5EA9;
	Wed, 21 Aug 2024 11:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.215
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724239581; cv=none; b=iqu0W0mSgWMvN9SivC5akQIYYcI0/xUGVOTMuYn5DyZ8n3Y/9tgihQt1lvkhuImCYhdevlFR5aMKZULxLMh3XAhrmIEU0eAIZqXP03BhERsu1Timze6BeZfPnuD22vTDJLODlr7gpoobZUr/89aTSKNKOsNARVo4UtkN+v+XBe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724239581; c=relaxed/simple;
	bh=mQwjcvodjyYGPP2932U4eJXkm3F+y4g4V2x6tbMiJLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QNNFcCfcN/+0X+ItGisFEpkzMw5/jYfWiTZYCjegKPkQcezKgEcmliOpTb3e9U5c1itoQ2S7GAlq/BvJaWzNrwxe5O7V1gNYPwn2rz/H+bV1/gLBtrhlxAjvjDGjLqW9o9M0N7EbERbF2xQhJe4Vop+f0hWo4xSvDgut/ECnNaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=sWxej33/; arc=none smtp.client-ip=193.252.23.215
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id gjSbsKIjDGrBegjSbsyNyM; Wed, 21 Aug 2024 13:25:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1724239506;
	bh=9kOtdufixM0eHkjhmDA0GQzaPAqdF25IhMASY9eCQy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=sWxej33/+wdW331elmSfWciBDUO7AkrHJ9Qf7AD2eZJvI5eHE/DYJIYlzSfSnMzmY
	 zT93MSVKr3j+sCVKdhJkUZmCF8zNz063iKShptFLS3TqR60KCs2GFtbCtVM7XMuXk7
	 6LigPoCPF+r1OgTh/6qWC7AF9m5dQzmo1C4Qb9MvvDH/QguMEChJNuEz1K79MmUh2v
	 ta0jADF7wAkr5yVJ7Nw3RJkBZ9B1dDYcwK8rDTHeVcFuhnr9nceafTvZx1NHAmPRMt
	 ub2vAkhnzIc39SVm96iMBxIPo18HjGV+JnX5g81u0MIsnKCnFdem7ME3naJRmf/AYs
	 Lb9wCKTPNLtww==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 21 Aug 2024 13:25:06 +0200
X-ME-IP: 90.11.132.44
Message-ID: <a2724a97-e253-4ef3-a76f-d57294bf3060@wanadoo.fr>
Date: Wed, 21 Aug 2024 13:25:05 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] rtc:rtc-mt7622:Use devm_clk_get_enabled() helpers
To: Liao Yuanhong <liaoyuanhong@vivo.com>, alexandre.belloni@bootlin.com,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240821092846.20138-1-liaoyuanhong@vivo.com>
 <20240821092846.20138-4-liaoyuanhong@vivo.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240821092846.20138-4-liaoyuanhong@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 21/08/2024 à 11:28, Liao Yuanhong a écrit :
> Use devm_clk_get_enabled() instead of clk functions in rtc-mt7622.
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>   drivers/rtc/rtc-mt7622.c | 24 ++++--------------------
>   1 file changed, 4 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-mt7622.c b/drivers/rtc/rtc-mt7622.c
> index 094c649fc137..da1d9652d6da 100644
> --- a/drivers/rtc/rtc-mt7622.c
> +++ b/drivers/rtc/rtc-mt7622.c
> @@ -315,27 +315,23 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>   	if (IS_ERR(hw->base))
>   		return PTR_ERR(hw->base);
>   
> -	hw->clk = devm_clk_get(&pdev->dev, "rtc");
> +	hw->clk = devm_clk_get_enabled(&pdev->dev, "rtc");

Hi,

the clk field in struct mtk_rtc could also be easily removed now.

CJ

>   	if (IS_ERR(hw->clk)) {
>   		dev_err(&pdev->dev, "No clock\n");
>   		return PTR_ERR(hw->clk);
>   	}
>   
> -	ret = clk_prepare_enable(hw->clk);
> -	if (ret)
> -		return ret;
> -
>   	hw->irq = platform_get_irq(pdev, 0);
>   	if (hw->irq < 0) {
>   		ret = hw->irq;
> -		goto err;
> +		return ret;
>   	}
>   
>   	ret = devm_request_irq(&pdev->dev, hw->irq, mtk_rtc_alarmirq,
>   			       0, dev_name(&pdev->dev), hw);
>   	if (ret) {
>   		dev_err(&pdev->dev, "Can't request IRQ\n");
> -		goto err;
> +		return ret;
>   	}
>   
>   	mtk_rtc_hw_init(hw);
> @@ -347,21 +343,10 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>   	if (IS_ERR(hw->rtc)) {
>   		ret = PTR_ERR(hw->rtc);
>   		dev_err(&pdev->dev, "Unable to register device\n");
> -		goto err;
> +		return ret;
>   	}
>   
>   	return 0;
> -err:
> -	clk_disable_unprepare(hw->clk);
> -
> -	return ret;
> -}
> -
> -static void mtk_rtc_remove(struct platform_device *pdev)
> -{
> -	struct mtk_rtc *hw = platform_get_drvdata(pdev);
> -
> -	clk_disable_unprepare(hw->clk);
>   }
>   
>   #ifdef CONFIG_PM_SLEEP
> @@ -394,7 +379,6 @@ static SIMPLE_DEV_PM_OPS(mtk_rtc_pm_ops, mtk_rtc_suspend, mtk_rtc_resume);
>   
>   static struct platform_driver mtk_rtc_driver = {
>   	.probe	= mtk_rtc_probe,
> -	.remove_new = mtk_rtc_remove,
>   	.driver = {
>   		.name = MTK_RTC_DEV,
>   		.of_match_table = mtk_rtc_match,


