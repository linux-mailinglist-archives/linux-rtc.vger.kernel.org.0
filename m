Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C64BC171638
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Feb 2020 12:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728893AbgB0Lp6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 27 Feb 2020 06:45:58 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:49603 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728888AbgB0Lp6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 27 Feb 2020 06:45:58 -0500
X-Originating-IP: 86.202.111.97
Received: from localhost (lfbn-lyo-1-16-97.w86-202.abo.wanadoo.fr [86.202.111.97])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 821602000A;
        Thu, 27 Feb 2020 11:45:54 +0000 (UTC)
Date:   Thu, 27 Feb 2020 12:45:54 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     a.zummo@towertech.it, michal.simek@xilinx.com, sgoud@xilinx.com,
        shubhraj@xilinx.com, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com, Srinivas Goud <srinivas.goud@xilinx.com>
Subject: Re: [PATCH] rtc: zynqmp: Add calibration set and get support
Message-ID: <20200227114554.GA3436@piout.net>
References: <1582191106-30431-1-git-send-email-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582191106-30431-1-git-send-email-srinivas.neeli@xilinx.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 20/02/2020 15:01:46+0530, Srinivas Neeli wrote:
> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> index 4b1077e2f826..b4118e9e4fcc 100644
> --- a/drivers/rtc/rtc-zynqmp.c
> +++ b/drivers/rtc/rtc-zynqmp.c
> @@ -40,6 +40,12 @@
>  #define RTC_CALIB_MASK		0x1FFFFF
>  #define RTC_ALRM_MASK          BIT(1)
>  #define RTC_MSEC               1000
> +#define RTC_FR_MASK             0xF0000
> +#define RTC_SEC_MAX_VAL         0xFFFFFFFF

This value is not used

> +#define RTC_FR_MAX_TICKS        16
> +#define RTC_OFFSET_MAX          150000
> +#define RTC_OFFSET_MIN          -150000
> +#define RTC_PPB                 1000000000LL
>  
>  struct xlnx_rtc_dev {
>  	struct rtc_device	*rtc;
> @@ -184,12 +190,84 @@ static void xlnx_init_rtc(struct xlnx_rtc_dev *xrtcdev)
>  	writel(xrtcdev->calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
>  }
>  
> +static int xlnx_rtc_read_offset(struct device *dev, long *offset)
> +{
> +	struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
> +	long offset_val;
> +	unsigned int reg;
> +	unsigned int tick_mult = RTC_PPB / xrtcdev->calibval;
> +

I don't get why you are not simply reusing xrtcdev->calibval. Using
.set_offset has to take precedence on any value that would have been set
using DT. Ideally, the DT binding should be removed too.

Currently, the calibration value is overwritten using the DT value
every time .set_time is called because xrtcdev->calibval is never
updated.

> +	reg = readl(xrtcdev->reg_base + RTC_CALIB_RD);
> +
> +	/* Offset with seconds ticks */
> +	offset_val = reg & RTC_TICK_MASK;
> +	offset_val = offset_val - xrtcdev->calibval;
> +	offset_val = offset_val * tick_mult;
> +
> +	/* Offset with fractional ticks */
> +	if (reg & RTC_FR_EN)
> +		offset_val += ((reg & RTC_FR_MASK) >> RTC_FR_DATSHIFT)
> +			* (tick_mult / RTC_FR_MAX_TICKS);
> +	*offset = offset_val;
> +
> +	return 0;
> +}
> +
> +static int xlnx_rtc_set_offset(struct device *dev, long offset)
> +{
> +	struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
> +	short int  max_tick;
> +	unsigned char fract_tick = 0;
> +	unsigned int  calibval;
> +	int fract_offset;
> +	unsigned int tick_mult = RTC_PPB / xrtcdev->calibval;
> +
> +	/* Make sure offset value is within supported range */
> +	if (offset < RTC_OFFSET_MIN || offset > RTC_OFFSET_MAX)
> +		return -ERANGE;
> +
> +	/* Number ticks for given offset */
> +	max_tick = div_s64_rem(offset, tick_mult, &fract_offset);
> +
> +	/* Number fractional ticks for given offset */
> +	if (fract_offset) {
> +		if (fract_offset < 0) {
> +			fract_offset = fract_offset + tick_mult;
> +			max_tick--;
> +		}
> +		if (fract_offset > (tick_mult / RTC_FR_MAX_TICKS)) {
> +			for (fract_tick = 1; fract_tick < 16; fract_tick++) {
> +				if (fract_offset <=
> +				    (fract_tick *
> +				     (tick_mult / RTC_FR_MAX_TICKS)))
> +					break;
> +			}
> +		}
> +	}
> +
> +	/* Zynqmp RTC uses second and fractional tick
> +	 * counters for compensation
> +	 */
> +	calibval = max_tick + xrtcdev->calibval;
> +
> +	if (fract_tick)
> +		calibval |= RTC_FR_EN;
> +
> +	calibval |= (fract_tick <<  RTC_FR_DATSHIFT);
> +
> +	writel(calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
> +
> +	return 0;
> +}
> +
>  static const struct rtc_class_ops xlnx_rtc_ops = {
>  	.set_time	  = xlnx_rtc_set_time,
>  	.read_time	  = xlnx_rtc_read_time,
>  	.read_alarm	  = xlnx_rtc_read_alarm,
>  	.set_alarm	  = xlnx_rtc_set_alarm,
>  	.alarm_irq_enable = xlnx_rtc_alarm_irq_enable,
> +	.read_offset    = xlnx_rtc_read_offset,
> +	.set_offset     = xlnx_rtc_set_offset,
>  };
>  
>  static irqreturn_t xlnx_rtc_interrupt(int irq, void *id)
> -- 
> 2.7.4
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
