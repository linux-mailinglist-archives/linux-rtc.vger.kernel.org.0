Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45786DFE98
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Oct 2019 09:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387692AbfJVHsu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 22 Oct 2019 03:48:50 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44812 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729458AbfJVHsu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 22 Oct 2019 03:48:50 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 1CD9D28C250
Subject: Re: [PATCH 1/2] rtc: cros-ec: remove superfluous error message
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        linux-kernel@vger.kernel.org
References: <20191016201414.30934-1-alexandre.belloni@bootlin.com>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <00ed2977-3627-16ca-6a01-db263534a071@collabora.com>
Date:   Tue, 22 Oct 2019 09:48:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016201414.30934-1-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

On 16/10/19 22:14, Alexandre Belloni wrote:
> The RTC core now has error messages in case of registration failure, there
> is no need to have other messages in the drivers.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

That makes totally sense for me.

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  drivers/rtc/rtc-cros-ec.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
> index 6909e01936d9..da209d00731e 100644
> --- a/drivers/rtc/rtc-cros-ec.c
> +++ b/drivers/rtc/rtc-cros-ec.c
> @@ -351,11 +351,8 @@ static int cros_ec_rtc_probe(struct platform_device *pdev)
>  	cros_ec_rtc->rtc = devm_rtc_device_register(&pdev->dev, DRV_NAME,
>  						    &cros_ec_rtc_ops,
>  						    THIS_MODULE);
> -	if (IS_ERR(cros_ec_rtc->rtc)) {
> -		ret = PTR_ERR(cros_ec_rtc->rtc);
> -		dev_err(&pdev->dev, "failed to register rtc device\n");
> -		return ret;
> -	}
> +	if (IS_ERR(cros_ec_rtc->rtc))
> +		return PTR_ERR(cros_ec_rtc->rtc);
>  
>  	/* Get RTC events from the EC. */
>  	cros_ec_rtc->notifier.notifier_call = cros_ec_rtc_event;
> 
