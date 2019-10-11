Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39F30D3C1A
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Oct 2019 11:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbfJKJRm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Oct 2019 05:17:42 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:35287 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726585AbfJKJRl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 11 Oct 2019 05:17:41 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id A7857240004;
        Fri, 11 Oct 2019 09:17:39 +0000 (UTC)
Date:   Fri, 11 Oct 2019 11:17:38 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Parthiban Nallathambi <pn@denx.de>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, parthitce@gmail.com
Subject: Re: [PATCH] rtc: rv3028: add clkout support
Message-ID: <20191011091738.GC3125@piout.net>
References: <20190927141505.640751-1-pn@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190927141505.640751-1-pn@denx.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

thanks for the patch, minor comments below.

On 27/09/2019 16:15:05+0200, Parthiban Nallathambi wrote:
> +	ret = regmap_update_bits(rv3028->regmap, RV3028_STATUS,
> +				 RV3028_STATUS_CLKF, 0);
> +	if (ret < 0)
> +		return ret;
> +

This is already done earlier and this will not be enabled again unless
CLKIE is set which should not happen. So I don't think it is necessary
to do it once again here.

> +	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++) {
> +		if (clkout_rates[i] == rate) {
> +			ret = regmap_update_bits(rv3028->regmap,
> +						 RV3028_CLKOUT,
> +						 RV3028_CLKOUT_FD_MASK, i);
> +			if (ret < 0)
> +				return ret;
> +
> +			return regmap_write(rv3028->regmap, RV3028_CLKOUT,
> +				RV3028_CLKOUT_CLKSY | RV3028_CLKOUT_CLKOE);
> +		}
> +	}
> +
> +	return -EINVAL;
> +}


> +static int rv3028_clkout_register_clk(struct rv3028_data *rv3028,
> +				      struct i2c_client *client)
> +{
> +	int ret;
> +	struct clk *clk;
> +	struct clk_init_data init;
> +	struct device_node *node = client->dev.of_node;
> +
> +	/* disable the clkout output */
> +	ret = regmap_write(rv3028->regmap, RV3028_CLKOUT, 0x0);
> +	if (ret < 0)
> +		return ret;
> +

This is not what the user would expect and could introduce a glitch in 
the clock output every time the platform is booted. If there are no 
users of the clock, then you should probably let the core disable it 
once the boot has ended.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
