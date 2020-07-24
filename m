Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5E7422C806
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jul 2020 16:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgGXOcr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 24 Jul 2020 10:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgGXOcq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 24 Jul 2020 10:32:46 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4FA7C0619D3;
        Fri, 24 Jul 2020 07:32:46 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id a14so5223240pfi.2;
        Fri, 24 Jul 2020 07:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PBya7J5P0ibxYxlDA6PEHQHimcYIa3S6ZZMr6ss88/0=;
        b=iQjk6UgQnrkW07FaGn1nItpLJIyiCnibqzlLcqDbDy9Df37pw1IsTf7wCSdGQ9OMZ6
         icCnawH/M+rC0M+hkqD6ZNIOaCYyg3xvGpk3QeYD5ILZQjKqclVBklgao3yVTEpca1ks
         1aVGqQFccJGAyjZn+Vn8rLl09DUvjDQunlVBHETNPIzRvAmdBp83FynWnevag1JYJogc
         Rxs0z+cEqCaEcCOj0qqLxECUouMnWJUElcS08BKJRJ4KYo+QB/QMm1XTjdPIVOqLUsyA
         Y/70oNoaBKmDckWPZbLpl0ciSCu4L69kFAokPRwx3Nzu3KIgMvTogfwpsNWeHE3zxuNh
         bsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=PBya7J5P0ibxYxlDA6PEHQHimcYIa3S6ZZMr6ss88/0=;
        b=tQCMgUmf91KBH7OhGWLd3n9hYUDtSJauhBInWwXlbUczkg8IXogklQh2nF37U7X4vx
         t51B98tzh04N5wfHtuFA1ro7J5o00Yy744rM3Hr4pnzqFE4vp0cWKZIOuwvGhXBK+o6i
         84FHHebIJCC0MBFh1fgj5qgLdEd2MVN6ur/wFVIzdj6XlJLb5yo3k2TPgEs4e+STiMXV
         lU6/UZ7zl/AQRq2Ch1OjNBd8jfcFD1Z+wWanBaBXZvxIMVrvJMrVcVQENJB4E2g7tYE4
         qDx7QnIp7/Z1AYrFEAzUtHTbyTQcY+eisxU085xQl5H3Zz/o1LO0Bc3SlAUiHpopxxFY
         pKDw==
X-Gm-Message-State: AOAM530uIY/ujhCvsNjcDUYYKagIRi+iZjEPzdT+DbJxWsKJzgOtZISK
        Zw5n/xcul7NyrCetCEfzvs6Bh1ut
X-Google-Smtp-Source: ABdhPJzwsFoQ0/IlBhNvudnFGT0jGYfjBouRTRUTvjKhJ7sjcNLB5OGStvtJup3bdi/FWTo9sNdzbQ==
X-Received: by 2002:a63:371c:: with SMTP id e28mr8710803pga.114.1595601165887;
        Fri, 24 Jul 2020 07:32:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r9sm6260301pje.12.2020.07.24.07.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 07:32:44 -0700 (PDT)
Subject: Re: [PATCH] rtc: ds1307: provide an indication that the watchdog has
 fired
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200724045009.7293-1-chris.packham@alliedtelesis.co.nz>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <5d6aaac5-0ce2-cf54-61fa-cfbc3f6bc0b3@roeck-us.net>
Date:   Fri, 24 Jul 2020 07:32:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724045009.7293-1-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 7/23/20 9:50 PM, Chris Packham wrote:
> There's not much feedback when the ds1388 watchdog fires. Generally it
> yanks on the reset line and the board reboots. To provide some feedback
> indicate that the watchdog has fired in the past. This should help
> distinguish a watchdog triggered reset from a power interruption.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  drivers/rtc/rtc-ds1307.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index 49702942bb08..431b1a50c483 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -868,6 +868,14 @@ static int ds1388_wdt_start(struct watchdog_device *wdt_dev)
>  	struct ds1307 *ds1307 = watchdog_get_drvdata(wdt_dev);
>  	u8 regs[2];
>  	int ret;
> +	int val;
> +
> +	ret = regmap_read(ds1307->regmap, DS1388_REG_FLAG, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val & DS1388_BIT_WF)
> +		dev_notice(ds1307->dev, "detected watchdog alarm flag\n");
>  
>  	ret = regmap_update_bits(ds1307->regmap, DS1388_REG_FLAG,
>  				 DS1388_BIT_WF, 0);
> 

This should be reported with WDIOC_GETBOOTSTATUS / WDIOF_CARDRESET,
not as log message when starting the watchdog.

Guenter
