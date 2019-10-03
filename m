Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 946DECB16F
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2019 23:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732108AbfJCVov (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Oct 2019 17:44:51 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:35055 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728763AbfJCVov (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Oct 2019 17:44:51 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 43E311C0003;
        Thu,  3 Oct 2019 21:44:50 +0000 (UTC)
Date:   Thu, 3 Oct 2019 23:44:49 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Martin =?iso-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        Bruno Thomsen <bruno.thomsen@gmail.com>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCHv2] rtc: pcf2127: handle boot-enabled watchdog feature
Message-ID: <20191003214449.GU4106@piout.net>
References: <20191003124849.117888-1-martin@geanix.com>
 <20191003133351.118538-1-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191003133351.118538-1-martin@geanix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

This seems good to me but..

On 03/10/2019 15:33:51+0200, Martin Hundebøll wrote:
> Linux should handle when the pcf2127 watchdog feature is enabled by the
> bootloader. This is done by checking the watchdog timer value during
> init, and set the WDOG_HW_RUNNING flag if the value differs from zero.
> 
> Signed-off-by: Martin Hundebøll <martin@geanix.com>
> ---
> 
> Change since v1:
>  * remove setting of WDOG_HW_RUNNING in pcf2127_wdt_start()
> 
>  drivers/rtc/rtc-pcf2127.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index cb3472f..4229915 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -420,6 +420,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  			const char *name, bool has_nvmem)
>  {
>  	struct pcf2127 *pcf2127;
> +	u32 wdd_timeout;
>  	int ret = 0;
>  
>  	dev_dbg(dev, "%s\n", __func__);
> @@ -462,7 +463,6 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  	/*
>  	 * Watchdog timer enabled and reset pin /RST activated when timed out.
>  	 * Select 1Hz clock source for watchdog timer.
> -	 * Timer is not started until WD_VAL is loaded with a valid value.
>  	 * Note: Countdown timer disabled and not available.
>  	 */
>  	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_WD_CTL,
> @@ -478,6 +478,16 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  		return ret;
>  	}
>  
> +	/* Test if watchdog timer is started by bootloader */
> +	ret = regmap_read(pcf2127->regmap, PCF2127_REG_WD_VAL, &wdd_timeout);
> +	if (ret) {
> +		dev_err(dev, "%s: watchdog value (wd_wal) failed\n", __func__);

I'd like to question the addition of yet another debug string in the
kernel that will most likely never be printed. Do you really think it is
necessary?


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
