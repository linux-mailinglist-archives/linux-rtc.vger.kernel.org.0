Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD43CE451
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2019 15:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727490AbfJGNxx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Oct 2019 09:53:53 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:44401 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbfJGNxx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Oct 2019 09:53:53 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B061AC0003;
        Mon,  7 Oct 2019 13:53:49 +0000 (UTC)
Date:   Mon, 7 Oct 2019 15:53:49 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH 03/10] rtc: armada38x: Use of_device_get_match_data()
Message-ID: <20191007135349.GN4254@piout.net>
References: <20191004214334.149976-1-swboyd@chromium.org>
 <20191004214334.149976-4-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191004214334.149976-4-swboyd@chromium.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/10/2019 14:43:27-0700, Stephen Boyd wrote:
> Use the more modern API to get the match data out of the of match table.
> This saves some code, lines, and nicely avoids referencing the match
> table when it is undefined with configurations where CONFIG_OF=n.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Gregory Clement <gregory.clement@bootlin.com>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: <linux-rtc@vger.kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
> 
> Please ack or pick for immediate merge so the last patch can be merged.
> 
>  drivers/rtc/rtc-armada38x.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-armada38x.c b/drivers/rtc/rtc-armada38x.c
> index 9351bd52477e..94d7c22fc4f3 100644
> --- a/drivers/rtc/rtc-armada38x.c
> +++ b/drivers/rtc/rtc-armada38x.c
> @@ -74,7 +74,7 @@ struct armada38x_rtc {
>  	int		    irq;
>  	bool		    initialized;
>  	struct value_to_freq *val_to_freq;
> -	struct armada38x_rtc_data *data;
> +	const struct armada38x_rtc_data *data;
>  };
>  
>  #define ALARM1	0
> @@ -501,17 +501,14 @@ static __init int armada38x_rtc_probe(struct platform_device *pdev)
>  {
>  	struct resource *res;
>  	struct armada38x_rtc *rtc;
> -	const struct of_device_id *match;
> -
> -	match = of_match_device(armada38x_rtc_of_match_table, &pdev->dev);
> -	if (!match)
> -		return -ENODEV;
>  
>  	rtc = devm_kzalloc(&pdev->dev, sizeof(struct armada38x_rtc),
>  			    GFP_KERNEL);
>  	if (!rtc)
>  		return -ENOMEM;
>  
> +	rtc->data = of_device_get_match_data(&pdev->dev);
> +
>  	rtc->val_to_freq = devm_kcalloc(&pdev->dev, SAMPLE_NR,
>  				sizeof(struct value_to_freq), GFP_KERNEL);
>  	if (!rtc->val_to_freq)
> @@ -553,7 +550,6 @@ static __init int armada38x_rtc_probe(struct platform_device *pdev)
>  		 */
>  		rtc->rtc_dev->ops = &armada38x_rtc_ops_noirq;
>  	}
> -	rtc->data = (struct armada38x_rtc_data *)match->data;
>  
>  	/* Update RTC-MBUS bridge timing parameters */
>  	rtc->data->update_mbus_timing(rtc);
> -- 
> Sent by a computer through tubes
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
