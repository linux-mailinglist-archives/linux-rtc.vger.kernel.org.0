Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFE09D03D
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2019 15:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732220AbfHZNU6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 26 Aug 2019 09:20:58 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43901 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbfHZNU6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 26 Aug 2019 09:20:58 -0400
Received: by mail-pg1-f194.google.com with SMTP id k3so10600416pgb.10;
        Mon, 26 Aug 2019 06:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ke9VgdWxkTDSfhJn5FtwLPXDcQ8jktEKphO56apG3uc=;
        b=if1MFW3zoOohAGEDXi7RhCiqITLAGw+gPYjDJwgk1onp5AlMt/MlEwygjexmHuKLPN
         VGs1RUngTz2bQ4tlG7W33WulabOY4NG4rmTlbnCi0aGP+emsJUFzeX9NGVW1CFwK49wk
         N8zPd3NrylH3Yv8MvHcrT1Lbqb1NOQPm88m+WcpvIbTe8QAiOp3QQHQknsuvSUmHiRfj
         Ohcgankjj4Kofl0rgJnJckvQ47yIB4ZWpxsnIajo9wKXnBOAua+VpXHLC5uj72cgExuo
         Dn6/dAcw9RyG+pcf848d2bSnvDFjxswLKpBu1u778y9VU3VkEAtytnC7y+9wn9yrJCYF
         0oRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ke9VgdWxkTDSfhJn5FtwLPXDcQ8jktEKphO56apG3uc=;
        b=NXahza3W5KZvLIBJBMSTQEhw8esjNx6M0I//eA81XI95Fgo3nuvlGO9xY8J/sEa9hX
         Pmzr4/TV+C7IM3Vx9iRNw+u2i69aLwq2G5l38XjGfv28J15GhsJx1vfs/xU3KxxlYVLg
         6cjVH+iUvpSKq2K3pWHNqoBuNpIbTpL6uqT+gbu1us9ujfaqPW3l9Xixj6QSDRRja5JX
         ln4cT29i/cEfQDQVlAh+5UjfuAhro7hiqsqnaUnu/9alJ1EEEs8S9YDWnPSlbE6CPxGS
         +DNgr3SZfY08UutThvm4ZkTCDl8zOHTDBkKcaPrzuD2ZZOUo9AZlNDRcv6bSXiC6Lzdg
         KuCA==
X-Gm-Message-State: APjAAAXa9Ye401F56oP0GGQidpe/pIGLExPzAPsy5cZ8vDydBQXS3JpB
        kxZ8oxVnJ1/FihfjClC+7j3OnWL2
X-Google-Smtp-Source: APXvYqz8O3Ph5j6/3aVJUbVOGZ18VvJxtXlqGJ7c5xsvLe3qQeKX2ww51740a03oZK0I2qtjyCEi4A==
X-Received: by 2002:aa7:91d3:: with SMTP id z19mr19969213pfa.135.1566825657669;
        Mon, 26 Aug 2019 06:20:57 -0700 (PDT)
Received: from server.roeck-us.net (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id u21sm1502386pjn.5.2019.08.26.06.20.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 06:20:56 -0700 (PDT)
Subject: Re: [PATCH -next] rtc: pcf2127: Fix build error without
 CONFIG_WATCHDOG_CORE
To:     Yuehaibing <yuehaibing@huawei.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     a.zummo@towertech.it, bruno.thomsen@gmail.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190823124553.19364-1-yuehaibing@huawei.com>
 <20190823140513.GB9844@piout.net>
 <4b608c55-2541-30cf-ad88-c19a5c0cc84f@huawei.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <01a2b6b2-eb15-1b40-1edc-de122bbdb5a2@roeck-us.net>
Date:   Mon, 26 Aug 2019 06:20:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4b608c55-2541-30cf-ad88-c19a5c0cc84f@huawei.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 8/26/19 1:12 AM, Yuehaibing wrote:
> 
> 
> On 2019/8/23 22:05, Alexandre Belloni wrote:
>> On 23/08/2019 20:45:53+0800, YueHaibing wrote:
>>> If WATCHDOG_CORE is not set, build fails:
>>>
>>> drivers/rtc/rtc-pcf2127.o: In function `pcf2127_probe.isra.6':
>>> drivers/rtc/rtc-pcf2127.c:478: undefined reference to `devm_watchdog_register_device'
>>>
>>> Add WATCHDOG_CORE Kconfig dependency to fix this.
>>>
>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>> Fixes: bbc597561ce1 ("rtc: pcf2127: add watchdog feature support")
>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>> ---
>>>   drivers/rtc/Kconfig | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>>> index 25af63d..9dce7dc 100644
>>> --- a/drivers/rtc/Kconfig
>>> +++ b/drivers/rtc/Kconfig
>>> @@ -886,6 +886,8 @@ config RTC_DRV_DS3232_HWMON
>>>   config RTC_DRV_PCF2127
>>>   	tristate "NXP PCF2127"
>>>   	depends on RTC_I2C_AND_SPI
>>> +	depends on WATCHDOG
>>
>> Definitively not, I fixed it that way:
>> +       select WATCHDOG_CORE if WATCHDOG
> 
> 
> No, this still fails while WATCHDOG is not set
> 

Correct, there are no dummy functions for watchdog device registration.
There would have to be conditional code in the driver if the watchdog
is supposed to be optional.

Guenter
