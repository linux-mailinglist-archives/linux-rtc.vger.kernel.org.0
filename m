Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 989C1357DC5
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Apr 2021 10:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhDHIEh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 8 Apr 2021 04:04:37 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:2626 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229623AbhDHIEh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 8 Apr 2021 04:04:37 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13883Rlt004817;
        Thu, 8 Apr 2021 10:04:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=3lmdHjpmGNyJcNcVl8lJSCC55iHfVRZvzlEF1Bg4cnw=;
 b=2UFIR761HcviA0h1m1wF6CP8Fyxvv2OAUNnRUTcmCFaG9dagZfqv+NEun9l/rtHG35ij
 3wwD/sX0v46/11obeFbjXHP60z7LGQIxu9/PvlErFM54pPy2nU8j210tnXljUwb7mmvB
 z2en35ZpLsVSkf/eJEYJDzM6jlWQdDFhaTImExEvLUuY0u3SaT9xU+vjRoTuJ7BsDjp1
 4KIDOSR2wl0XxNzExuWkCGw+Q0EhDbNnBzSfWzq3MOTKlxau93Pt+PFwIENp5GleWx7H
 KdGYIgD4IaCqXHnb1X45fNEgwuKYAQb0hbmCQ2PHqfRXZw03ob6v8Rft/GL8CDSGNy1l DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37ssm3ha47-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Apr 2021 10:04:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5975A10002A;
        Thu,  8 Apr 2021 10:04:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2E42A21B2D9;
        Thu,  8 Apr 2021 10:04:06 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 8 Apr
 2021 10:04:05 +0200
Subject: Re: [PATCH] rtc: st-lpc: move to use request_irq by IRQF_NO_AUTOEN
 flag
To:     Tian Tao <tiantao6@hisilicon.com>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>
CC:     <linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>
References: <1617761937-58318-1-git-send-email-tiantao6@hisilicon.com>
From:   Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <1df61277-23b0-0351-7373-2e1e5c9f6651@foss.st.com>
Date:   Thu, 8 Apr 2021 10:04:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1617761937-58318-1-git-send-email-tiantao6@hisilicon.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-08_02:2021-04-08,2021-04-08 signatures=0
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Tian

On 4/7/21 4:18 AM, Tian Tao wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable because of requesting.
> 
> this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
> is being merged: https://lore.kernel.org/patchwork/patch/1388765/
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/rtc/rtc-st-lpc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-st-lpc.c b/drivers/rtc/rtc-st-lpc.c
> index bdb20f6..2df2179 100644
> --- a/drivers/rtc/rtc-st-lpc.c
> +++ b/drivers/rtc/rtc-st-lpc.c
> @@ -218,15 +218,14 @@ static int st_rtc_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	ret = devm_request_irq(&pdev->dev, rtc->irq, st_rtc_handler, 0,
> -			       pdev->name, rtc);
> +	ret = devm_request_irq(&pdev->dev, rtc->irq, st_rtc_handler,
> +			       IRQF_NO_AUTOEN, pdev->name, rtc);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to request irq %i\n", rtc->irq);
>  		return ret;
>  	}
>  
>  	enable_irq_wake(rtc->irq);
> -	disable_irq(rtc->irq);
>  
>  	rtc->clk = clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(rtc->clk)) {
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
