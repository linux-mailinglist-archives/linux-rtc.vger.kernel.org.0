Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C43609B114
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2019 15:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405632AbfHWNiV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Aug 2019 09:38:21 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36336 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726894AbfHWNiV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 23 Aug 2019 09:38:21 -0400
Received: by mail-pf1-f196.google.com with SMTP id w2so6498367pfi.3;
        Fri, 23 Aug 2019 06:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W1wVVamLiZ9h3NTS9ZqHD5eQU+X6FPNoaBYhmtpr1I4=;
        b=Tu77bVf00t9cOu0XYvtVU4hD+7TKPcsyzhR/Q25Q2VHCa/6mYNgnNRTdXc/S5/UA4O
         4M/MYRMl/J/JS/qV961EsYxP6+26Egbeob/KkZ4DXXkR7jDKkzB6Zx89s81pbc2yszgH
         LOJ4s97IBDhAv/2gH92TMYeaehhvfbpj6jMXABLtE/wMiZK7LqKtg01zETljzc18YQVQ
         Q9aB2U23iVI/tbAzdCg2aITLsIHcWtBeEglRKUD1wBDGZ+qmhf0HDlKrG9PS5HXvq4xQ
         G2KlBCDlSl59dzNLpwABF2k3mkCkKpZIE4zyNtHIZeT2TSPbwYzUCjoGbkBzwe7flqAj
         7aNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W1wVVamLiZ9h3NTS9ZqHD5eQU+X6FPNoaBYhmtpr1I4=;
        b=aCZdUVdfLbssi/wQSGrMt4TfHqeBHxBOMOPDBmTqvzW//rSpO4UTHjZyEtXWuWTphy
         BbdsdEQrCwGeHogFKAtzYSn/OlPbcBXWbnmAzkIAj/XeQcjRVzFCPbcS8eVRoMEscKjt
         9dtoj0CZhBDscoAg8tzZaoN0xL0Nh6A7rXZkWcibhj6Oz80nFZnM4gCA1Y4ERyBIvoth
         dlUKVKtcY3uwPZJaxAeqnE+kSQopVEjFwNvZusmgS7KB7Jsc6lD1byUZDZIA8n2x7nZJ
         bqIu5P+IwvO4K2kNBae7/3nKkBXJH1axZA5v/6bU7CIKgBUmM6X7CJ2WSn62RyT2z1md
         5FtA==
X-Gm-Message-State: APjAAAXzhqUbadoTd5fjsaT+1dpKEwbasuTTlRFiuRW3pMBXgR90X2QN
        QkITL1W5iKps+WrCQagoAEP1kKqF
X-Google-Smtp-Source: APXvYqwfHcDqfQL4dvQYvM243XnOfEH8FwG1RwYozWmegxqNgulx0Iy/lHhUX2sOIrlLUqB+Fgm7Zg==
X-Received: by 2002:a65:60d3:: with SMTP id r19mr4053001pgv.91.1566567500072;
        Fri, 23 Aug 2019 06:38:20 -0700 (PDT)
Received: from server.roeck-us.net (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id s5sm2762083pjo.26.2019.08.23.06.38.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Aug 2019 06:38:18 -0700 (PDT)
Subject: Re: [PATCH -next] rtc: pcf2127: Fix build error without
 CONFIG_WATCHDOG_CORE
To:     YueHaibing <yuehaibing@huawei.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, bruno.thomsen@gmail.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190823124553.19364-1-yuehaibing@huawei.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <c1a11d06-ce3a-d289-2a61-607ba8e0509f@roeck-us.net>
Date:   Fri, 23 Aug 2019 06:38:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823124553.19364-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 8/23/19 5:45 AM, YueHaibing wrote:
> If WATCHDOG_CORE is not set, build fails:
> 
> drivers/rtc/rtc-pcf2127.o: In function `pcf2127_probe.isra.6':
> drivers/rtc/rtc-pcf2127.c:478: undefined reference to `devm_watchdog_register_device'
> 
> Add WATCHDOG_CORE Kconfig dependency to fix this.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: bbc597561ce1 ("rtc: pcf2127: add watchdog feature support")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/rtc/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 25af63d..9dce7dc 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -886,6 +886,8 @@ config RTC_DRV_DS3232_HWMON
>   config RTC_DRV_PCF2127
>   	tristate "NXP PCF2127"
>   	depends on RTC_I2C_AND_SPI
> +	depends on WATCHDOG
> +	select WATCHDOG_CORE
>   	help
>   	  If you say yes here you get support for the NXP PCF2127/29 RTC
>   	  chips with integrated quartz crystal for industrial applications.
> 

