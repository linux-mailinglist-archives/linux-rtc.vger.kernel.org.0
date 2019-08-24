Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF8999BDAC
	for <lists+linux-rtc@lfdr.de>; Sat, 24 Aug 2019 14:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbfHXMcj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 24 Aug 2019 08:32:39 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37764 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727921AbfHXMci (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 24 Aug 2019 08:32:38 -0400
Received: by mail-wm1-f68.google.com with SMTP id d16so11549784wme.2;
        Sat, 24 Aug 2019 05:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ktd3clal+9Q8WPdZn5LCmY9fuQdnPWX4A+ZgJMUiE8I=;
        b=gO3x0A47cXmFssogdqmmAgitAslpSJ93envk5YYYOjtmRdJg9v7WyxRISnMS0I0wPn
         Tn8IctoBtGQQoytrA4I0lqZvydxZMRIseViPZtq8SmAWqjxiYSQQ6/kMBbInyu/uk521
         qKxb55JAUCF/dgxrSeqYGVwEW2BGy/9fM2lV1ETwzFVBy0nbytOnnCS6PeoTN9isAPJs
         fd1fo/sbrmv4CRm5zTI5QocUjPZ7GKAp379so7OSXO+q1I1pPLBtJPIOG1RIr2ayd6ED
         Dnhg4Ta4EvGc9yNMMVTAS1CmQauUYFSs3rayKVXgMOyWnnfoiAXZ1Qi4DlDl78ww3XwE
         i4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ktd3clal+9Q8WPdZn5LCmY9fuQdnPWX4A+ZgJMUiE8I=;
        b=Df265qvAGbZeilaGwsoZ+Js1W9PyHEJgFKWBrZ2Z2VMmMoj+6LN4DCcQDT1ho9tF5u
         KaZ9V80jeZF++PffKzX/lG+zvBpRgDIht3ls7kMv5rSbvWfiMZ0EJAiKwut6SKqkw5R/
         EMS117nNrHejzwzXW4ehJNFtUw8SIy/vaGe4jWO71iNs6b0AXysmu7+9/Kq/mBaavI+r
         /84ANDLJWxXyg4zEFJ3owXOgRnHr5vGDpZe1f2QmzeHX98DJNsQTFFpkQswGPnAiKot/
         P/IPo5uQ3mESWNanf2CgH6CdLecaEU7xmcH6NqHx1CaKVlqATFTQClb++FgSyrakPKqj
         ACkA==
X-Gm-Message-State: APjAAAULAUdrdAU4dDZkokuL9hIpyLnnN6MuUfIJzZlvEW/Bhu9BA9k6
        c1OmVHmy8YQYBgaOCG7HciI=
X-Google-Smtp-Source: APXvYqxUMGmDffhilj07WIz41QP9O1qp6PIEePGrT5idlWi6fBJNl+Fmt7Dv7iNOePAomEQpGWejMg==
X-Received: by 2002:a7b:c7c2:: with SMTP id z2mr10383019wmk.33.1566649955525;
        Sat, 24 Aug 2019 05:32:35 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net. [86.58.59.25])
        by smtp.gmail.com with ESMTPSA id a23sm11839565wma.24.2019.08.24.05.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2019 05:32:34 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     linux-sunxi@googlegroups.com, megous@megous.com
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [linux-sunxi] [PATCH v2 2/3] rtc: sun6i: Add support for H6 RTC
Date:   Sat, 24 Aug 2019 14:32:32 +0200
Message-ID: <10586215.O0B29uHg7A@jernej-laptop>
In-Reply-To: <20190820151934.3860-3-megous@megous.com>
References: <20190820151934.3860-1-megous@megous.com> <20190820151934.3860-3-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi!

Dne torek, 20. avgust 2019 ob 17:19:33 CEST je megous@megous.com napisal(a):
> From: Ondrej Jirman <megous@megous.com>
> 
> RTC on H6 is mostly the same as on H5 and H3. It has slight differences
> mostly in features that are not yet supported by this driver.
> 
> Some differences are already stated in the comments in existing code.
> One other difference is that H6 has extra bit in LOSC_CTRL_REG, called
> EXT_LOSC_EN to enable/disable external low speed crystal oscillator.
> 
> It also has bit EXT_LOSC_STA in LOSC_AUTO_SWT_STA_REG, to check whether
> external low speed oscillator is working correctly.
> 
> This patch adds support for enabling LOSC when necessary:
> 
> - during reparenting
> - when probing the clock
> 
> H6 also has capacbility to automatically reparent RTC clock from
> external crystal oscillator, to internal RC oscillator, if external
> oscillator fails. This is enabled by default. Disable it during
> probe.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/rtc/rtc-sun6i.c | 40 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index d50ee023b559..b0c3752bed3f 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -32,9 +32,11 @@
>  /* Control register */
>  #define SUN6I_LOSC_CTRL				0x0000
>  #define SUN6I_LOSC_CTRL_KEY			(0x16aa << 16)
> +#define SUN6I_LOSC_CTRL_AUTO_SWT_BYPASS		BIT(15)

User manual says that above field is bit 14.

Best regards,
Jernej

