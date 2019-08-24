Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D11D9BDBC
	for <lists+linux-rtc@lfdr.de>; Sat, 24 Aug 2019 14:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbfHXMq6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 24 Aug 2019 08:46:58 -0400
Received: from vps.xff.cz ([195.181.215.36]:41612 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727590AbfHXMq6 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 24 Aug 2019 08:46:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1566650815; bh=aNpvpPT8BVQWDrxDFNrTrr4X2ZCwKP1MoxnWa5OvuUs=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=rQNlncvKNCm3AFPHneOnHrI8gPH/HPvT+6l0XnNzR+3bzG3/39hgUsSmid8fPB9id
         pKsC7R6de8+xMf3AmxXHck/jOF87F0fBvoI2RHWGaB+Y1ao/R6iqomOcTOIUe27tMM
         LIyli/5IiRe10/tlTlvfKFM7WpuzdElhz1YE4HCI=
Date:   Sat, 24 Aug 2019 14:46:54 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc:     linux-sunxi@googlegroups.com, Mark Rutland <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [linux-sunxi] [PATCH v2 2/3] rtc: sun6i: Add support for H6 RTC
Message-ID: <20190824124654.nqtlkam2gsaqsj77@core.my.home>
Mail-Followup-To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        linux-sunxi@googlegroups.com, Mark Rutland <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <20190820151934.3860-1-megous@megous.com>
 <20190820151934.3860-3-megous@megous.com>
 <10586215.O0B29uHg7A@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10586215.O0B29uHg7A@jernej-laptop>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On Sat, Aug 24, 2019 at 02:32:32PM +0200, Jernej Škrabec wrote:
> Hi!
> 
> Dne torek, 20. avgust 2019 ob 17:19:33 CEST je megous@megous.com napisal(a):
> > From: Ondrej Jirman <megous@megous.com>
> > 
> > RTC on H6 is mostly the same as on H5 and H3. It has slight differences
> > mostly in features that are not yet supported by this driver.
> > 
> > Some differences are already stated in the comments in existing code.
> > One other difference is that H6 has extra bit in LOSC_CTRL_REG, called
> > EXT_LOSC_EN to enable/disable external low speed crystal oscillator.
> > 
> > It also has bit EXT_LOSC_STA in LOSC_AUTO_SWT_STA_REG, to check whether
> > external low speed oscillator is working correctly.
> > 
> > This patch adds support for enabling LOSC when necessary:
> > 
> > - during reparenting
> > - when probing the clock
> > 
> > H6 also has capacbility to automatically reparent RTC clock from
> > external crystal oscillator, to internal RC oscillator, if external
> > oscillator fails. This is enabled by default. Disable it during
> > probe.
> > 
> > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> > ---
> >  drivers/rtc/rtc-sun6i.c | 40 ++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 38 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> > index d50ee023b559..b0c3752bed3f 100644
> > --- a/drivers/rtc/rtc-sun6i.c
> > +++ b/drivers/rtc/rtc-sun6i.c
> > @@ -32,9 +32,11 @@
> >  /* Control register */
> >  #define SUN6I_LOSC_CTRL				0x0000
> >  #define SUN6I_LOSC_CTRL_KEY			(0x16aa << 16)
> > +#define SUN6I_LOSC_CTRL_AUTO_SWT_BYPASS		BIT(15)
> 
> User manual says that above field is bit 14.

See the previous discussion, this is from BSP.

regards,
	o.

> Best regards,
> Jernej
> 
> >  #define SUN6I_LOSC_CTRL_ALM_DHMS_ACC		BIT(9)
> >  #define SUN6I_LOSC_CTRL_RTC_HMS_ACC		BIT(8)
> >  #define SUN6I_LOSC_CTRL_RTC_YMD_ACC		BIT(7)
> > +#define SUN6I_LOSC_CTRL_EXT_LOSC_EN		BIT(4)
> >  #define SUN6I_LOSC_CTRL_EXT_OSC			BIT(0)
> >  #define SUN6I_LOSC_CTRL_ACC_MASK		GENMASK(9, 7)
> > 
> > @@ -128,6 +130,8 @@ struct sun6i_rtc_clk_data {
> >  	unsigned int has_prescaler : 1;
> >  	unsigned int has_out_clk : 1;
> >  	unsigned int export_iosc : 1;
> > +	unsigned int has_losc_en : 1;
> > +	unsigned int has_auto_swt : 1;
> >  };
> > 
> >  struct sun6i_rtc_dev {
> > @@ -190,6 +194,10 @@ static int sun6i_rtc_osc_set_parent(struct clk_hw *hw,
> > u8 index) val &= ~SUN6I_LOSC_CTRL_EXT_OSC;
> >  	val |= SUN6I_LOSC_CTRL_KEY;
> >  	val |= index ? SUN6I_LOSC_CTRL_EXT_OSC : 0;
> > +	if (rtc->data->has_losc_en) {
> > +		val &= ~SUN6I_LOSC_CTRL_EXT_LOSC_EN;
> > +		val |= index ? SUN6I_LOSC_CTRL_EXT_LOSC_EN : 0;
> > +	}
> >  	writel(val, rtc->base + SUN6I_LOSC_CTRL);
> >  	spin_unlock_irqrestore(&rtc->lock, flags);
> > 
> > @@ -215,6 +223,7 @@ static void __init sun6i_rtc_clk_init(struct device_node
> > *node, const char *iosc_name = "rtc-int-osc";
> >  	const char *clkout_name = "osc32k-out";
> >  	const char *parents[2];
> > +	u32 reg;
> > 
> >  	rtc = kzalloc(sizeof(*rtc), GFP_KERNEL);
> >  	if (!rtc)
> > @@ -235,9 +244,18 @@ static void __init sun6i_rtc_clk_init(struct
> > device_node *node, goto err;
> >  	}
> > 
> > +	reg = SUN6I_LOSC_CTRL_KEY;
> > +	if (rtc->data->has_auto_swt) {
> > +		/* Bypass auto-switch to int osc, on ext losc failure */
> > +		reg |= SUN6I_LOSC_CTRL_AUTO_SWT_BYPASS;
> > +		writel(reg, rtc->base + SUN6I_LOSC_CTRL);
> > +	}
> > +
> >  	/* Switch to the external, more precise, oscillator */
> > -	writel(SUN6I_LOSC_CTRL_KEY | SUN6I_LOSC_CTRL_EXT_OSC,
> > -	       rtc->base + SUN6I_LOSC_CTRL);
> > +	reg |= SUN6I_LOSC_CTRL_EXT_OSC;
> > +	if (rtc->data->has_losc_en)
> > +		reg |= SUN6I_LOSC_CTRL_EXT_LOSC_EN;
> > +	writel(reg, rtc->base + SUN6I_LOSC_CTRL);
> > 
> >  	/* Yes, I know, this is ugly. */
> >  	sun6i_rtc = rtc;
> > @@ -345,6 +363,23 @@ CLK_OF_DECLARE_DRIVER(sun8i_h3_rtc_clk,
> > "allwinner,sun8i-h3-rtc", CLK_OF_DECLARE_DRIVER(sun50i_h5_rtc_clk,
> > "allwinner,sun50i-h5-rtc", sun8i_h3_rtc_clk_init);
> > 
> > +static const struct sun6i_rtc_clk_data sun50i_h6_rtc_data = {
> > +	.rc_osc_rate = 16000000,
> > +	.fixed_prescaler = 32,
> > +	.has_prescaler = 1,
> > +	.has_out_clk = 1,
> > +	.export_iosc = 1,
> > +	.has_losc_en = 1,
> > +	.has_auto_swt = 1,
> > +};
> > +
> > +static void __init sun50i_h6_rtc_clk_init(struct device_node *node)
> > +{
> > +	sun6i_rtc_clk_init(node, &sun50i_h6_rtc_data);
> > +}
> > +CLK_OF_DECLARE_DRIVER(sun50i_h6_rtc_clk, "allwinner,sun50i-h6-rtc",
> > +		      sun50i_h6_rtc_clk_init);
> > +
> >  static const struct sun6i_rtc_clk_data sun8i_v3_rtc_data = {
> >  	.rc_osc_rate = 32000,
> >  	.has_out_clk = 1,
> > @@ -675,6 +710,7 @@ static const struct of_device_id sun6i_rtc_dt_ids[] = {
> >  	{ .compatible = "allwinner,sun8i-r40-rtc" },
> >  	{ .compatible = "allwinner,sun8i-v3-rtc" },
> >  	{ .compatible = "allwinner,sun50i-h5-rtc" },
> > +	{ .compatible = "allwinner,sun50i-h6-rtc" },
> >  	{ /* sentinel */ },
> >  };
> >  MODULE_DEVICE_TABLE(of, sun6i_rtc_dt_ids);
> 
> 
> 
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
