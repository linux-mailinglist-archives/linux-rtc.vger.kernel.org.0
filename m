Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38548D5321
	for <lists+linux-rtc@lfdr.de>; Sun, 13 Oct 2019 00:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbfJLWmA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 12 Oct 2019 18:42:00 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:42906 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727188AbfJLWmA (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 12 Oct 2019 18:42:00 -0400
Received: from [192.168.1.13] (c-76-114-240-162.hsd1.md.comcast.net [76.114.240.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kumba)
        by smtp.gentoo.org (Postfix) with ESMTPSA id 12C9C34BCA9;
        Sat, 12 Oct 2019 22:41:58 +0000 (UTC)
Subject: Re: [PATCH 1/3] rts: ds1685: remove not needed fields from private
 struct
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191011150546.9186-1-tbogendoerfer@suse.de>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <00fbd208-128d-f86d-d9db-6caa1ecc381d@gentoo.org>
Date:   Sat, 12 Oct 2019 18:41:56 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011150546.9186-1-tbogendoerfer@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 10/11/2019 11:05, Thomas Bogendoerfer wrote:
> A few of the fields in struct ds1685_priv aren't needed at all,
> so we can remove it.
> 
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> ---
>  drivers/rtc/rtc-ds1685.c   | 3 ---
>  include/linux/rtc/ds1685.h | 3 ---
>  2 files changed, 6 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
> index 184e4a3e2bef..51f568473de8 100644
> --- a/drivers/rtc/rtc-ds1685.c
> +++ b/drivers/rtc/rtc-ds1685.c
> @@ -1086,12 +1086,10 @@ ds1685_rtc_probe(struct platform_device *pdev)
>  		 * Set the base address for the rtc, and ioremap its
>  		 * registers.
>  		 */
> -		rtc->baseaddr = res->start;
>  		rtc->regs = devm_ioremap(&pdev->dev, res->start, rtc->size);
>  		if (!rtc->regs)
>  			return -ENOMEM;
>  	}
> -	rtc->alloc_io_resources = pdata->alloc_io_resources;
>  
>  	/* Get the register step size. */
>  	if (pdata->regstep > 0)
> @@ -1271,7 +1269,6 @@ ds1685_rtc_probe(struct platform_device *pdev)
>  	/* See if the platform doesn't support UIE. */
>  	if (pdata->uie_unsupported)
>  		rtc_dev->uie_unsupported = 1;
> -	rtc->uie_unsupported = pdata->uie_unsupported;
>  
>  	rtc->dev = rtc_dev;
>  
> diff --git a/include/linux/rtc/ds1685.h b/include/linux/rtc/ds1685.h
> index 43aec568ba7c..b9671d00d964 100644
> --- a/include/linux/rtc/ds1685.h
> +++ b/include/linux/rtc/ds1685.h
> @@ -43,13 +43,10 @@ struct ds1685_priv {
>  	struct rtc_device *dev;
>  	void __iomem *regs;
>  	u32 regstep;
> -	resource_size_t baseaddr;
>  	size_t size;
>  	int irq_num;
>  	bool bcd_mode;
>  	bool no_irq;
> -	bool uie_unsupported;
> -	bool alloc_io_resources;
>  	u8 (*read)(struct ds1685_priv *, int);
>  	void (*write)(struct ds1685_priv *, int, u8);
>  	void (*prepare_poweroff)(void);
> 

Acked-by: Joshua Kinard <kumba@gentoo.org>

