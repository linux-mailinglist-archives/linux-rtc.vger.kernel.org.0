Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35932455818
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Nov 2021 10:33:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245192AbhKRJgw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 18 Nov 2021 04:36:52 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:44823 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245187AbhKRJgh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 18 Nov 2021 04:36:37 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 9DAE120001C;
        Thu, 18 Nov 2021 09:33:34 +0000 (UTC)
Date:   Thu, 18 Nov 2021 10:33:34 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     David Abdurachmanov <david.abdurachmanov@sifive.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] rtc: da9063: add as wakeup source
Message-ID: <YZYd7kNanfxY3tJq@piout.net>
References: <20211118084008.30327-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118084008.30327-1-nikita.shubin@maquefel.me>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 18/11/2021 11:40:08+0300, Nikita Shubin wrote:
> in case if threaded irq registered successfully - add da9063
> as a wakeup source if "wakeup-source" node present in device tree,
> set as wakeup capable otherwise.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
>  drivers/rtc/rtc-da9063.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-da9063.c b/drivers/rtc/rtc-da9063.c
> index d4b72a9fa2ba..1aceb5ba6992 100644
> --- a/drivers/rtc/rtc-da9063.c
> +++ b/drivers/rtc/rtc-da9063.c
> @@ -490,7 +490,15 @@ static int da9063_rtc_probe(struct platform_device *pdev)
>  					da9063_alarm_event,
>  					IRQF_TRIGGER_LOW | IRQF_ONESHOT,
>  					"ALARM", rtc);
> -	if (ret)
> +	if (!ret) {
> +		if (device_property_present(&pdev->dev, "wakeup-source")) {
> +			device_init_wakeup(&pdev->dev, true);

If wakeup-source is present, then this should be done regardless of the
registration of the interrupt handler. Note that wakeup-source and
interrupt are supposed to be mutually exclusive.

> +			dev_info(&pdev->dev, "registered as wakeup source.\n");

This is too verbose please avoid adding new strings

> +		} else {
> +			device_set_wakeup_capable(&pdev->dev, true);

I think this is misusing the wakeup-source property for configuration
that should be left to userspace.

> +			dev_info(&pdev->dev, "marked as wakeup capable.\n");

Ditto

> +		}
> +	} else

unbalanced brackets


>  		dev_err(&pdev->dev, "Failed to request ALARM IRQ %d: %d\n",
>  			irq_alarm, ret);
>  
> -- 
> 2.31.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
