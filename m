Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C932A567FF
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Jun 2019 13:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbfFZLyD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 26 Jun 2019 07:54:03 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42555 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbfFZLyD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 26 Jun 2019 07:54:03 -0400
Received: by mail-wr1-f67.google.com with SMTP id x17so2376920wrl.9
        for <linux-rtc@vger.kernel.org>; Wed, 26 Jun 2019 04:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=T1u8/nO2ihXA3qg4xnmoP2DlkB1dnveETSZSrMNRfSE=;
        b=oEEPl7PGp2yDGgQlpMIT9CDuA8EaBW2aDv4LKDx3jzAasANl+MgbubGI8TDqHbuRNy
         XfivoVJgBZ1Bep/dM5tMDxCu2yliu0Ff0UxJDZrHJ4xRmQYRga11k/qthaUoD2zgt2bC
         ceMy+Db8M+Lmut5drD8EUrPFy2Rb+kwGy2B3BV/YYU2egpNRi5myDVorKaXRBrEg62Su
         vPCNQoLMWtVv6nTfJseJmQR2w811Z+fiWY6MWZ7hM09+xLVsub4wmhCAtKivMnIUTkA6
         YRJL0JX+NuYiWCOy4/S6xgcC7Lt7BD/Apc6uiHhXtC36D2dvKZJRGAtc/LdEhtgmdIYj
         eioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=T1u8/nO2ihXA3qg4xnmoP2DlkB1dnveETSZSrMNRfSE=;
        b=K/uRY3tUGaz8qkWI5RxWHot0caCYaXz2Wj3z7QCAWyabylmFDBJFjko8C+/ZULjwzD
         LHVV6ijntbydnUHDqD6ZP0aN22F9nyWd2QdlNtPXb/0L5zmu9C3WuU+UNpCjY+ohQ4Gh
         +NzkbTpM9zoW9SpoiM5MlmGN7oOV5fXwmXgivym/2w3tYhLmUzrjLSPnoj/ajWQ5bCI7
         f1Ce7UTabkqKq8tuDbxwlYDJXgFyQx4kq4CosvsS7IVgomI9Bp2lWnSZmgVZUwV5nNFS
         q0t5WqEbzzMltGOrxe87ieTcFxTgNvwy+pxzFt1TOdNTPyTi7p42h0EbYUw/zeQKN2Q+
         kqaw==
X-Gm-Message-State: APjAAAWcPMXcnkSDbEq8wVExxFcN6ydkwCYNae64VaZDYGkfsprFSvxT
        t1K475wx9VxSyc/2/eFuIFrYMg==
X-Google-Smtp-Source: APXvYqwvxy0BQwbcO7zmMMj/LzCToTOsmyf+YRoJ7BmmuJFGLD3NT2IC/y1kE2vMhrdysj0lBqOPpw==
X-Received: by 2002:adf:fc45:: with SMTP id e5mr3506614wrs.240.1561550040713;
        Wed, 26 Jun 2019 04:54:00 -0700 (PDT)
Received: from dell ([2.27.35.164])
        by smtp.gmail.com with ESMTPSA id f12sm36496470wrg.5.2019.06.26.04.53.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2019 04:54:00 -0700 (PDT)
Date:   Wed, 26 Jun 2019 12:53:58 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Tony Xie <tony.xie@rock-chips.com>
Cc:     heiko@sntech.de, broonie@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, chenjh@rock-chips.com,
        xsf@rock-chips.com, zhangqing@rock-chips.com,
        huangtao@rock-chips.com
Subject: Re: [PATCH v10 1/6] mfd: rk808: remove the id_table
Message-ID: <20190626115358.GS21119@dell>
References: <20190621103258.8154-1-tony.xie@rock-chips.com>
 <20190621103258.8154-2-tony.xie@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190621103258.8154-2-tony.xie@rock-chips.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 21 Jun 2019, Tony Xie wrote:

> Remove the id_table because it's not used.
> 
> Signed-off-by: Tony Xie <tony.xie@rock-chips.com>
> ---
>  drivers/mfd/rk808.c | 9 ---------
>  1 file changed, 9 deletions(-)

Also, this patch already appears to be applied.

Once patches are taken from the set, you should avoid resending them.

> diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
> index 216fbf6adec9..94377782d208 100644
> --- a/drivers/mfd/rk808.c
> +++ b/drivers/mfd/rk808.c
> @@ -568,14 +568,6 @@ static int rk808_remove(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static const struct i2c_device_id rk808_ids[] = {
> -	{ "rk805" },
> -	{ "rk808" },
> -	{ "rk818" },
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(i2c, rk808_ids);
> -
>  static struct i2c_driver rk808_i2c_driver = {
>  	.driver = {
>  		.name = "rk808",
> @@ -583,7 +575,6 @@ static struct i2c_driver rk808_i2c_driver = {
>  	},
>  	.probe    = rk808_probe,
>  	.remove   = rk808_remove,
> -	.id_table = rk808_ids,
>  };
>  
>  module_i2c_driver(rk808_i2c_driver);

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
