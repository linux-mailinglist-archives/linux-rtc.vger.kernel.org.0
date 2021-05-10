Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1C6378F15
	for <lists+linux-rtc@lfdr.de>; Mon, 10 May 2021 15:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232349AbhEJNdU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 10 May 2021 09:33:20 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43290 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244269AbhEJMT5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 10 May 2021 08:19:57 -0400
Received: from mail-qv1-f69.google.com ([209.85.219.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lg4s8-00039M-1P
        for linux-rtc@vger.kernel.org; Mon, 10 May 2021 12:18:52 +0000
Received: by mail-qv1-f69.google.com with SMTP id g26-20020a0caada0000b02901b93eb92373so12417627qvb.3
        for <linux-rtc@vger.kernel.org>; Mon, 10 May 2021 05:18:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qw2xIhE1YQPqR0OG1inwWyXnTht9gARQqIiYkO8Zeek=;
        b=P4L3UyOFcxX1hqc+isk9NBzjNC8nnVpd8m01oWffzl6ytutwqwuv+IaXIZ7HrnSwQq
         5bif3bc+h+ytmZ414SdUuVP1jQSuI3qPlyjdDTAb8jJUA/YaNEnqmMOaEvA0yGR092QF
         I/L0MpUQxc1N3O/pYicdYaqNG5XPKx+wa6tMUVkaIf+rmBbFT6PhwHG4VLb9DM4O6sBY
         A2NWlA/NrxksxI/SyyEuGKROrl6OGrmJE/XLyOe6wQwXnXchlDHL4qZXGgbLPz/folZj
         2lUMF8naShlLzFKub++TRwq/TEvTTPpW1Tz2Mvsb6u/ZlQ5PyF8Qt6zQPK4iAqpptEmx
         K44A==
X-Gm-Message-State: AOAM5328Hcnw/rgSr8EpZW9ochxXqN1rgsI1X+nSZ6lxFH86MYYmz66l
        wvTWi+e5QDwi5oz2UQgHKST3VXqhPce0sjea1jgwY3Pi4JuBk1s84zHe6BsNy2SOLichmVIFuDb
        aQ6QDDGQ7aTkxakMS8ROjO7Fg4CZHZw/ONPNzFg==
X-Received: by 2002:a37:61cd:: with SMTP id v196mr19056892qkb.454.1620649131210;
        Mon, 10 May 2021 05:18:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyunxzu4B8x+Dts17JtJ41BIvhjuofWIqji9fp6Sm5lxjBnUuVITR4zQbsN+I/u5NwXYtqC6Q==
X-Received: by 2002:a37:61cd:: with SMTP id v196mr19056870qkb.454.1620649131056;
        Mon, 10 May 2021 05:18:51 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.49.2])
        by smtp.gmail.com with ESMTPSA id m205sm4051312qke.2.2021.05.10.05.18.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 05:18:50 -0700 (PDT)
Subject: Re: [PATCH] rtc: max77686: Remove some dead code
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        cw00.choi@samsung.com, b.zolnierkie@samsung.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <a6b23ee8d3ea78f62d3fda0b53aa273718f14c6d.1620452523.git.christophe.jaillet@wanadoo.fr>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <d5250408-b899-ab1a-c86c-0366b6b286c3@canonical.com>
Date:   Mon, 10 May 2021 08:18:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a6b23ee8d3ea78f62d3fda0b53aa273718f14c6d.1620452523.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/05/2021 01:43, Christophe JAILLET wrote:
> 'ret' is known to be an error pointer here, so it can't be 0.
> Remove this dead code.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/rtc/rtc-max77686.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index d51cc12114cb..ce089ed934ad 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -764,8 +764,6 @@ static int max77686_rtc_probe(struct platform_device *pdev)
>  	if (IS_ERR(info->rtc_dev)) {
>  		ret = PTR_ERR(info->rtc_dev);
>  		dev_err(&pdev->dev, "Failed to register RTC device: %d\n", ret);
> -		if (ret == 0)
> -			ret = -EINVAL;
>  		goto err_rtc;


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
