Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DBEAD5327
	for <lists+linux-rtc@lfdr.de>; Sun, 13 Oct 2019 00:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbfJLWtz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 12 Oct 2019 18:49:55 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:43436 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727149AbfJLWtz (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 12 Oct 2019 18:49:55 -0400
Received: from [192.168.1.13] (c-76-114-240-162.hsd1.md.comcast.net [76.114.240.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kumba)
        by smtp.gentoo.org (Postfix) with ESMTPSA id 7B8A434BCAD;
        Sat, 12 Oct 2019 22:49:53 +0000 (UTC)
Subject: Re: [PATCH 2/3] rtc: ds1685: use devm_platform_ioremap_resource
 helper
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191011150546.9186-1-tbogendoerfer@suse.de>
 <20191011150546.9186-2-tbogendoerfer@suse.de>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <996657ac-dd27-09c8-1221-b390591e8dd0@gentoo.org>
Date:   Sat, 12 Oct 2019 18:49:51 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011150546.9186-2-tbogendoerfer@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 10/11/2019 11:05, Thomas Bogendoerfer wrote:
> Simplify ioremapping of registers by using devm_platform_ioremap_resource.
> 
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> ---
>  drivers/rtc/rtc-ds1685.c   | 23 +++--------------------
>  include/linux/rtc/ds1685.h |  1 -
>  2 files changed, 3 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
> index 51f568473de8..349a8d1caca1 100644
> --- a/drivers/rtc/rtc-ds1685.c
> +++ b/drivers/rtc/rtc-ds1685.c
> @@ -1040,7 +1040,6 @@ static int
>  ds1685_rtc_probe(struct platform_device *pdev)
>  {
>  	struct rtc_device *rtc_dev;
> -	struct resource *res;
>  	struct ds1685_priv *rtc;
>  	struct ds1685_rtc_platform_data *pdata;
>  	u8 ctrla, ctrlb, hours;
> @@ -1070,25 +1069,9 @@ ds1685_rtc_probe(struct platform_device *pdev)
>  	 * that sits behind the IOC3 PCI metadevice.
>  	 */
>  	if (pdata->alloc_io_resources) {
> -		/* Get the platform resources. */
> -		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -		if (!res)
> -			return -ENXIO;
> -		rtc->size = resource_size(res);
> -
> -		/* Request a memory region. */
> -		/* XXX: mmio-only for now. */
> -		if (!devm_request_mem_region(&pdev->dev, res->start, rtc->size,
> -					     pdev->name))
> -			return -EBUSY;
> -
> -		/*
> -		 * Set the base address for the rtc, and ioremap its
> -		 * registers.
> -		 */
> -		rtc->regs = devm_ioremap(&pdev->dev, res->start, rtc->size);
> -		if (!rtc->regs)
> -			return -ENOMEM;
> +		rtc->regs = devm_platform_ioremap_resource(pdev, 0);
> +		if (IS_ERR(rtc->regs))
> +			return PTR_ERR(rtc->regs);
>  	}
>  
>  	/* Get the register step size. */
> diff --git a/include/linux/rtc/ds1685.h b/include/linux/rtc/ds1685.h
> index b9671d00d964..101c7adc05a2 100644
> --- a/include/linux/rtc/ds1685.h
> +++ b/include/linux/rtc/ds1685.h
> @@ -43,7 +43,6 @@ struct ds1685_priv {
>  	struct rtc_device *dev;
>  	void __iomem *regs;
>  	u32 regstep;
> -	size_t size;
>  	int irq_num;
>  	bool bcd_mode;
>  	bool no_irq;
> 


Acked-by: Joshua Kinard <kumba@gentoo.org>
