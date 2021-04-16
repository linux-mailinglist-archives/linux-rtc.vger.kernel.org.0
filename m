Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D496E362ABB
	for <lists+linux-rtc@lfdr.de>; Sat, 17 Apr 2021 00:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234312AbhDPWGY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 16 Apr 2021 18:06:24 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:57989 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235666AbhDPWGX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 16 Apr 2021 18:06:23 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id F1B0520003;
        Fri, 16 Apr 2021 22:05:55 +0000 (UTC)
Date:   Sat, 17 Apr 2021 00:05:55 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Francois Gervais <fgervais@distech-controls.com>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Michael McCormick <michael.mccormick@enatel.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] rtc: pcf85063: add integrity check
Message-ID: <YHoKQ9qtupDhXVm3@piout.net>
References: <20210311174940.23072-1-fgervais@distech-controls.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210311174940.23072-1-fgervais@distech-controls.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 11/03/2021 12:49:40-0500, Francois Gervais wrote:
> Sometimes when the RTC battery is inserted, the voltage will bounce a
> bit and we've seen that this can randomly flip configuration bits in
> the RTC.
> 
> For example, we've seen COF bits flips and then the output clock
> frequency would not be the expected one anymore.
> 
> To remediate this issue, this adds an optional feature where if the OS
> bit it set on boot, it's possibly because the RTC lost power and again
> possibly because a new battery has been inserted. In that case, it
> reapplies defaults to configuration registers.
> 
> Signed-off-by: Francois Gervais <fgervais@distech-controls.com>
> ---
>  drivers/rtc/rtc-pcf85063.c | 54 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
> index 463991c74fdd..774cc4cf93d8 100644
> --- a/drivers/rtc/rtc-pcf85063.c
> +++ b/drivers/rtc/rtc-pcf85063.c
> @@ -57,6 +57,10 @@
>  #define PCF85063_REG_ALM_S		0x0b
>  #define PCF85063_AEN			BIT(7)
>  
> +static bool integrity_check;
> +module_param(integrity_check, bool, 0444);
> +MODULE_PARM_DESC(integrity_check, "Set to one to enable the integrity check.");
> +
>  struct pcf85063_config {
>  	struct regmap_config regmap;
>  	unsigned has_alarms:1;
> @@ -357,6 +361,49 @@ static int pcf85063_load_capacitance(struct pcf85063 *pcf85063,
>  				  PCF85063_REG_CTRL1_CAP_SEL, reg);
>  }
>  
> +static int pcf85063_check_integrity(struct pcf85063 *pcf85063)
> +{
> +	int err;
> +	unsigned int val;
> +
> +	err = regmap_read(pcf85063->regmap, PCF85063_REG_SC, &val);
> +	if (err < 0) {
> +		dev_warn(&pcf85063->rtc->dev, "failed to read OS bit: %d",
> +			 err);
> +		return err;
> +	}
> +
> +	if (!(val & PCF85063_REG_SC_OS)) {
> +		dev_dbg(&pcf85063->rtc->dev, "integrity is ok\n");
> +		return 0;
> +	}
> +
> +	dev_dbg(&pcf85063->rtc->dev, "Power loss detected, restoring defaults\n");
> +	err = regmap_update_bits(pcf85063->regmap, PCF85063_REG_CTRL1,
> +				 (unsigned int)~PCF85063_REG_CTRL1_CAP_SEL, 0);
> +	if (err < 0)
> +		goto err_restore;
> +
> +	err = regmap_write(pcf85063->regmap, PCF85063_REG_CTRL2, 0);
> +	if (err < 0)
> +		goto err_restore;
> +
> +	err = regmap_write(pcf85063->regmap, PCF85063_REG_OFFSET, 0);
> +	if (err < 0)
> +		goto err_restore;
> +
> +	err = regmap_write(pcf85063->regmap, PCF85063_REG_RAM, 0);
> +	if (err < 0)
> +		goto err_restore;
> +

I'm not sure I get the use case because PCF85063_REG_CTRL2 should be
initialized properly after the driver is probed anyway. The other two
can be set from userspace once it detects the oscillator failure which
would be better at deciding the policy anyway.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
