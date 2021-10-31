Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00674440DD4
	for <lists+linux-rtc@lfdr.de>; Sun, 31 Oct 2021 11:29:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbhJaKbp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 31 Oct 2021 06:31:45 -0400
Received: from smtp2.axis.com ([195.60.68.18]:62804 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229638AbhJaKbp (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 31 Oct 2021 06:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635676154;
  x=1667212154;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=jsBsR890SDq8iXow8DAd3AfZ518QJ0LNOOKg1GmL9mk=;
  b=T7MOJhwnQs9r6XKRfwTxS5lYsbxWhz3urBCPue8FPtTNlwX6o8PGaNWL
   C+9ggesCx8vofqAUFNA0lnvZ42MPA8nA42r8dMDeehbNTZgFq2K7YAEF8
   3UMPmNXzGDwB1igsvHJ+YBKf6vdceLN+IVOBPiOzoqCn5DQKvPZwQOGWf
   Oqf8htWR1ggYV15+KlEa3z7dulqxZkWeVOBqNz98h5taMSU5vcLIxYk8H
   YKwGUEaJC8VQuvsWdwSBGaPKIuAUTjo4OOpvwkeOBD2Q8q8w0k9NpZFNl
   +BJClsg5HmtzrIit6jBGukHpq7CQv6mJJh7vqsrHnGGefhFPUM2lBA71d
   A==;
Subject: Re: [PATCH 1/2] rtc: rs5c372: Add support for trim configuration
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Pavel Modilaynen <Pavel.Modilaynen@axis.com>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lkml@axis.com" <lkml@axis.com>, kernel <kernel@axis.com>
References: <20211030225054.32114-1-pavel.modilaynen@axis.com>
 <20211030225054.32114-2-pavel.modilaynen@axis.com>
 <YX3N9b6P4w1kSGfp@piout.net>
From:   Pavel Modilaynen <pavelmn@axis.com>
Message-ID: <6cc22970-fa11-ccb4-c155-62396a7e3890@axis.com>
Date:   Sun, 31 Oct 2021 11:29:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YX3N9b6P4w1kSGfp@piout.net>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail04w.axis.com (10.20.40.10) To se-mail05w.axis.com
 (10.20.40.11)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,


On 10/31/21 12:57 AM, Alexandre Belloni wrote:
> Hello,
> 
> Please use the proper RTC interface by implementing .set_offset and
> .read_offset.

I am not sure about .set/read_offset. It looks as runtime adjustment 
interface,
however this Xtal trimming parameter is based on schematics and Xtal 
capacitance (datasheet parameter).
It is found by calibration procedure based on RTC clock output (the 
procedure and calculation of trimming parameter is described in datasheets).
So, I would like to say that this parameter is functionally close to
"quartz-load-femtofarads" for rtc-pcf8523/pcf85063.

> 
> On 31/10/2021 00:50:53+0200, Pavel Modilaynen wrote:
>> From: Pavel Modilaynen <pavelmn@axis.com>
>> 
>> Add support for oscillation adjustment register RS5C372_REG_TRIM
>> setting that is needed to accommodate for effective crystal
>> capacitance.
>> 
>> Use optional property ricoh,trim that should contain
>> raw value to setup this register. According to
>> datasheets for RS5C372, R2025S/D, RV5C38[67] and R222[13]
>> the value will be converted to a number of ticks that
>> is to be subtracted or added when the second digits read
>> 00, 20 or 40 seconds.
>> 
>> Signed-off-by: Pavel Modilaynen <pavelmn@axis.com>
>> ---
>>  drivers/rtc/rtc-rs5c372.c | 18 +++++++++++++++++-
>>  1 file changed, 17 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
>> index 80980414890c..3a2db0326669 100644
>> --- a/drivers/rtc/rtc-rs5c372.c
>> +++ b/drivers/rtc/rtc-rs5c372.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/slab.h>
>>  #include <linux/module.h>
>>  #include <linux/of_device.h>
>> +#include <linux/of.h>
>>  
>>  /*
>>   * Ricoh has a family of I2C based RTCs, which differ only slightly from
>> @@ -560,6 +561,8 @@ static int rs5c_oscillator_setup(struct rs5c372 *rs5c372)
>>  {
>>        unsigned char buf[2];
>>        int addr, i, ret = 0;
>> +     struct i2c_client *client = rs5c372->client;
>> +     u8 trim = 0;
>>  
>>        addr   = RS5C_ADDR(RS5C_REG_CTRL1);
>>        buf[0] = rs5c372->regs[RS5C_REG_CTRL1];
>> @@ -599,9 +602,22 @@ static int rs5c_oscillator_setup(struct rs5c372 *rs5c372)
>>                break;
>>        }
>>  
>> +     /* optional setup of xtal trimming */
>> +     if (!of_property_read_u8(client->dev.of_node, "ricoh,trim", &trim)) {
>> +             if (rs5c372->type != rtc_r2221tl && (trim & ~RS5C372_TRIM_MASK)) {
>> +                     dev_warn(&client->dev, "Erroneous setting for ricoh,trim in devicetree\n");
>> +             } else {
>> +                     int addr = RS5C_ADDR(RS5C372_REG_TRIM);
>> +                     int ret = i2c_smbus_write_byte_data(client, addr, trim);
>> +
>> +                     if (unlikely(ret < 0))
>> +                             return ret;
>> +             }
>> +     }
>> +
>>        for (i = 0; i < sizeof(buf); i++) {
>>                addr = RS5C_ADDR(RS5C_REG_CTRL1 + i);
>> -             ret = i2c_smbus_write_byte_data(rs5c372->client, addr, buf[i]);
>> +             ret = i2c_smbus_write_byte_data(client, addr, buf[i]);
>>                if (unlikely(ret < 0))
>>                        return ret;
>>        }
>> -- 
>> 2.20.1
>> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com <https://bootlin.com>
