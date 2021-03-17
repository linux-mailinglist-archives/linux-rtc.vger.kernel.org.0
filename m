Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C77933EAD9
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Mar 2021 08:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbhCQHxu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 Mar 2021 03:53:50 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:40522 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbhCQHxT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 17 Mar 2021 03:53:19 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4F0j7x3Y8Bz1qsjl;
        Wed, 17 Mar 2021 08:53:17 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4F0j7x2gr3z1r1M0;
        Wed, 17 Mar 2021 08:53:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id PLAnb7FrPttA; Wed, 17 Mar 2021 08:53:16 +0100 (CET)
X-Auth-Info: Wzv/zhzV0VLGhNLvkk+gS0+i+ZnIIVv90jGCSWUxwHM=
Received: from [10.88.0.186] (dslb-084-056-254-233.084.056.pools.vodafone-ip.de [84.56.254.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed, 17 Mar 2021 08:53:16 +0100 (CET)
Subject: Re: [PATCH v4] rtc: rx6110: add ACPI bindings to I2C
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     johannes hahn <johannes-hahn@siemens.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        werner zeh <werner.zeh@siemens.com>,
        henning schild <henning.schild@siemens.com>,
        martin mantel <martin.mantel@siemens.com>,
        val krutov <val.krutov@erd.epson.com>
References: <20210316100805.2630481-1-ch@denx.de>
 <20210316144819.4130622-1-ch@denx.de> <YFDjDhsCikxtl5rw@smile.fi.intel.com>
From:   Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
Message-ID: <5296791f-c432-d769-390a-27f86d4d1ae8@denx.de>
Date:   Wed, 17 Mar 2021 08:53:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFDjDhsCikxtl5rw@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Andy,

On 2021-03-16 17:55, Andy Shevchenko wrote:
> On Tue, Mar 16, 2021 at 03:48:18PM +0100, Claudius Heine wrote:
>> From: Johannes Hahn <johannes-hahn@siemens.com>
>>
>> This allows the RX6110 driver to be automatically assigned to the right
>> device on the I2C bus.
> 
> You missed given tag, when somebody sends you one, it's usually your
> responsibility to pick it up. Hint: install b4 tool (likely in your distro, at
> least Debian, Arch Linux have it) and run it against message ID of the version
> in question. It will gather all tags. For example, for this case, run
> 
>    % b4 am 20210316144819.4130622-1-ch@denx.de
> 
> It will download mailbox suitable for `git am ...` you will read on the screen.
> 
> Also, when send a new version, don't attach it to the old thread. It will
> confuse people and maybe even tools (i.o.w. don't supply message ID to be put
> to In-Reply-To header).

Ok.

> 
> So, repeat again my tag and see one fix to be performed below.
> Reviewed-by: From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Ok, will take care about this in v5.

> 
>> Signed-off-by: Johannes Hahn <johannes-hahn@siemens.com>
>> Co-developed-by: Claudius Heine <ch@denx.de>
>> Signed-off-by: Claudius Heine <ch@denx.de>
>> ---
>>   drivers/rtc/rtc-rx6110.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c
>> index 79161d4c6ce4..2a06953c0a84 100644
>> --- a/drivers/rtc/rtc-rx6110.c
>> +++ b/drivers/rtc/rtc-rx6110.c
>> @@ -447,6 +447,12 @@ static int rx6110_i2c_probe(struct i2c_client *client,
>>   	return rx6110_probe(rx6110, &client->dev);
>>   }
>>   
>> +static const struct acpi_device_id rx6110_i2c_acpi_match[] = {
>> +	{ "SECC6110" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(acpi, rx6110_i2c_acpi_match);
>> +
>>   static const struct i2c_device_id rx6110_i2c_id[] = {
>>   	{ "rx6110", 0 },
>>   	{ }
>> @@ -456,6 +462,7 @@ MODULE_DEVICE_TABLE(i2c, rx6110_i2c_id);
>>   static struct i2c_driver rx6110_i2c_driver = {
>>   	.driver = {
>>   		.name = RX6110_DRIVER_NAME,
>> +		.acpi_match_table = ACPI_PTR(rx6110_i2c_acpi_match),
> 
> Since you drop ifdeffery above, you have to drop ACPI_PTR() (besides that
> ACPI_PTR() requires acpi.h to be included).

Ok, will do that as well.

regards,
Claudius
