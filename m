Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A42B42CCEA
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Oct 2021 23:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhJMVlk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Oct 2021 17:41:40 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:49926 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229588AbhJMVlj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 Oct 2021 17:41:39 -0400
Received: from [77.244.183.192] (port=64982 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1malyI-002DCh-Aq; Wed, 13 Oct 2021 23:39:34 +0200
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
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <5236720c-96b0-3e18-e08f-a5dde982eab5@lucaceresoli.net>
Date:   Wed, 13 Oct 2021 23:39:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b2355acf-94a5-1acf-122b-d661c6d9bb1b@canonical.com>
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

On 12/10/21 10:32, Krzysztof Kozlowski wrote:
> On 11/10/2021 17:56, Luca Ceresoli wrote:
>> Add a simple driver for the Maxim MAX77714 PMIC, supporting RTC and
>> watchdog only.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> ---
>>  MAINTAINERS                  |   2 +
>>  drivers/mfd/Kconfig          |  14 ++++
>>  drivers/mfd/Makefile         |   1 +
>>  drivers/mfd/max77714.c       | 151 +++++++++++++++++++++++++++++++++++
>>  include/linux/mfd/max77714.h |  68 ++++++++++++++++
>>  5 files changed, 236 insertions(+)
>>  create mode 100644 drivers/mfd/max77714.c
>>  create mode 100644 include/linux/mfd/max77714.h
>>
> 
> (...)
> 
>> +
>> +static const struct of_device_id max77714_dt_match[] = {
>> +	{ .compatible = "maxim,max77714" },
>> +	{},
>> +};
> 
> When converting to module - don't forget the MODULE_DEVICE_TABLE
> 
>> +
>> +static struct i2c_driver max77714_driver = {
>> +	.driver = {
>> +		.name = "max77714",
>> +		.of_match_table = of_match_ptr(max77714_dt_match),
> 
> Kbuild robot pointed it out - of_matc_ptr should not be needed, even for
> compile testing without OF.

I wonder whether it's better to add '#ifdef CONFIG_OF / #endif' around
the struct of_device_id declaration. I think it's what most drivers do,
even though I tend to prefer not adding #ifdefs making code less clean
only for COMPILE_TESTING.

-- 
Luca
