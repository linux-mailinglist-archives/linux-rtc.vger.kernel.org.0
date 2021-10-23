Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AAE74385DA
	for <lists+linux-rtc@lfdr.de>; Sun, 24 Oct 2021 00:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbhJWW5Q (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 23 Oct 2021 18:57:16 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:50057 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbhJWW5Q (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 23 Oct 2021 18:57:16 -0400
X-Greylist: delayed 3570 seconds by postgrey-1.27 at vger.kernel.org; Sat, 23 Oct 2021 18:57:15 EDT
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A46D7C0005;
        Sat, 23 Oct 2021 22:54:54 +0000 (UTC)
Date:   Sun, 24 Oct 2021 00:54:54 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     a.zummo@towertech.it, michal.simek@xilinx.com, sgoud@xilinx.com,
        shubhraj@xilinx.com, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com
Subject: Re: [PATCH V2] rtc: zynqmp: Add calibration set and get support
Message-ID: <YXSSvhUhg5NKZs1b@piout.net>
References: <20210927063837.38478-1-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927063837.38478-1-srinivas.neeli@xilinx.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 27/09/2021 12:08:37+0530, Srinivas Neeli wrote:
> Zynqmp RTC controller has a calibration feature to compensate
> time deviation due to input clock inaccuracy.
> Set and get calibration API's are used for setting and getting
> calibration value from the controller calibration register.
> 

Sorry for the late reply but I had to read and understand the TRM. This
RTC is actually quite unusua. At first, I couldn't understand what was
achieved.

> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> ---
> Changes in V2:
> -Removed unused macro.
> -Updated code with review comments.
> ---
>  drivers/rtc/rtc-zynqmp.c | 100 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 83 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> index f440bb52be92..3731ddfbd90f 100644
> --- a/drivers/rtc/rtc-zynqmp.c
> +++ b/drivers/rtc/rtc-zynqmp.c
> @@ -36,10 +36,15 @@
>  #define RTC_OSC_EN		BIT(24)
>  #define RTC_BATT_EN		BIT(31)
>  
> -#define RTC_CALIB_DEF		0x198233
> +#define RTC_CALIB_DEF		0x8000

Ok, so now I understand, this is defaulting to a 32kHz crystal

>  #define RTC_CALIB_MASK		0x1FFFFF
>  #define RTC_ALRM_MASK          BIT(1)
>  #define RTC_MSEC               1000
> +#define RTC_FR_MASK		0xF0000
> +#define RTC_FR_MAX_TICKS	16
> +#define RTC_OFFSET_MAX		150000
> +#define RTC_OFFSET_MIN		-150000
> +#define RTC_PPB			1000000000LL
>  
>  struct xlnx_rtc_dev {
>  	struct rtc_device	*rtc;
> @@ -61,13 +66,6 @@ static int xlnx_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	 */
>  	new_time = rtc_tm_to_time64(tm) + 1;
>  
> -	/*
> -	 * Writing into calibration register will clear the Tick Counter and
> -	 * force the next second to be signaled exactly in 1 second period
> -	 */
> -	xrtcdev->calibval &= RTC_CALIB_MASK;
> -	writel(xrtcdev->calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
> -

This was the proper thing to do, you should read RTC_CALIB_RD and write
it to RTC_CALIB_WR.

>  	writel(new_time, xrtcdev->reg_base + RTC_SET_TM_WR);
>  
>  	/*
> @@ -174,14 +172,76 @@ static void xlnx_init_rtc(struct xlnx_rtc_dev *xrtcdev)
>  	rtc_ctrl |= RTC_BATT_EN;
>  	writel(rtc_ctrl, xrtcdev->reg_base + RTC_CTRL);
>  
> -	/*
> -	 * Based on crystal freq of 33.330 KHz
> -	 * set the seconds counter and enable, set fractions counter
> -	 * to default value suggested as per design spec
> -	 * to correct RTC delay in frequency over period of time.
> +	/* Update calibvalue */
> +	xrtcdev->calibval = readl(xrtcdev->reg_base + RTC_CALIB_RD);
> +}
> +
> +static int xlnx_rtc_read_offset(struct device *dev, long *offset)
> +{
> +	struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
> +	long offset_val = 0;
> +	unsigned int tick_mult = RTC_PPB / (xrtcdev->calibval & RTC_TICK_MASK);
> +
> +	/* Offset with seconds ticks */
> +	offset_val = xrtcdev->calibval & RTC_TICK_MASK;
> +	offset_val = offset_val - RTC_CALIB_DEF;
> +	offset_val = offset_val * tick_mult;
> +
> +	/* Offset with fractional ticks */
> +	if (xrtcdev->calibval & RTC_FR_EN)
> +		offset_val += ((xrtcdev->calibval & RTC_FR_MASK) >> RTC_FR_DATSHIFT)
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
> +	unsigned int calibval;
> +	int fract_offset;
> +	unsigned int tick_mult = RTC_PPB / (xrtcdev->calibval & RTC_TICK_MASK);
> +

This part is awful but I get how you came to that. You must not rely on
the previous value to set the current value. What you are trying to
achieve here is get the oscillator frequency. This has to be represented
properly in the device tree. This RTC takes an input fixed clock and
then the driver can use clk_get_rate.  xrtcdev->calibval is not needed
but the original oscillator rate is. The whole computation can then be
simplified because a change in Max_Tick is RTC_PPB/xtal_freq and a change in
Fraction_Data is RTC_PPB/(16*xtal_freq). So it is just a matter of
finding the closest Max_Tick, rounded down and then finding the closest
Fraction_Data to add.

> +	/* Make sure offset value is within supported range */
> +	if (offset < RTC_OFFSET_MIN || offset > RTC_OFFSET_MAX)
> +		return -ERANGE;
> +

RTC_OFFSET_MIN and RTC_OFFSET_MAX can't be static, they actually depend
on the oscillator frequency.

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
>  	 */
> -	xrtcdev->calibval &= RTC_CALIB_MASK;
> -	writel(xrtcdev->calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
> +	calibval = max_tick + RTC_CALIB_DEF;
> +
> +	if (fract_tick)
> +		calibval |= RTC_FR_EN;
> +
> +	calibval |= (fract_tick << RTC_FR_DATSHIFT);
> +
> +	writel(calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
> +	xrtcdev->calibval = calibval;
> +
> +	return 0;
>  }
>  
>  static const struct rtc_class_ops xlnx_rtc_ops = {
> @@ -190,6 +250,8 @@ static const struct rtc_class_ops xlnx_rtc_ops = {
>  	.read_alarm	  = xlnx_rtc_read_alarm,
>  	.set_alarm	  = xlnx_rtc_set_alarm,
>  	.alarm_irq_enable = xlnx_rtc_alarm_irq_enable,
> +	.read_offset	  = xlnx_rtc_read_offset,
> +	.set_offset	  = xlnx_rtc_set_offset,
>  };
>  
>  static irqreturn_t xlnx_rtc_interrupt(int irq, void *id)
> @@ -215,6 +277,7 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
>  {
>  	struct xlnx_rtc_dev *xrtcdev;
>  	int ret;
> +	unsigned int calibval;
>  
>  	xrtcdev = devm_kzalloc(&pdev->dev, sizeof(*xrtcdev), GFP_KERNEL);
>  	if (!xrtcdev)
> @@ -256,9 +319,12 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = of_property_read_u32(pdev->dev.of_node, "calibration",
> -				   &xrtcdev->calibval);
> +				   &calibval);

Honestly, here, I would just drop the calibration property, add a clocks
property and do a clk_get_rate to get the xtal frequency. if the clocks
property is not there, just assume it is 32768. This won't break
existing board as long as the driver avoids setting the value forcefully.

>  	if (ret)
> -		xrtcdev->calibval = RTC_CALIB_DEF;
> +		calibval = RTC_CALIB_DEF;
> +	ret = readl(xrtcdev->reg_base + RTC_CALIB_RD);
> +	if (!ret)
> +		writel(calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
>  
>  	xlnx_init_rtc(xrtcdev);
>  
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
