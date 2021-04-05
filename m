Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3C0A354643
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Apr 2021 19:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234451AbhDERnY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Apr 2021 13:43:24 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:42041 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234396AbhDERnY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Apr 2021 13:43:24 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id ACA0440004;
        Mon,  5 Apr 2021 17:43:16 +0000 (UTC)
Date:   Mon, 5 Apr 2021 19:43:16 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Liam Beguin <liambeguin@gmail.com>
Cc:     a.zummo@towertech.it, panfilov.artyom@gmail.com,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1 4/4] rtc: ab-eoz9: make use of RTC_FEATURE_ALARM
Message-ID: <YGtMNITMoImJkiuh@piout.net>
References: <20210405141334.3884528-1-liambeguin@gmail.com>
 <20210405141334.3884528-5-liambeguin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210405141334.3884528-5-liambeguin@gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 05/04/2021 10:13:34-0400, Liam Beguin wrote:
> From: Liam Beguin <lvb@xiphos.com>
> 
> Move the alarm callbacks in rtc_ops and use RTC_FEATURE_ALARM to notify
> the core whether alarm capabilities are available or not.
> 

Please squash that one with the previous one.

alse, the series looks good, thanks for working on that!

> Signed-off-by: Liam Beguin <lvb@xiphos.com>
> ---
>  drivers/rtc/rtc-ab-eoz9.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
> index 4c8ba62fb1c6..a8256747d95d 100644
> --- a/drivers/rtc/rtc-ab-eoz9.c
> +++ b/drivers/rtc/rtc-ab-eoz9.c
> @@ -368,11 +368,6 @@ static int abeoz9_rtc_setup(struct device *dev, struct device_node *node)
>  }
>  
>  static const struct rtc_class_ops rtc_ops = {
> -	.read_time = abeoz9_rtc_get_time,
> -	.set_time  = abeoz9_rtc_set_time,
> -};
> -
> -static const struct rtc_class_ops rtc_alarm_ops = {
>  	.read_time = abeoz9_rtc_get_time,
>  	.set_time = abeoz9_rtc_set_time,
>  	.read_alarm = abeoz9_rtc_read_alarm,
> @@ -540,6 +535,7 @@ static int abeoz9_probe(struct i2c_client *client,
>  	data->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>  	data->rtc->range_max = RTC_TIMESTAMP_END_2099;
>  	data->rtc->uie_unsupported = 1;
> +	clear_bit(RTC_FEATURE_ALARM, data->rtc->features);
>  
>  	if (client->irq > 0) {
>  		ret = devm_request_threaded_irq(dev, client->irq, NULL,
> @@ -554,7 +550,7 @@ static int abeoz9_probe(struct i2c_client *client,
>  
>  	if (client->irq > 0 || device_property_read_bool(dev, "wakeup-source")) {
>  		ret = device_init_wakeup(dev, true);
> -		data->rtc->ops = &rtc_alarm_ops;
> +		set_bit(RTC_FEATURE_ALARM, data->rtc->features);
>  	}
>  
>  	ret = devm_rtc_register_device(data->rtc);
> -- 
> 2.30.1.489.g328c10930387
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
