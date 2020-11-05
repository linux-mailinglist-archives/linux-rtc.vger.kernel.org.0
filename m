Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E44C2A8990
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Nov 2020 23:09:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732414AbgKEWJl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Nov 2020 17:09:41 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:46203 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731508AbgKEWJl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Nov 2020 17:09:41 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 69EA11C000B;
        Thu,  5 Nov 2020 22:09:39 +0000 (UTC)
Date:   Thu, 5 Nov 2020 23:09:38 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Heiko Stuebner <heiko@sntech.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCH] rtc: hym8563: enable wakeup by default
Message-ID: <20201105220938.GG1034841@piout.net>
References: <4a52fe66b327fd1974f86b7deb7e2c06d74fe64f.1604613067.git.guillaume.tucker@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a52fe66b327fd1974f86b7deb7e2c06d74fe64f.1604613067.git.guillaume.tucker@collabora.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 05/11/2020 22:01:10+0000, Guillaume Tucker wrote:
> Enable wakeup by default in the hym8563 driver to match the behaviour
> implemented by the majority of RTC drivers.  As per the description of
> device_init_wakeup(), it should be enabled for "devices that everyone
> expects to be wakeup sources".  One would expect this to be the case
> with a real-time clock.
> 

Actually, the proper way of doing it for a discrete RTC is to only
enable wakeup if the irq request is successful or when the wakeup-source
property is present on the node.

> Fixes: dcaf03849352 ("rtc: add hym8563 rtc-driver")
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> ---
>  drivers/rtc/rtc-hym8563.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-hym8563.c b/drivers/rtc/rtc-hym8563.c
> index 0fb79c4afb46..6fccfe634d57 100644
> --- a/drivers/rtc/rtc-hym8563.c
> +++ b/drivers/rtc/rtc-hym8563.c
> @@ -527,7 +527,7 @@ static int hym8563_probe(struct i2c_client *client,
>  	hym8563->client = client;
>  	i2c_set_clientdata(client, hym8563);
>  
> -	device_set_wakeup_capable(&client->dev, true);
> +	device_init_wakeup(&client->dev, true);
>  
>  	ret = hym8563_init_device(client);
>  	if (ret) {
> -- 
> 2.20.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
