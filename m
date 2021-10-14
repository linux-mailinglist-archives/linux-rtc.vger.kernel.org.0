Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5356342D4CB
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Oct 2021 10:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbhJNI1y (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 14 Oct 2021 04:27:54 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:34941 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229970AbhJNI1x (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 14 Oct 2021 04:27:53 -0400
Received: from [77.244.183.192] (port=62068 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1maw3e-006xC5-IW; Thu, 14 Oct 2021 10:25:46 +0200
Subject: Re: [PATCH 6/8] mfd: max77714: Add driver for Maxim MAX77714 PMIC
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
References: <20211011155615.257529-1-luca@lucaceresoli.net>
 <20211011155615.257529-7-luca@lucaceresoli.net>
 <b2355acf-94a5-1acf-122b-d661c6d9bb1b@canonical.com>
 <5236720c-96b0-3e18-e08f-a5dde982eab5@lucaceresoli.net>
 <b4ee3175-5bd7-cf75-2d2b-2cc9368842e7@canonical.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <e1e41178-b4b6-4f3e-b88b-e35090262da9@lucaceresoli.net>
Date:   Thu, 14 Oct 2021 10:25:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b4ee3175-5bd7-cf75-2d2b-2cc9368842e7@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 14/10/21 09:40, Krzysztof Kozlowski wrote:
[...]
>>>> +
>>>> +static const struct of_device_id max77714_dt_match[] = {
>>>> +	{ .compatible = "maxim,max77714" },
>>>> +	{},
>>>> +};
>>>
>>> When converting to module - don't forget the MODULE_DEVICE_TABLE
>>>
>>>> +
>>>> +static struct i2c_driver max77714_driver = {
>>>> +	.driver = {
>>>> +		.name = "max77714",
>>>> +		.of_match_table = of_match_ptr(max77714_dt_match),
>>>
>>> Kbuild robot pointed it out - of_matc_ptr should not be needed, even for
>>> compile testing without OF.
>>
>> I wonder whether it's better to add '#ifdef CONFIG_OF / #endif' around
>> the struct of_device_id declaration. I think it's what most drivers do,
>> even though I tend to prefer not adding #ifdefs making code less clean
>> only for COMPILE_TESTING.
> 
> No, most drivers added it long time ago before we switched it to a new
> way - either __maybe_unused or without anything even. The point is that
> OF driver can be reused for ACPI platforms. If you limit it with ifdef
> or of_match_ptr, the ACPI platform won't have any table to use for binding.

Oh, I see, thanks for the clarification.

I wonder if it makes sense to mass-remove all of them and remove the macro.

-- 
Luca
