Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57D0936F1FC
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Apr 2021 23:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233315AbhD2V0m (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 29 Apr 2021 17:26:42 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:55029 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233293AbhD2V0m (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 29 Apr 2021 17:26:42 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 621A81C0004;
        Thu, 29 Apr 2021 21:25:53 +0000 (UTC)
Date:   Thu, 29 Apr 2021 23:25:53 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Mian Yousaf Kaukab <ykaukab@suse.de>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: pcf2127: handle timestamp interrupts
Message-ID: <YIskYdBAW0yZ+JLi@piout.net>
References: <20210429144758.4552-1-ykaukab@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210429144758.4552-1-ykaukab@suse.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 29/04/2021 16:47:58+0200, Mian Yousaf Kaukab wrote:
> commit 03623b4b041c ("rtc: pcf2127: add tamper detection support")
> added support for timestamp interrupts. However they are not being
> handled in the irq handler. If a timestamp interrupt occurs it
> results in kernel disabling the interrupt and displaying the call
> trace:
> 
> [  121.145580] irq 78: nobody cared (try booting with the "irqpoll" option)
> ...
> [  121.238087] [<00000000c4d69393>] irq_default_primary_handler threaded [<000000000a90d25b>] pcf2127_rtc_irq [rtc_pcf2127]
> [  121.248971] Disabling IRQ #78
> 
> Handle timestamp interrupts in pcf2127_rtc_irq(). Display a message
> in kernel log when a timestamp interrupt occurs. Don’t check for
> TSF1 and TSF2 flags in timestamp0_show() as they are cleared in the
> IRQ handler now.

This breaks an important functionality (as I already replied to a
previous fix a while ago) as then there is no way to know whether the
timestamp is bogus or if an event really happened. Please fix properly.

> 
> Signed-off-by: Mian Yousaf Kaukab <ykaukab@suse.de>
> ---
>  drivers/rtc/rtc-pcf2127.c | 34 +++++++++++++++++++++++++---------
>  1 file changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index d13c20a2adf7..0dbc0473cc68 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -94,6 +94,13 @@
>  #define PCF2127_WD_VAL_MAX		255
>  #define PCF2127_WD_VAL_DEFAULT		60
>  
> +/* Mask for currently enabled interrupts */
> +#define PCF2127_CTRL1_IRQ_MASK (PCF2127_BIT_CTRL1_TSF1)
> +#define PCF2127_CTRL2_IRQ_MASK ( \
> +		PCF2127_BIT_CTRL2_AF | \
> +		PCF2127_BIT_CTRL2_WDTF | \
> +		PCF2127_BIT_CTRL2_TSF2)
> +
>  struct pcf2127 {
>  	struct rtc_device *rtc;
>  	struct watchdog_device wdd;
> @@ -437,20 +444,33 @@ static int pcf2127_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>  static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
>  {
>  	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
> -	unsigned int ctrl2 = 0;
> +	unsigned int ctrl1, ctrl2;
>  	int ret = 0;
>  
> +	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL1, &ctrl1);
> +	if (ret)
> +		return IRQ_NONE;
> +
>  	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
>  	if (ret)
>  		return IRQ_NONE;
>  
> -	if (!(ctrl2 & PCF2127_BIT_CTRL2_AF))
> +	if (!(ctrl1 & PCF2127_CTRL1_IRQ_MASK || ctrl2 & PCF2127_CTRL2_IRQ_MASK))
>  		return IRQ_NONE;
>  
> -	regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
> -		     ctrl2 & ~(PCF2127_BIT_CTRL2_AF | PCF2127_BIT_CTRL2_WDTF));
> +	if (ctrl1 & PCF2127_CTRL1_IRQ_MASK)
> +		regmap_write(pcf2127->regmap, PCF2127_REG_CTRL1,
> +			ctrl1 & ~PCF2127_CTRL1_IRQ_MASK);
>  
> -	rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
> +	if (ctrl2 & PCF2127_CTRL2_IRQ_MASK)
> +		regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
> +			ctrl2 & ~PCF2127_CTRL2_IRQ_MASK);
> +
> +	if (ctrl1 & PCF2127_BIT_CTRL1_TSF1 || ctrl2 & PCF2127_BIT_CTRL2_TSF2)
> +		dev_info(dev, "timestamp interrupt generated");
> +

Please do not add random strings in the kernel, this will probably never
be seen by any real user.

> +	if (ctrl2 & PCF2127_BIT_CTRL2_AF)
> +		rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
>  
>  	pcf2127_wdt_active_ping(&pcf2127->wdd);
>  
> @@ -524,10 +544,6 @@ static ssize_t timestamp0_show(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> -	if (!(data[PCF2127_REG_CTRL1] & PCF2127_BIT_CTRL1_TSF1) &&
> -	    !(data[PCF2127_REG_CTRL2] & PCF2127_BIT_CTRL2_TSF2))
> -		return 0;
> -
>  	tm.tm_sec = bcd2bin(data[PCF2127_REG_TS_SC] & 0x7F);
>  	tm.tm_min = bcd2bin(data[PCF2127_REG_TS_MN] & 0x7F);
>  	tm.tm_hour = bcd2bin(data[PCF2127_REG_TS_HR] & 0x3F);
> -- 
> 2.26.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
