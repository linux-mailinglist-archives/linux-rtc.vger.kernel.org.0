Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C79F42F879
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Oct 2021 18:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237472AbhJOQoR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Fri, 15 Oct 2021 12:44:17 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:50139 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232499AbhJOQoR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 Oct 2021 12:44:17 -0400
Received: from [77.244.183.192] (port=62378 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1mbQHY-0057QX-Fl; Fri, 15 Oct 2021 18:42:08 +0200
Subject: Re: [PATCH 7/8] watchdog: max77714: add driver for the watchdog in
 the MAX77714 PMIC
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
References: <20211011155615.257529-1-luca@lucaceresoli.net>
 <20211011155615.257529-8-luca@lucaceresoli.net>
 <319589ca-0dfb-008f-052a-01f0f25d86fa@infradead.org>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <a78a3f69-d84d-727f-4173-2f0498a4c6f7@lucaceresoli.net>
Date:   Fri, 15 Oct 2021 18:42:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <319589ca-0dfb-008f-052a-01f0f25d86fa@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 12/10/21 03:18, Randy Dunlap wrote:
> Hi,
> 
> On 10/11/21 8:56 AM, Luca Ceresoli wrote:
>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>> index bf59faeb3de1..00bc3f932a6c 100644
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -699,6 +699,15 @@ config MAX77620_WATCHDOG
>>        MAX77620 chips. To compile this driver as a module,
>>        choose M here: the module will be called max77620_wdt.
>>   +config MAX77714_WATCHDOG
>> +    tristate "Maxim MAX77714 Watchdog Timer"
>> +    depends on MFD_MAX77714 || COMPILE_TEST
>> +    help
>> +     This is the driver for watchdog timer in the MAX77714 PMIC.
>> +     Say 'Y' here to enable the watchdog timer support for
>> +     MAX77714 chips. To compile this driver as a module,
>> +     choose M here: the module will be called max77714_wdt.
> 
> Please follow coding-style for Kconfig files:
> 
> (from Documentation/process/coding-style.rst, section 10):
> 
> For all of the Kconfig* configuration files throughout the source tree,
> the indentation is somewhat different.  Lines under a ``config`` definition
> are indented with one tab, while help text is indented an additional two
> spaces.

Oh dear, I usually don't make such silly mistakes, apologies.

[...some fast typing later...]

Uhm, now I noticed many entries in that file have that same mistake.
Perhaps I copy-pasted and didn't check. I'll send a patch to fix them too.

-- 
Luca

