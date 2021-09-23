Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1344541622A
	for <lists+linux-rtc@lfdr.de>; Thu, 23 Sep 2021 17:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233143AbhIWPid (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 23 Sep 2021 11:38:33 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:35651 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241735AbhIWPic (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 23 Sep 2021 11:38:32 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id CFE0824000F;
        Thu, 23 Sep 2021 15:36:55 +0000 (UTC)
Date:   Thu, 23 Sep 2021 17:36:55 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc:     linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Joerg Reiling <joerg.reiling@jenoptik.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: rtc-isl12022: add isl12020 device support
Message-ID: <YUyfF5VRfOkdC4wn@piout.net>
References: <YUx43WuvwrYIvjxe@monster.powergraphx.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUx43WuvwrYIvjxe@monster.powergraphx.local>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 23/09/2021 12:53:49+0000, Wilken Gottwalt wrote:
> Adds the isl12020 device, which is fully compatible to isl12022.
> 

Do you know what is differing between both parts? If there is nothing
relevant to linux, maybe we could just avoid adding a new compatible
string.

> Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
> Signed-off-by: Joerg Reiling <joerg.reiling@jenoptik.com>
> ---
>  drivers/rtc/rtc-isl12022.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
> index 961bd5d1d109..c62770ec99c9 100644
> --- a/drivers/rtc/rtc-isl12022.c
> +++ b/drivers/rtc/rtc-isl12022.c
> @@ -257,6 +257,8 @@ static int isl12022_probe(struct i2c_client *client,
>  static const struct of_device_id isl12022_dt_match[] = {
>  	{ .compatible = "isl,isl12022" }, /* for backward compat., don't use */
>  	{ .compatible = "isil,isl12022" },
> +	{ .compatible = "isl,isl12020" }, /* for backward compat., don't use */

Please, do not add this compatible string.

> +	{ .compatible = "isil,isl12020" },

You also need to document this string in Documentation/devicetree/bindings/rtc/trivial-rtc.yaml

>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, isl12022_dt_match);
> @@ -264,6 +266,7 @@ MODULE_DEVICE_TABLE(of, isl12022_dt_match);
>  
>  static const struct i2c_device_id isl12022_id[] = {
>  	{ "isl12022", 0 },
> +	{ "isl12020", 0 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, isl12022_id);
> -- 
> 2.33.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
