Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 773712A42F
	for <lists+linux-rtc@lfdr.de>; Sat, 25 May 2019 13:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbfEYLk5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 25 May 2019 07:40:57 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:44247 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726585AbfEYLk5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 25 May 2019 07:40:57 -0400
Received: from localhost (lfbn-1-3034-80.w90-66.abo.wanadoo.fr [90.66.53.80])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6D48A20000C;
        Sat, 25 May 2019 11:40:52 +0000 (UTC)
Date:   Sat, 25 May 2019 13:40:52 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Hariprasad Kelam <hariprasad.kelam@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: ds1347: fix warning PTR_ERR_OR_ZERO can be used
Message-ID: <20190525114052.GI3274@piout.net>
References: <20190525095322.GA26245@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190525095322.GA26245@hari-Inspiron-1545>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 25/05/2019 15:23:22+0530, Hariprasad Kelam wrote:
> fix below warning reported by coccicheck
> 
> ./drivers/rtc/rtc-ds1347.c:158:1-3: WARNING: PTR_ERR_OR_ZERO can be used
> 

Could you elaborate on what is the exact improvement?

> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
> ---
>  drivers/rtc/rtc-ds1347.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ds1347.c b/drivers/rtc/rtc-ds1347.c
> index 938512c..b97b67f 100644
> --- a/drivers/rtc/rtc-ds1347.c
> +++ b/drivers/rtc/rtc-ds1347.c
> @@ -155,10 +155,7 @@ static int ds1347_probe(struct spi_device *spi)
>  	rtc = devm_rtc_device_register(&spi->dev, "ds1347",
>  				&ds1347_rtc_ops, THIS_MODULE);
>  
> -	if (IS_ERR(rtc))
> -		return PTR_ERR(rtc);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(rtc);
>  }
>  
>  static struct spi_driver ds1347_driver = {
> -- 
> 2.7.4
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
