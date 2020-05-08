Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 302301CA9F6
	for <lists+linux-rtc@lfdr.de>; Fri,  8 May 2020 13:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgEHLtw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 8 May 2020 07:49:52 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:52367 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbgEHLtw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 8 May 2020 07:49:52 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 92B6220000C;
        Fri,  8 May 2020 11:49:48 +0000 (UTC)
Date:   Fri, 8 May 2020 13:49:47 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Biwen Li <biwen.li@oss.nxp.com>
Cc:     leoyang.li@nxp.com, robh+dt@kernel.org, mpe@ellerman.id.au,
        benh@kernel.crashing.org, a.zummo@towertech.it,
        devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>
Subject: Re: [PATCH 1/3] rtc: ds1374: add uie_unsupported property to drop
 warning
Message-ID: <20200508114947.GK34497@piout.net>
References: <20200508054925.48237-1-biwen.li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508054925.48237-1-biwen.li@oss.nxp.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 08/05/2020 13:49:23+0800, Biwen Li wrote:
> From: Biwen Li <biwen.li@nxp.com>
> 
> Add uie_unsupported property to drop warning as follows:
>     - $ hwclock.util-linux
>       hwclock.util-liux: select() /dev/rtc0
>       to wait for clock tick timed out
> 
> My case:
>     - RTC ds1374's INT pin is connected to VCC on T4240RDB,
>       then the RTC cannot inform cpu about the alarm
>       interrupt
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
>  drivers/rtc/rtc-ds1374.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c
> index 9c51a12cf70f..e530e887a17e 100644
> --- a/drivers/rtc/rtc-ds1374.c
> +++ b/drivers/rtc/rtc-ds1374.c
> @@ -651,6 +651,10 @@ static int ds1374_probe(struct i2c_client *client,
>  	if (ret)
>  		return ret;
>  
> +	if (of_property_read_bool(client->dev.of_node,
> +						 "uie_unsupported"))
> +		ds1374->rtc->uie_unsupported = true;
> +

This is not how this is supposed to work, either the RTC support uie or
don't, it is not board dependent and certainly doesn't require an
(undocumented) DT property.

>  #ifdef CONFIG_RTC_DRV_DS1374_WDT
>  	save_client = client;
>  	ret = misc_register(&ds1374_miscdev);
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
