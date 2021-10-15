Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8C842F87F
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Oct 2021 18:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241483AbhJOQpw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Fri, 15 Oct 2021 12:45:52 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:52464 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232499AbhJOQpw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 Oct 2021 12:45:52 -0400
Received: from [77.244.183.192] (port=62388 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1mbQJ5-0058AN-VD; Fri, 15 Oct 2021 18:43:44 +0200
Subject: Re: [PATCH 7/8] watchdog: max77714: add driver for the watchdog in
 the MAX77714 PMIC
To:     Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
References: <20211011155615.257529-1-luca@lucaceresoli.net>
 <20211011155615.257529-8-luca@lucaceresoli.net>
 <8ce6ed51-7963-0279-f771-66226e6b5a6d@roeck-us.net>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <cfd69a3e-7017-af97-f79b-333714f700f1@lucaceresoli.net>
Date:   Fri, 15 Oct 2021 18:43:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8ce6ed51-7963-0279-f771-66226e6b5a6d@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: it-IT
Content-Transfer-Encoding: 8BIT
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

On 11/10/21 19:17, Guenter Roeck wrote:
> On 10/11/21 8:56 AM, Luca Ceresoli wrote:
[...]
>> diff --git a/drivers/watchdog/max77714_wdt.c
>> b/drivers/watchdog/max77714_wdt.c
>> new file mode 100644
>> index 000000000000..2d468db849f9
>> --- /dev/null
>> +++ b/drivers/watchdog/max77714_wdt.c
>> @@ -0,0 +1,171 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Maxim MAX77714 Watchdog Driver
>> + *
>> + * Copyright (C) 2021 Luca Ceresoli
>> + * Author: Luca Ceresoli <luca@lucaceresoli.net>
>> + */
>> +
>> +#include <linux/err.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mfd/max77714.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/watchdog.h>
>> +
>> +struct max77714_wdt {
>> +    struct device        *dev;
>> +    struct regmap        *rmap;
>> +    struct watchdog_device    wd_dev;
>> +};
>> +
>> +/* Timeout in seconds, indexed by TWD bits of CNFG_GLBL2 register */
>> +unsigned int max77714_margin_value[] = { 2, 16, 64, 128 };
> 
> static

Absolutely. And const too. Will fix.

-- 
Luca

