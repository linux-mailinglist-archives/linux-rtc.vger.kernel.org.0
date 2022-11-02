Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 847D86168C8
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Nov 2022 17:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbiKBQ3L (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Nov 2022 12:29:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231560AbiKBQ2q (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Nov 2022 12:28:46 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC3B38A
        for <linux-rtc@vger.kernel.org>; Wed,  2 Nov 2022 09:24:32 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 9ED50FF807;
        Wed,  2 Nov 2022 16:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1667406271;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pWIqlD0tWUsvT469FTLw8UxwUte5xcglrKJgzv7kAZw=;
        b=ASe0poPmzezm9ET10q9hQKb6gt+ckoRatCmnoYoxOkGvL8s2POd0f0PMNiX8RpoVw8wpfe
        u9hsgxWU43AOvxxSyOqyiwIcUN9LAhKFuPu0dtKe/BrbAL3Sm5Ct6hJIUtVK5wmN8sh44b
        r84km7QXl/CH6v/fo9Izq5T3LRrBFs0M5kZhkXtWwXePOBSlopSATZTlBrLs0DLqn8J1Uu
        2jsFBevEY4iDdZ62/M2SzwEbD6COxvAW94CikP4LOiAeamE6yZOdBruFCbgbIZffuT/ngU
        6OYQfu7lhSyOUmthM/IbA8yzCw9cpJDXc9qCoAT4N1QwmjzcRasJswj9WbfzvA==
Date:   Wed, 2 Nov 2022 17:24:29 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Wolfram Sang <wsa@kernel.org>, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/9] rtc: ds1307: Convert to .probe_new()
Message-ID: <Y2KZvY4MNdmCjo3L@mail.local>
References: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
 <20221021130706.178687-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221021130706.178687-3-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 21/10/2022 15:06:59+0200, Uwe Kleine-König wrote:
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in .probe().
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/rtc/rtc-ds1307.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index d51565bcc189..70a6755a7d69 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -1712,9 +1712,9 @@ static const struct regmap_config regmap_config = {
>  	.val_bits = 8,
>  };
>  
> -static int ds1307_probe(struct i2c_client *client,
> -			const struct i2c_device_id *id)
> +static int ds1307_probe(struct i2c_client *client)
>  {
> +	const struct i2c_device_id *id;
>  	struct ds1307		*ds1307;
>  	const void		*match;
>  	int			err = -ENODEV;
> @@ -1746,7 +1746,7 @@ static int ds1307_probe(struct i2c_client *client,
>  	if (match) {
>  		ds1307->type = (enum ds_type)match;
>  		chip = &chips[ds1307->type];
> -	} else if (id) {
> +	} else if ((id = i2c_match_id(ds1307_id, client))) {

This is not proper style for the kernel and it introduces a checkpatch
error.

>  		chip = &chips[id->driver_data];
>  		ds1307->type = id->driver_data;
>  	} else {
> @@ -2011,7 +2011,7 @@ static struct i2c_driver ds1307_driver = {
>  		.name	= "rtc-ds1307",
>  		.of_match_table = ds1307_of_match,
>  	},
> -	.probe		= ds1307_probe,
> +	.probe_new	= ds1307_probe,
>  	.id_table	= ds1307_id,
>  };
>  
> -- 
> 2.37.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
