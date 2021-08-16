Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF633ED194
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Aug 2021 12:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbhHPKEu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Aug 2021 06:04:50 -0400
Received: from ZXSHCAS2.zhaoxin.com ([203.148.12.82]:7372 "EHLO
        ZXSHCAS2.zhaoxin.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbhHPKEu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 16 Aug 2021 06:04:50 -0400
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHCAS2.zhaoxin.com
 (10.28.252.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 16 Aug
 2021 18:04:16 +0800
Received: from [10.32.56.37] (10.32.56.37) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 16 Aug
 2021 18:04:15 +0800
From:   Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>
Subject: Re: [PATCH] rtc: Fix set RTC time delay 500ms on some Zhaoxin SOCs
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     <a.zummo@towertech.it>, <linux-rtc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <TimGuo-oc@zhaoxin.com>,
        <CooperYan@zhaoxin.com>, <QiyuanWang@zhaoxin.com>,
        <HerryYang@zhaoxin.com>, <CobeChen@zhaoxin.com>,
        <YanchenSun@zhaoxin.com>
References: <1629121638-3246-1-git-send-email-TonyWWang-oc@zhaoxin.com>
 <YRogod0HB4d7Og4E@piout.net>
Message-ID: <a4b6b0b4-9aa5-9a75-e523-0fd7656b82cf@zhaoxin.com>
Date:   Mon, 16 Aug 2021 18:03:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YRogod0HB4d7Og4E@piout.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.32.56.37]
X-ClientProxiedBy: ZXSHCAS2.zhaoxin.com (10.28.252.162) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On 16/08/2021 16:24, Alexandre Belloni wrote:
> Hello,
> 
> On 16/08/2021 21:47:18+0800, Tony W Wang-oc wrote:
>> When the RTC divider is changed from reset to an operating time base,
>> the first update cycle should be 500ms later. But on some Zhaoxin SOCs,
>> this first update cycle is one second later.
>>
>> So set RTC time on these Zhaoxin SOCs will causing 500ms delay.
>>
> 
> Can you explain what is the relationship between writing the divider and
> the 500ms delay?
>> Isn't the issue that you are using systohc and set_offset_nsec is set to
> NSEC_PER_SEC / 2 ?
> 
No.
When using #hwclock -s to set RTC time and set_offset_nsec is
NSEC_PER_SEC / 2, the function mc146818_set_time() requires the first
update cycle after RTC divider be changed from reset to an operating
mode is 500ms as the MC146818A spec specified. But on some Zhaoxin SOCs,
the first update cycle of RTC is one second later after RTC divider be
changed from reset to an operating mode. So the first update cycle after
RTC divider be changed from reset to an operation mode on These SOCs
will causing 500ms delay with current mc146818_set_time() implementation.

Sincerely
TonyWWang-oc

>> Skip setup RTC divider on these SOCs in mc146818_set_time to fix it.
>>
>> Signed-off-by: Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>
>> ---
>>  drivers/rtc/rtc-mc146818-lib.c | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
>> index dcfaf09..322f94b 100644
>> --- a/drivers/rtc/rtc-mc146818-lib.c
>> +++ b/drivers/rtc/rtc-mc146818-lib.c
>> @@ -190,8 +190,18 @@ int mc146818_set_time(struct rtc_time *time)
>>  	spin_lock_irqsave(&rtc_lock, flags);
>>  	save_control = CMOS_READ(RTC_CONTROL);
>>  	CMOS_WRITE((save_control|RTC_SET), RTC_CONTROL);
>> +
>> +#ifdef CONFIG_X86
>> +	if (!((boot_cpu_data.x86_vendor == X86_VENDOR_CENTAUR ||
>> +		boot_cpu_data.x86_vendor == X86_VENDOR_ZHAOXIN) &&
>> +		(boot_cpu_data.x86 <= 7 && boot_cpu_data.x86_model <= 59))) {
>> +		save_freq_select = CMOS_READ(RTC_FREQ_SELECT);
>> +		CMOS_WRITE((save_freq_select|RTC_DIV_RESET2), RTC_FREQ_SELECT);
>> +	}
>> +#else
>>  	save_freq_select = CMOS_READ(RTC_FREQ_SELECT);
>>  	CMOS_WRITE((save_freq_select|RTC_DIV_RESET2), RTC_FREQ_SELECT);
>> +#endif
>>  
>>  #ifdef CONFIG_MACH_DECSTATION
>>  	CMOS_WRITE(real_yrs, RTC_DEC_YEAR);
>> @@ -209,7 +219,15 @@ int mc146818_set_time(struct rtc_time *time)
>>  #endif
>>  
>>  	CMOS_WRITE(save_control, RTC_CONTROL);
>> +
>> +#ifdef CONFIG_X86
>> +	if (!((boot_cpu_data.x86_vendor == X86_VENDOR_CENTAUR ||
>> +		boot_cpu_data.x86_vendor == X86_VENDOR_ZHAOXIN) &&
>> +		(boot_cpu_data.x86 <= 7 && boot_cpu_data.x86_model <= 59)))
>> +		CMOS_WRITE(save_freq_select, RTC_FREQ_SELECT);
>> +#else
>>  	CMOS_WRITE(save_freq_select, RTC_FREQ_SELECT);
>> +#endif
>>  
>>  	spin_unlock_irqrestore(&rtc_lock, flags);
>>  
>> -- 
>> 2.7.4
>>
> 
