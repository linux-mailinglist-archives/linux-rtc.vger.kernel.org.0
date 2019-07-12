Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A82A067011
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Jul 2019 15:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbfGLN2f (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 12 Jul 2019 09:28:35 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:59410 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726466AbfGLN2f (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 12 Jul 2019 09:28:35 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6CDAIp8026333;
        Fri, 12 Jul 2019 08:28:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=Z6RGYfiHMtg8a+NvqJWTR1+tTWeQAj0B5badHcJ0ZcE=;
 b=K4I6DqYIC6kwK4wNri3KJ/tEZqojdg4lwcscV1Cxu3mc3nYKrAacOXMe+aHUFfGPKjtQ
 /tousLBWtamIg41+33Ci3ME00kDY8mIe4ICAtDVy0RKnPVaCDqV3Q/dFRp9ea+TB9jUZ
 kEu6t/l4H1T844dqxDfHIdNC9ezwffOlWuBHCrbqlh5TO5JP3gYgISCorWvhooHVwkWF
 ZTMbTKEE3FyaY/FFICXaqdlCIrSN40cxm5zPrthid74pEAdcCNVZpTu2A0HwS/Mk5f/G
 b/6KY7nOebr9AbHFqtPC8ND+zZ8+NUdIhjaskfng7MoEmo1L7Ct0ubGHG4Zf0OjpRHSJ Sg== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
        by mx0a-001ae601.pphosted.com with ESMTP id 2tne8ubrtp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 12 Jul 2019 08:28:15 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 12 Jul
 2019 14:28:12 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Fri, 12 Jul 2019 14:28:12 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C847044;
        Fri, 12 Jul 2019 14:28:12 +0100 (BST)
Date:   Fri, 12 Jul 2019 14:28:12 +0100
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Hariprasad Kelam <hariprasad.kelam@gmail.com>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        <patches@opensource.cirrus.com>, <linux-rtc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drivers: rtc: rtc-wm831x: Add IRQF_ONESHOT flag
Message-ID: <20190712132812.GK54126@ediswmail.ad.cirrus.com>
References: <20190711175615.GA13651@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190711175615.GA13651@hari-Inspiron-1545>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907120144
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Jul 11, 2019 at 11:26:15PM +0530, Hariprasad Kelam wrote:
> fix below issue reported by coccicheck
> drivers//rtc/rtc-wm831x.c:436:7-32: ERROR: Threaded IRQ with no primary
> handler requested without IRQF_ONESHOT
> 
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
> ---
>  drivers/rtc/rtc-wm831x.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-wm831x.c b/drivers/rtc/rtc-wm831x.c
> index d2e8b21..ccef887 100644
> --- a/drivers/rtc/rtc-wm831x.c
> +++ b/drivers/rtc/rtc-wm831x.c
> @@ -435,7 +435,8 @@ static int wm831x_rtc_probe(struct platform_device *pdev)
>  
>  	ret = devm_request_threaded_irq(&pdev->dev, alm_irq, NULL,
>  				wm831x_alm_irq,
> -				IRQF_TRIGGER_RISING, "RTC alarm",
> +				IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +				"RTC alarm",

I guess this code pre-dates the check in the core that doesn't
allow the default handler with no oneshot (if you check the comment
it definitely looks like this would have worked before that check
was added).

I am a little worried there might be a bit more required to fix this
one. I seem to remember edge triggered IRQs and ONESHOT don't play
very nicely together, but on the flip side this is just a virtual
domain used within the chip so in practice it is probably safe.

A tentative ack from me, but I would certainly appreciate any
additional opinions.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>


Thanks,
Charles

>  				wm831x_rtc);
>  	if (ret != 0) {
>  		dev_err(&pdev->dev, "Failed to request alarm IRQ %d: %d\n",
> -- 
> 2.7.4
> 
