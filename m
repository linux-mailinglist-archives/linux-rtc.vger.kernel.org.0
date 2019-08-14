Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2E188D05F
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Aug 2019 12:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbfHNKJd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 14 Aug 2019 06:09:33 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:45251 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725888AbfHNKJd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 14 Aug 2019 06:09:33 -0400
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 9E531240007;
        Wed, 14 Aug 2019 10:09:30 +0000 (UTC)
Date:   Wed, 14 Aug 2019 12:09:30 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Biwen Li <biwen.li@nxp.com>
Cc:     a.zummo@towertech.it, leoyang.li@nxp.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: rtc: pcf85363/pcf85263: fix error that failed to run hwclock -w
Message-ID: <20190814100930.GI3600@piout.net>
References: <20190814093249.40065-1-biwen.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190814093249.40065-1-biwen.li@nxp.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 14/08/2019 17:32:49+0800, Biwen Li wrote:
> Issue:
>     # hwclock -w
>     hwclock: RTC_SET_TIME: Invalid argument
> 
> The patch fixes error when run command hwclock -w
> with rtc pcf85363/pcf85263
> 

Could you describe a bit more the issue and what causes it?

IIRC I wrote that code and it works on my pcf85363.

> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
>  drivers/rtc/rtc-pcf85363.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
> index a075e77617dc..3450d615974d 100644
> --- a/drivers/rtc/rtc-pcf85363.c
> +++ b/drivers/rtc/rtc-pcf85363.c
> @@ -166,7 +166,12 @@ static int pcf85363_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	buf[DT_YEARS] = bin2bcd(tm->tm_year % 100);
>  
>  	ret = regmap_bulk_write(pcf85363->regmap, CTRL_STOP_EN,
> -				tmp, sizeof(tmp));
> +				tmp, 2);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_bulk_write(pcf85363->regmap, DT_100THS,
> +				buf, sizeof(tmp) - 2);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
