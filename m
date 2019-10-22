Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7C3DFEA1
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Oct 2019 09:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387957AbfJVHu1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 22 Oct 2019 03:50:27 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44820 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387938AbfJVHu1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 22 Oct 2019 03:50:27 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 05D0D28C273
Subject: Re: [PATCH 2/2] rtc: cros-ec: let the core handle rtc range
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        linux-kernel@vger.kernel.org
References: <20191016201414.30934-1-alexandre.belloni@bootlin.com>
 <20191016201414.30934-2-alexandre.belloni@bootlin.com>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <e8ad9e0f-e1c1-3d37-192b-1b5b2ad621fb@collabora.com>
Date:   Tue, 22 Oct 2019 09:50:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016201414.30934-2-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

On 16/10/19 22:14, Alexandre Belloni wrote:
> Let the rtc core check the date/time against the RTC range.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Tested on few devices just to make sure nothing is broken, the change looks good
to me and works as expected.

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>


> ---
>  drivers/rtc/rtc-cros-ec.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
> index da209d00731e..d043d30f05bc 100644
> --- a/drivers/rtc/rtc-cros-ec.c
> +++ b/drivers/rtc/rtc-cros-ec.c
> @@ -107,11 +107,7 @@ static int cros_ec_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  	struct cros_ec_rtc *cros_ec_rtc = dev_get_drvdata(dev);
>  	struct cros_ec_device *cros_ec = cros_ec_rtc->cros_ec;
>  	int ret;
> -	time64_t time;
> -
> -	time = rtc_tm_to_time64(tm);
> -	if (time < 0 || time > U32_MAX)
> -		return -EINVAL;
> +	time64_t time = rtc_tm_to_time64(tm);
>  
>  	ret = cros_ec_rtc_set(cros_ec, EC_CMD_RTC_SET_VALUE, (u32)time);
>  	if (ret < 0) {
> @@ -348,12 +344,17 @@ static int cros_ec_rtc_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	cros_ec_rtc->rtc = devm_rtc_device_register(&pdev->dev, DRV_NAME,
> -						    &cros_ec_rtc_ops,
> -						    THIS_MODULE);
> +	cros_ec_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
>  	if (IS_ERR(cros_ec_rtc->rtc))
>  		return PTR_ERR(cros_ec_rtc->rtc);
>  
> +	cros_ec_rtc->rtc->ops = &cros_ec_rtc_ops;
> +	cros_ec_rtc->rtc->range_max = U32_MAX;
> +
> +	ret = rtc_register_device(cros_ec_rtc->rtc);
> +	if (ret)
> +		return ret;
> +
>  	/* Get RTC events from the EC. */
>  	cros_ec_rtc->notifier.notifier_call = cros_ec_rtc_event;
>  	ret = blocking_notifier_chain_register(&cros_ec->event_notifier,
> 
