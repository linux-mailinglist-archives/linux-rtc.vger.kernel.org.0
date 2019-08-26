Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96DE09CB4D
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2019 10:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729737AbfHZIM2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 26 Aug 2019 04:12:28 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:36370 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729582AbfHZIM2 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 26 Aug 2019 04:12:28 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id E48CEA667BA6D685D08A;
        Mon, 26 Aug 2019 16:12:24 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Mon, 26 Aug 2019
 16:12:20 +0800
Subject: Re: [PATCH -next] rtc: pcf2127: Fix build error without
 CONFIG_WATCHDOG_CORE
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20190823124553.19364-1-yuehaibing@huawei.com>
 <20190823140513.GB9844@piout.net>
CC:     <a.zummo@towertech.it>, <bruno.thomsen@gmail.com>,
        <linux@roeck-us.net>, <linux-rtc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From:   Yuehaibing <yuehaibing@huawei.com>
Message-ID: <4b608c55-2541-30cf-ad88-c19a5c0cc84f@huawei.com>
Date:   Mon, 26 Aug 2019 16:12:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190823140513.GB9844@piout.net>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On 2019/8/23 22:05, Alexandre Belloni wrote:
> On 23/08/2019 20:45:53+0800, YueHaibing wrote:
>> If WATCHDOG_CORE is not set, build fails:
>>
>> drivers/rtc/rtc-pcf2127.o: In function `pcf2127_probe.isra.6':
>> drivers/rtc/rtc-pcf2127.c:478: undefined reference to `devm_watchdog_register_device'
>>
>> Add WATCHDOG_CORE Kconfig dependency to fix this.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Fixes: bbc597561ce1 ("rtc: pcf2127: add watchdog feature support")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>  drivers/rtc/Kconfig | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>> index 25af63d..9dce7dc 100644
>> --- a/drivers/rtc/Kconfig
>> +++ b/drivers/rtc/Kconfig
>> @@ -886,6 +886,8 @@ config RTC_DRV_DS3232_HWMON
>>  config RTC_DRV_PCF2127
>>  	tristate "NXP PCF2127"
>>  	depends on RTC_I2C_AND_SPI
>> +	depends on WATCHDOG
> 
> Definitively not, I fixed it that way:
> +       select WATCHDOG_CORE if WATCHDOG


No, this still fails while WATCHDOG is not set

> 
> 

