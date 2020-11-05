Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6C42A899D
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Nov 2020 23:19:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732527AbgKEWT1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Nov 2020 17:19:27 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:46807 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731508AbgKEWT1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Nov 2020 17:19:27 -0500
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 2ECAA240005;
        Thu,  5 Nov 2020 22:19:25 +0000 (UTC)
Date:   Thu, 5 Nov 2020 23:19:24 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Claudius Heine <ch@denx.de>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Henning Schild <henning.schild@siemens.com>,
        Johannes Hahn <johannes-hahn@siemens.com>
Subject: Re: [PATCH 1/2] rtc: rx6110: add i2c support
Message-ID: <20201105221924.GI1034841@piout.net>
References: <20201104102629.3422048-1-ch@denx.de>
 <20201104102629.3422048-2-ch@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104102629.3422048-2-ch@denx.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/11/2020 11:26:28+0100, Claudius Heine wrote:
> +static int rx6110_i2c_probe(struct i2c_client *client,
> +			    const struct i2c_device_id *id)
> +{
> +	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
> +	struct rx6110_data *rx6110;
> +	int err;
> +
> +	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA
> +				| I2C_FUNC_SMBUS_I2C_BLOCK)) {
> +		dev_err(&adapter->dev,
> +			"doesn't support required functionality\n");
> +		return -EIO;
> +	}
> +
> +	rx6110 = devm_kzalloc(&client->dev, sizeof(*rx6110), GFP_KERNEL);
> +	if (!rx6110)
> +		return -ENOMEM;
> +
> +	rx6110->regmap = devm_regmap_init_i2c(client, &regmap_i2c_config);
> +	if (IS_ERR(rx6110->regmap)) {
> +		dev_err(&client->dev, "regmap init failed for rtc rx6110\n");
> +		return PTR_ERR(rx6110->regmap);
> +	}
> +
> +	i2c_set_clientdata(client, rx6110);
> +
> +	rx6110->rtc = devm_rtc_device_register(&client->dev,
> +					       client->name,
> +					       &rx6110_rtc_ops, THIS_MODULE);
> +
> +	if (IS_ERR(rx6110->rtc))
> +		return PTR_ERR(rx6110->rtc);
> +
> +	err = rx6110_init(rx6110);
> +	if (err)
> +		return err;
> +
> +	rx6110->rtc->max_user_freq = 1;
> +

I would prefer if you could have a common function doing the RTC
registration and init for both i2c and spi. It wouldn't do much yet but
ideally, it would set the RTC range too and it would be better to not
have to duplicate that.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