>  #define SUN6I_LOSC_CTRL_ALM_DHMS_ACC		BIT(9)
>  #define SUN6I_LOSC_CTRL_RTC_HMS_ACC		BIT(8)
>  #define SUN6I_LOSC_CTRL_RTC_YMD_ACC		BIT(7)
> +#define SUN6I_LOSC_CTRL_EXT_LOSC_EN		BIT(4)
>  #define SUN6I_LOSC_CTRL_EXT_OSC			BIT(0)
>  #define SUN6I_LOSC_CTRL_ACC_MASK		GENMASK(9, 7)
> 
> @@ -128,6 +130,8 @@ struct sun6i_rtc_clk_data {
>  	unsigned int has_prescaler : 1;
>  	unsigned int has_out_clk : 1;
>  	unsigned int export_iosc : 1;
> +	unsigned int has_losc_en : 1;
> +	unsigned int has_auto_swt : 1;
>  };
> 
>  struct sun6i_rtc_dev {
> @@ -190,6 +194,10 @@ static int sun6i_rtc_osc_set_parent(struct clk_hw *hw,
> u8 index) val &= ~SUN6I_LOSC_CTRL_EXT_OSC;
>  	val |= SUN6I_LOSC_CTRL_KEY;
>  	val |= index ? SUN6I_LOSC_CTRL_EXT_OSC : 0;
> +	if (rtc->data->has_losc_en) {
> +		val &= ~SUN6I_LOSC_CTRL_EXT_LOSC_EN;
> +		val |= index ? SUN6I_LOSC_CTRL_EXT_LOSC_EN : 0;
> +	}
>  	writel(val, rtc->base + SUN6I_LOSC_CTRL);
>  	spin_unlock_irqrestore(&rtc->lock, flags);
> 
> @@ -215,6 +223,7 @@ static void __init sun6i_rtc_clk_init(struct device_node
> *node, const char *iosc_name = "rtc-int-osc";
>  	const char *clkout_name = "osc32k-out";
>  	const char *parents[2];
> +	u32 reg;
> 
>  	rtc = kzalloc(sizeof(*rtc), GFP_KERNEL);
>  	if (!rtc)
> @@ -235,9 +244,18 @@ static void __init sun6i_rtc_clk_init(struct
> device_node *node, goto err;
>  	}
> 
> +	reg = SUN6I_LOSC_CTRL_KEY;
> +	if (rtc->data->has_auto_swt) {
> +		/* Bypass auto-switch to int osc, on ext losc failure */
> +		reg |= SUN6I_LOSC_CTRL_AUTO_SWT_BYPASS;
> +		writel(reg, rtc->base + SUN6I_LOSC_CTRL);
> +	}
> +
>  	/* Switch to the external, more precise, oscillator */
> -	writel(SUN6I_LOSC_CTRL_KEY | SUN6I_LOSC_CTRL_EXT_OSC,
> -	       rtc->base + SUN6I_LOSC_CTRL);
> +	reg |= SUN6I_LOSC_CTRL_EXT_OSC;
> +	if (rtc->data->has_losc_en)
> +		reg |= SUN6I_LOSC_CTRL_EXT_LOSC_EN;
> +	writel(reg, rtc->base + SUN6I_LOSC_CTRL);
> 
>  	/* Yes, I know, this is ugly. */
>  	sun6i_rtc = rtc;
> @@ -345,6 +363,23 @@ CLK_OF_DECLARE_DRIVER(sun8i_h3_rtc_clk,
> "allwinner,sun8i-h3-rtc", CLK_OF_DECLARE_DRIVER(sun50i_h5_rtc_clk,
> "allwinner,sun50i-h5-rtc", sun8i_h3_rtc_clk_init);
> 
> +static const struct sun6i_rtc_clk_data sun50i_h6_rtc_data = {
> +	.rc_osc_rate = 16000000,
> +	.fixed_prescaler = 32,
> +	.has_prescaler = 1,
> +	.has_out_clk = 1,
> +	.export_iosc = 1,
> +	.has_losc_en = 1,
> +	.has_auto_swt = 1,
> +};
> +
> +static void __init sun50i_h6_rtc_clk_init(struct device_node *node)
> +{
> +	sun6i_rtc_clk_init(node, &sun50i_h6_rtc_data);
> +}
> +CLK_OF_DECLARE_DRIVER(sun50i_h6_rtc_clk, "allwinner,sun50i-h6-rtc",
> +		      sun50i_h6_rtc_clk_init);
> +
>  static const struct sun6i_rtc_clk_data sun8i_v3_rtc_data = {
>  	.rc_osc_rate = 32000,
>  	.has_out_clk = 1,
> @@ -675,6 +710,7 @@ static const struct of_device_id sun6i_rtc_dt_ids[] = {
>  	{ .compatible = "allwinner,sun8i-r40-rtc" },
>  	{ .compatible = "allwinner,sun8i-v3-rtc" },
>  	{ .compatible = "allwinner,sun50i-h5-rtc" },
> +	{ .compatible = "allwinner,sun50i-h6-rtc" },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, sun6i_rtc_dt_ids);




