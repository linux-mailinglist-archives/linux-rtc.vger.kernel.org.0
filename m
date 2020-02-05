Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF05E153968
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2020 21:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgBEUEq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 5 Feb 2020 15:04:46 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:34693 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbgBEUEq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 5 Feb 2020 15:04:46 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 4427C1C0002;
        Wed,  5 Feb 2020 20:04:44 +0000 (UTC)
Date:   Wed, 5 Feb 2020 21:04:44 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Prashant Malani <pmalani@chromium.org>
Cc:     linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v2 14/17] rtc: cros-ec: Use cros_ec_cmd()
Message-ID: <20200205200444.GC3290@piout.net>
References: <20200205190028.183069-1-pmalani@chromium.org>
 <20200205190028.183069-15-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205190028.183069-15-pmalani@chromium.org>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 05/02/2020 11:00:22-0800, Prashant Malani wrote:
> Replace cros_ec_cmd_xfer_status() with cros_ec_cmd() which does the
> message buffer setup and cleanup.
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
> 
> Changes in v2:
> - Updated to use new function name and parameter list.
> 
>  drivers/rtc/rtc-cros-ec.c | 27 ++++++++-------------------
>  1 file changed, 8 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
> index f7343c289cab73..6886100ad0b8b7 100644
> --- a/drivers/rtc/rtc-cros-ec.c
> +++ b/drivers/rtc/rtc-cros-ec.c
> @@ -33,16 +33,11 @@ static int cros_ec_rtc_get(struct cros_ec_device *cros_ec, u32 command,
>  			   u32 *response)
>  {
>  	int ret;
> -	struct {
> -		struct cros_ec_command msg;
> -		struct ec_response_rtc data;
> -	} __packed msg;
>  
> -	memset(&msg, 0, sizeof(msg));
> -	msg.msg.command = command;
> -	msg.msg.insize = sizeof(msg.data);
> +	struct ec_response_rtc data = {0};
>  
> -	ret = cros_ec_cmd_xfer_status(cros_ec, &msg.msg);
> +	ret = cros_ec_cmd(cros_ec, 0, command, NULL, 0, &data, sizeof(data),
> +			  NULL);
>  	if (ret < 0) {
>  		dev_err(cros_ec->dev,
>  			"error getting %s from EC: %d\n",
> @@ -51,7 +46,7 @@ static int cros_ec_rtc_get(struct cros_ec_device *cros_ec, u32 command,
>  		return ret;
>  	}
>  
> -	*response = msg.data.time;
> +	*response = data.time;
>  
>  	return 0;
>  }
> @@ -60,17 +55,11 @@ static int cros_ec_rtc_set(struct cros_ec_device *cros_ec, u32 command,
>  			   u32 param)
>  {
>  	int ret = 0;
> -	struct {
> -		struct cros_ec_command msg;
> -		struct ec_response_rtc data;
> -	} __packed msg;
> +	struct ec_response_rtc  data;
>  
> -	memset(&msg, 0, sizeof(msg));
> -	msg.msg.command = command;
> -	msg.msg.outsize = sizeof(msg.data);
> -	msg.data.time = param;
> -
> -	ret = cros_ec_cmd_xfer_status(cros_ec, &msg.msg);
> +	data.time = param;
> +	ret = cros_ec_cmd(cros_ec, 0, command, &data, sizeof(data), NULL, 0,
> +			  NULL);
>  	if (ret < 0) {
>  		dev_err(cros_ec->dev, "error setting %s on EC: %d\n",
>  			command == EC_CMD_RTC_SET_VALUE ? "time" : "alarm",
> -- 
> 2.25.0.341.g760bfbb309-goog
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
