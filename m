Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 398842F152D
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 14:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731338AbhAKNgH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Jan 2021 08:36:07 -0500
Received: from mail-ed1-f48.google.com ([209.85.208.48]:38657 "EHLO
        mail-ed1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730624AbhAKNgG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Jan 2021 08:36:06 -0500
Received: by mail-ed1-f48.google.com with SMTP id cw27so18827053edb.5;
        Mon, 11 Jan 2021 05:35:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EkKMBcTAUL+XlWRZ4g+TxSDiPYuDiQjuUzsrgdkLw40=;
        b=pCZYaj1SU5tOzqRoxSOi6+3fU5wcZZtI4nVW2eBMSwMtJpOjZrrSr6ZljHj1jP8sd0
         iCbAq83N6WvFJIgZgeAjpDXa+8U5lm5Xg3g5wITsGKTdJ/S/o48hfZigbWdTevDV2CW2
         N/NMu52Edg5edMlErdqa0p/1BK39KRx3h/GSEAInxYKJ4+GGeGBb+kp43jc44gP7ne6Z
         3LZohJWjqTF/oHNf0UTJs1EY+flNFubv86xjB7Usz3RjIvUhHlQA2krmutGrQIftOHIo
         cpyxGlnXifk5CIVP3SrIXOi/Afkxd/gyj5gsbhz1SnX823kOcUz2cy/ROjlPcWIuTR9B
         Xeaw==
X-Gm-Message-State: AOAM530XCDLIwAkL5sqNQha9voPk32/y79Os4llQohrwyMgPK/tylnxS
        h8GfZ6DWz3zMnFvrHHmh3B0=
X-Google-Smtp-Source: ABdhPJy7GkFxxwjU66+0qIDAEcHSrL58BsNo2s5VFsswxaFsjOVQfuZcDKnsHWUg/QmjlWqh61+rww==
X-Received: by 2002:a05:6402:129a:: with SMTP id w26mr14595523edv.355.1610372123777;
        Mon, 11 Jan 2021 05:35:23 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id d18sm7794748edz.14.2021.01.11.05.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 05:35:22 -0800 (PST)
Date:   Mon, 11 Jan 2021 14:35:21 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 2/3] rtc: s5m: check the return value of
 s5m8767_rtc_init_reg()
Message-ID: <20210111133521.GB34341@kozik-lap>
References: <20210111124027.21586-1-brgl@bgdev.pl>
 <20210111124027.21586-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210111124027.21586-3-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Jan 11, 2021 at 01:40:26PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This function can fail if regmap operations fail so check its return
> value in probe().
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/rtc/rtc-s5m.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
> index eb9dde4095a9..e0011d3cf61b 100644
> --- a/drivers/rtc/rtc-s5m.c
> +++ b/drivers/rtc/rtc-s5m.c
> @@ -791,6 +791,8 @@ static int s5m_rtc_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, info);
>  
>  	ret = s5m8767_rtc_init_reg(info);
> +	if (ret)
> +		return ret;

You leak I2C device.

Best regards,
Krzysztof
