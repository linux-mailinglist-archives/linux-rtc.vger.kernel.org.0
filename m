Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 002FB320B5
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Jun 2019 23:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbfFAVDl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 1 Jun 2019 17:03:41 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:46357 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfFAVDl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 1 Jun 2019 17:03:41 -0400
Received: from localhost (hy283-1-82-246-155-60.fbx.proxad.net [82.246.155.60])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 20B39240002;
        Sat,  1 Jun 2019 21:03:36 +0000 (UTC)
Date:   Sat, 1 Jun 2019 23:03:36 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Xidong Wang <wangxidong_97@163.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] rtc: rv3028: check return value
Message-ID: <20190601210336.GA3558@piout.net>
References: <1559114540-30878-1-git-send-email-wangxidong_97@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559114540-30878-1-git-send-email-wangxidong_97@163.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 29/05/2019 15:22:20+0800, Xidong Wang wrote:
> In rv3028_probe(), the return value of devm_regmap_init_i2c() should
> be checked before it is used.
> 
> Signed-off-by: Xidong Wang <wangxidong_97@163.com>
> ---
>  drivers/rtc/rtc-rv3028.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
> index 06884eb..29a8c4e 100644
> --- a/drivers/rtc/rtc-rv3028.c
> +++ b/drivers/rtc/rtc-rv3028.c
> @@ -626,6 +626,10 @@ static int rv3028_probe(struct i2c_client *client)
>  
>  	rv3028->regmap = devm_regmap_init_i2c(client, &regmap_config);
>  

Remove that empty line.

> +	if (IS_ERR(rv3028->regmap)) {
> +		return PTR_ERR(rv3028->regmap);
> +	}

Unnecessary braces.

> +
>  	i2c_set_clientdata(client, rv3028);
>  
>  	ret = regmap_read(rv3028->regmap, RV3028_STATUS, &status);
> -- 
> 2.7.4
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
