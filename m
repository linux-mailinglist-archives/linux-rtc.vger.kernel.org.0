Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD08354618
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Apr 2021 19:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238705AbhDERhF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Apr 2021 13:37:05 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:45027 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238453AbhDERhF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Apr 2021 13:37:05 -0400
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 07A47100008;
        Mon,  5 Apr 2021 17:36:57 +0000 (UTC)
Date:   Mon, 5 Apr 2021 19:36:57 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Liam Beguin <liambeguin@gmail.com>
Cc:     a.zummo@towertech.it, panfilov.artyom@gmail.com,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1 1/4] rtc: ab-eoz9: make use of regmap local variable
Message-ID: <YGtKuSbNVKm9aYau@piout.net>
References: <20210405141334.3884528-1-liambeguin@gmail.com>
 <20210405141334.3884528-2-liambeguin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210405141334.3884528-2-liambeguin@gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 05/04/2021 10:13:31-0400, Liam Beguin wrote:
> From: Liam Beguin <lvb@xiphos.com>
> 
> Make use of the regmap local variable to shorten long lines.
> 

As you are still using data->regmap in the subsequent patches, I don't
see the point of this one. Moreover, you could have everything on one
line without the intermediate variable.

> Signed-off-by: Liam Beguin <lvb@xiphos.com>
> ---
>  drivers/rtc/rtc-ab-eoz9.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
> index b20d8f26dcdb..2568984fb8d3 100644
> --- a/drivers/rtc/rtc-ab-eoz9.c
> +++ b/drivers/rtc/rtc-ab-eoz9.c
> @@ -124,6 +124,7 @@ static int abeoz9_reset_validity(struct regmap *regmap)
>  static int abeoz9_rtc_get_time(struct device *dev, struct rtc_time *tm)
>  {
>  	struct abeoz9_rtc_data *data = dev_get_drvdata(dev);
> +	struct regmap *regmap = data->regmap;
>  	u8 regs[ABEOZ9_SEC_LEN];
>  	int ret;
>  
> @@ -131,9 +132,7 @@ static int abeoz9_rtc_get_time(struct device *dev, struct rtc_time *tm)
>  	if (ret)
>  		return ret;
>  
> -	ret = regmap_bulk_read(data->regmap, ABEOZ9_REG_SEC,
> -			       regs,
> -			       sizeof(regs));
> +	ret = regmap_bulk_read(regmap, ABEOZ9_REG_SEC, regs, sizeof(regs));
>  	if (ret) {
>  		dev_err(dev, "reading RTC time failed (%d)\n", ret);
>  		return ret;
> @@ -174,10 +173,7 @@ static int abeoz9_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	regs[ABEOZ9_REG_MONTHS - ABEOZ9_REG_SEC] = bin2bcd(tm->tm_mon + 1);
>  	regs[ABEOZ9_REG_YEARS - ABEOZ9_REG_SEC] = bin2bcd(tm->tm_year - 100);
>  
> -	ret = regmap_bulk_write(data->regmap, ABEOZ9_REG_SEC,
> -				regs,
> -				sizeof(regs));
> -
> +	ret = regmap_bulk_write(regmap, ABEOZ9_REG_SEC, regs, sizeof(regs));
>  	if (ret) {
>  		dev_err(dev, "set RTC time failed (%d)\n", ret);
>  		return ret;
> -- 
> 2.30.1.489.g328c10930387
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
