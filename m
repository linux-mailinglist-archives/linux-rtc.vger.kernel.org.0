Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF14F42CD1B
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Oct 2021 23:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbhJMVvz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Oct 2021 17:51:55 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:40784 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230309AbhJMVvs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 Oct 2021 17:51:48 -0400
Received: from [77.244.183.192] (port=65012 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1mam86-002HuD-VY; Wed, 13 Oct 2021 23:49:43 +0200
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
 <79a3c52b-ed4a-dadb-c7e2-2c96c9a58c49@canonical.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <21684e2a-e84c-05ed-e27c-e710c53e3a64@lucaceresoli.net>
Date:   Wed, 13 Oct 2021 23:49:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <79a3c52b-ed4a-dadb-c7e2-2c96c9a58c49@canonical.com>
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

On 12/10/21 10:09, Krzysztof Kozlowski wrote:
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
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 4d0134752537..df394192f14e 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -11389,6 +11389,8 @@ MAXIM MAX77714 PMIC MFD DRIVER
>>  M:	Luca Ceresoli <luca@lucaceresoli.net>
>>  S:	Maintained
>>  F:	Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
>> +F:	drivers/mfd/max77714.c
>> +F:	include/linux/mfd/max77714.h
>>  
>>  MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
>>  M:	Javier Martinez Canillas <javier@dowhile0.org>
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index ca0edab91aeb..b5f6e6174508 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -853,6 +853,20 @@ config MFD_MAX77693
>>  	  additional drivers must be enabled in order to use the functionality
>>  	  of the device.
>>  
>> +config MFD_MAX77714
>> +	bool "Maxim Semiconductor MAX77714 PMIC Support"
> 
> Why it cannot be a tristate (module)?

Because it's not done in the driver I initially copied from, I guess. :)

And also because I thought it's appropriate for a PMIC driver since
regulators tend to be always instantiated. But I understand there are
valid use cases for that -- will do in v2 unless a good reason pops up
for not doing it.

>> diff --git a/include/linux/mfd/max77714.h b/include/linux/mfd/max77714.h
>> new file mode 100644
>> index 000000000000..ca6b747b73c2
>> --- /dev/null
>> +++ b/include/linux/mfd/max77714.h
>> @@ -0,0 +1,68 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Maxim MAX77714 Register and data structures definition.
>> + *
>> + * Copyright (C) 2021 Luca Ceresoli
>> + * Author: Luca Ceresoli <luca@lucaceresoli.net>
>> + */
>> +
>> +#ifndef _MFD_MAX77714_H_
>> +#define _MFD_MAX77714_H_
> 
> Header guard:
> __LINUX_MFD_MAX77714_H_

OK.

>> +
>> +struct max77714 {
>> +	struct device *dev;
>> +	struct regmap *regmap;
>> +	struct regmap_irq_chip_data *irq_data;
>> +
>> +	int irq;
>> +};
> 
> Do you have to make it a public structure? If not, please put it in the
> max77714.c

Good point. Will fix.

-- 
Luca
