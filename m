Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8968618789B
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Mar 2020 05:51:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgCQEvD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Mar 2020 00:51:03 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:52548 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726705AbgCQEvC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Mar 2020 00:51:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584420662; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=J/JPm4PINDbtMVQYCL+rGOKx+ztstEStWYv9Lgc9YJ8=; b=Nfo/HdMy8kWPDgdjEuBZHCrcFJRqajA+WYu+Xwz8bLYSb9qFLc6NS0XWaLn+ohfilSoY9y6E
 kPO8DItc1u9eH8/0pH6nI8al4uJ1CYZ+jCmygliD8bOIUrtLR/5wrBkXzfTVFuDYS0csSqpD
 OnKcCLVOsU3rWtdWTjjUj8qtHRs=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJhNWYyNyIsICJsaW51eC1ydGNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e705723.7f76a55e8a08-smtp-out-n04;
 Tue, 17 Mar 2020 04:50:43 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 31108C432C2; Tue, 17 Mar 2020 04:50:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from MAGGARWA (unknown [183.83.138.118])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: maggarwa)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0EA76C433D2;
        Tue, 17 Mar 2020 04:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0EA76C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=maggarwa@codeaurora.org
From:   <maggarwa@codeaurora.org>
To:     "'Alexandre Belloni'" <alexandre.belloni@bootlin.com>
Cc:     <a.zummo@towertech.it>, <linux-rtc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1584342688-14035-1-git-send-email-maggarwa@codeaurora.org> <20200316102905.GN4518@piout.net>
In-Reply-To: <20200316102905.GN4518@piout.net>
Subject: RE: [PATCH] rtc-pm8xxx: Clear Alarm register on resume
Date:   Tue, 17 Mar 2020 10:20:36 +0530
Message-ID: <000001d5fc17$9c327ee0$d4977ca0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGOsd3LdOay4LNIsG2VCVcgDm4GSQFDNT2fqNCw0MA=
Content-Language: en-us
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

Comments inline.


Thanks & Regards,
Mohit

-----Original Message-----
From: Alexandre Belloni <alexandre.belloni@bootlin.com> 
Sent: Monday, March 16, 2020 3:59 PM
To: Mohit Aggarwal <maggarwa@codeaurora.org>
Cc: a.zummo@towertech.it; linux-rtc@vger.kernel.org;
linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc-pm8xxx: Clear Alarm register on resume

Hi,

On 16/03/2020 12:41:28+0530, Mohit Aggarwal wrote:
> Currently, alarm register is not cleared on resume leading to reboot 
> during power off charging mode.
> 
> Change-Id: Ie2e6bbab8aa46e4e9b9cc984181ffab557cbbdae

No Change-Id upstream please.
[Mohit]: Will fix in next patch.

> Signed-off-by: Mohit Aggarwal <maggarwa@codeaurora.org>
> ---
>  drivers/rtc/rtc-pm8xxx.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c index 
> bbe013f..96e7985 100644
> --- a/drivers/rtc/rtc-pm8xxx.c
> +++ b/drivers/rtc/rtc-pm8xxx.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/* Copyright (c) 2010-2011, 2019, The Linux Foundation. All rights 
> reserved. */
> +/* Copyright (c) 2010-2011, 2019-2020, The Linux Foundation. All 
> +rights reserved. */
>  
>  #include <linux/of.h>
>  #include <linux/module.h>
> @@ -301,6 +301,7 @@ static int pm8xxx_rtc_alarm_irq_enable(struct device
*dev, unsigned int enable)
>  	struct pm8xxx_rtc *rtc_dd = dev_get_drvdata(dev);
>  	const struct pm8xxx_rtc_regs *regs = rtc_dd->regs;
>  	unsigned int ctrl_reg;
> +	u8 value[NUM_8_BIT_RTC_REGS] = {0};
>  
>  	spin_lock_irqsave(&rtc_dd->ctrl_reg_lock, irq_flags);
>  
> @@ -319,6 +320,16 @@ static int pm8xxx_rtc_alarm_irq_enable(struct device
*dev, unsigned int enable)
>  		goto rtc_rw_fail;
>  	}
>  
> +	/* Clear Alarm register */
> +	if (!enable) {
> +		rc = regmap_bulk_write(rtc_dd->regmap, regs->alarm_rw,
value,
> +					sizeof(value));

This is not properly aligned.
[Mohit]: I don't see any alignment issue at my end. I can see proper tabs
are present.

> +		if (rc) {
> +			dev_err(dev, "Write to RTC ALARM register
failed\n");

Is that error message necessary? What would be the user action after seeing
that in the logs? Will the logs actually be seen?
[Mohit]: In case issue in question reproduces even after this change then
for debugging purposes user can look out for this error log in kernel logs
which can help to triage the issue.

> +			goto rtc_rw_fail;
> +		}
> +	}
> +

--
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
