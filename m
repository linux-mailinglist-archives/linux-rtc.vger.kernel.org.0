Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 724B278B01A
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Aug 2023 14:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbjH1M1j (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 28 Aug 2023 08:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232662AbjH1M1X (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 28 Aug 2023 08:27:23 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB61107;
        Mon, 28 Aug 2023 05:27:19 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45F1D1BF20B;
        Mon, 28 Aug 2023 12:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1693225637;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jT92x1VpqM6L8dx75FLolaWxUtRbvluTatFVmG6lbL4=;
        b=JXK1hAYVLOMvhA53K+H8BrVrtftFGeHltHgWSqR9QUhE28fYkj0pDqARZ346Eyt+sFRzPs
        bNxSXmr8pzxCno9PNdaMHg+QcuXv90ngInXxpUh6jMTZh6UGLgU693yyPSPoE2BQ0Whwzj
        ni3CeoqNADIvMg0ReRwNpNLQ1Y/0jqsiOmX9tD4RIl3/p/dyAn6rEZHI31ccDaF4x8hQ2P
        DwB3xwfpxif9naMvTYUH7fjJyRmSf7Cuv+0Gsdoj9gQqNCnzttwFg/biUyHNnlgcxJb2yf
        W4PYT+gudZAixV3A/3+iMitOh1VGUsQTE/sgxsXZe50Lpx83V1rpqtOuUscpLw==
Date:   Mon, 28 Aug 2023 14:27:13 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] rtc: rx8581: Simplify probe()
Message-ID: <2023082812271359f2dadd@mail.local>
References: <20230828090828.26897-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828090828.26897-1-biju.das.jz@bp.renesas.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 28/08/2023 10:08:28+0100, Biju Das wrote:
> Make similar OF and ID table and simplify probe() by replacing
> of_device_get_match_data()->i2c_get_match_data().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Note:
>  * This patch is only compile tested.

As you have access to a rx8571, please actually test.

> ---
>  drivers/rtc/rtc-rx8581.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-rx8581.c b/drivers/rtc/rtc-rx8581.c
> index 48efd61a114d..68dd8b9b52f9 100644
> --- a/drivers/rtc/rtc-rx8581.c
> +++ b/drivers/rtc/rtc-rx8581.c
> @@ -250,8 +250,7 @@ static const struct rx85x1_config rx8571_config = {
>  static int rx8581_probe(struct i2c_client *client)
>  {
>  	struct rx8581 *rx8581;
> -	const struct rx85x1_config *config = &rx8581_config;
> -	const void *data = of_device_get_match_data(&client->dev);
> +	const struct rx85x1_config *config = i2c_get_match_data(client);
>  	static struct nvmem_config nvmem_cfg[] = {
>  		{
>  			.name = "rx85x1-",
> @@ -273,9 +272,6 @@ static int rx8581_probe(struct i2c_client *client)
>  
>  	dev_dbg(&client->dev, "%s\n", __func__);
>  
> -	if (data)
> -		config = data;
> -
>  	rx8581 = devm_kzalloc(&client->dev, sizeof(struct rx8581), GFP_KERNEL);
>  	if (!rx8581)
>  		return -ENOMEM;
> @@ -307,7 +303,7 @@ static int rx8581_probe(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id rx8581_id[] = {
> -	{ "rx8581", 0 },
> +	{ "rx8581", (kernel_ulong_t)&rx8581_config },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, rx8581_id);
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
