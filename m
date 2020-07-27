Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C66E122ED59
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Jul 2020 15:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728904AbgG0Ncw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 Jul 2020 09:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728895AbgG0Ncv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 Jul 2020 09:32:51 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25FBBC061794;
        Mon, 27 Jul 2020 06:32:51 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id p1so7999675pls.4;
        Mon, 27 Jul 2020 06:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DLed687naOlAuxKQ/recTySv+sqAQhD4c+cfAqCppP0=;
        b=etmJ42zWKJJ/fka24Lv9M4HXgoOEbn/wUuMvXZsP8Fcr3xlfy6eo8qxi9ssh72X993
         pMGYE3QJ+G4RjkjV1ukxF5MWoMC1wlxNk+S4iFkg+bw+JY/EOLzKtRU+4eJfhflv5ywL
         0sesTXHiFc1pPDwQBLRkjlrGrMJSsKq2zDCcRt25vFnOOXrEmZNILneDrume40F2zU5V
         Kmc2LmfQxZVgI4h8wvatenCMaTZx+Y5r7U4JogLjQb4Jza83Y9RsyXQNLmukPc40Zltz
         bO//K2BEbwMDl57nRI5YpVOa4flfvDxHG8+Aj81RgXyF2KKUSTj1EYFxIJaA5RGrydr3
         3JYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=DLed687naOlAuxKQ/recTySv+sqAQhD4c+cfAqCppP0=;
        b=qoWzA78BO21Rc0zzMDNRaZJxW4s/YJ821GGUaoLNL/P0VIMIPIy15WyrCuVDjz9oG3
         YkfmjtvoUHQomiHJSYc5ZziaLj2aDL04ooaeiDTl/69DRuhTLBH7YhUlymBSLj8chPTY
         gB+hSjntw5BOdOxBIqo8nGK5xYyFNi4XxjexnAe+/v5witFNe9JuIkHSHdEo7EFysF86
         T2OJ06y0r2oHJOu4JuuRU96DW4fYYnVdcEsAkBdbqETEG3hG2pad3lwlM0kZlv0+BIfF
         /N4NNZeKp0YZ/KMusawlIS9CqXw3Azd3WAg3JbSxJYbS9aqdyin7aiZ7TGcuq3zPZP1/
         +YYA==
X-Gm-Message-State: AOAM5320ThYjQPkEN3iZ2IB8/LhDScylejGplwiZybLT+ijobyidZwBv
        4BI3X4M7/WIKGMBC7WkLs5Ayo/35
X-Google-Smtp-Source: ABdhPJzWUu9JmaEQ4jUqDIugaBDjmwZlmZvyFIBpzf3aQFOXaS7kPsCsLBck0QusyRXMiOk/V/PCvw==
X-Received: by 2002:a17:902:8ec7:: with SMTP id x7mr18788470plo.111.1595856770371;
        Mon, 27 Jul 2020 06:32:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u23sm14813338pgn.26.2020.07.27.06.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 06:32:49 -0700 (PDT)
Subject: Re: [PATCH v3] rtc: ds1307: provide an indication that the watchdog
 has fired
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200727034615.19755-1-chris.packham@alliedtelesis.co.nz>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <20e6115f-f0dd-6e37-ae16-9f409ac4c413@roeck-us.net>
Date:   Mon, 27 Jul 2020 06:32:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727034615.19755-1-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 7/26/20 8:46 PM, Chris Packham wrote:
> There's not much feedback when the ds1388 watchdog fires. Generally it
> yanks on the reset line and the board reboots. Capture the fact that the
> watchdog has fired in the past so that userspace can retrieve it via
> WDIOC_GETBOOTSTATUS. This should help distinguish a watchdog triggered
> reset from a power interruption.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v3:
> - Check for watchdog flag in ds1307_wdt_register()
> Changes in v2:
> - Set bootstatus to WDIOF_CARDRESET and let userspace decide what to do with
>   the information.
> 
>  drivers/rtc/rtc-ds1307.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index 49702942bb08..54c85cdd019d 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -1668,6 +1668,8 @@ static const struct watchdog_ops ds1388_wdt_ops = {
>  static void ds1307_wdt_register(struct ds1307 *ds1307)
>  {
>  	struct watchdog_device	*wdt;
> +	int err;
> +	int val;
>  
>  	if (ds1307->type != ds_1388)
>  		return;
> @@ -1676,6 +1678,10 @@ static void ds1307_wdt_register(struct ds1307 *ds1307)
>  	if (!wdt)
>  		return;
>  
> +	err = regmap_read(ds1307->regmap, DS1388_REG_FLAG, &val);
> +	if (!err && val & DS1388_BIT_WF)
> +		wdt->bootstatus = WDIOF_CARDRESET;
> +
>  	wdt->info = &ds1388_wdt_info;
>  	wdt->ops = &ds1388_wdt_ops;
>  	wdt->timeout = 99;
> 

