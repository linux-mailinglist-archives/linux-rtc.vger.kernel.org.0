Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0011990429
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Aug 2019 16:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbfHPOuZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 16 Aug 2019 10:50:25 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:51219 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727291AbfHPOuZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 16 Aug 2019 10:50:25 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B2E85FF80C;
        Fri, 16 Aug 2019 14:50:22 +0000 (UTC)
Date:   Fri, 16 Aug 2019 16:50:22 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 3/4] rtc: sun6i: Don't reference clk_init_data after
 registration
Message-ID: <20190816145022.GD3545@piout.net>
References: <20190815160020.183334-1-sboyd@kernel.org>
 <20190815160020.183334-4-sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815160020.183334-4-sboyd@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 15/08/2019 09:00:19-0700, Stephen Boyd wrote:
> A future patch is going to change semantics of clk_register() so that
> clk_hw::init is guaranteed to be NULL after a clk is registered. Avoid
> referencing this member here so that we don't run into NULL pointer
> exceptions.
> 
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
> 
> Please ack so I can take this through clk tree.
> 
>  drivers/rtc/rtc-sun6i.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index c0e75c373605..d50ee023b559 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -279,7 +279,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
>  
>  	of_property_read_string_index(node, "clock-output-names", 1,
>  				      &clkout_name);
> -	rtc->ext_losc = clk_register_gate(NULL, clkout_name, rtc->hw.init->name,
> +	rtc->ext_losc = clk_register_gate(NULL, clkout_name, init.name,
>  					  0, rtc->base + SUN6I_LOSC_OUT_GATING,
>  					  SUN6I_LOSC_OUT_GATING_EN_OFFSET, 0,
>  					  &rtc->lock);
> -- 
> Sent by a computer through tubes
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
