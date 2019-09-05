Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30723AA3D4
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Sep 2019 15:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389718AbfIENEK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Sep 2019 09:04:10 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:56316 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbfIENEJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Sep 2019 09:04:09 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 46PLVb5tjnz1rQ59;
        Thu,  5 Sep 2019 15:04:07 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 46PLVb5QjLz1qqkk;
        Thu,  5 Sep 2019 15:04:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id H_y-JTymBGaf; Thu,  5 Sep 2019 15:04:06 +0200 (CEST)
X-Auth-Info: 9DK+ylPD6ffWgP56bFYGTk0nejn5p3/Hhms7Pq9ADjI=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu,  5 Sep 2019 15:04:06 +0200 (CEST)
Subject: Re: [PATCH] rtc: ds1307: Enable battery backup on RX8130
To:     Bastian Krause <bst@pengutronix.de>, linux-rtc@vger.kernel.org
Cc:     Arnaud Ebalard <arno@natisbad.org>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        kernel@pengutronix.de
References: <20190628002151.4925-1-marex@denx.de>
 <acf967d9-cd5e-abf5-803d-4038b8ff3c51@pengutronix.de>
From:   Marek Vasut <marex@denx.de>
Message-ID: <d15d2a30-fea7-bc34-1623-37ca122a3a47@denx.de>
Date:   Thu, 5 Sep 2019 15:00:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <acf967d9-cd5e-abf5-803d-4038b8ff3c51@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 8/30/19 12:42 PM, Bastian Krause wrote:
> Hi Marek,

Hi,

> On 6/28/19 2:21 AM, Marek Vasut wrote:
>> The battery backup can be disabled on this RTC, e.g. if populated right
>> out of production. Force the battery backup bit on to enable it.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Arnaud Ebalard <arno@natisbad.org>
>> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
>> ---
>>  drivers/rtc/rtc-ds1307.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
>> index 1f7e8aefc1eb..4af00cac1eff 100644
>> --- a/drivers/rtc/rtc-ds1307.c
>> +++ b/drivers/rtc/rtc-ds1307.c
>> @@ -121,6 +121,8 @@ enum ds_type {
>>  #define RX8130_REG_FLAG_AF		BIT(3)
>>  #define RX8130_REG_CONTROL0		0x1e
>>  #define RX8130_REG_CONTROL0_AIE		BIT(3)
>> +#define RX8130_REG_CONTROL1		0x0f
> 
> I think it is surprising that RX8130_REG_CONTROL0 is defined absolute
> and RX8130_REG_CONTROL1 must be used with chip offset. Having this
> defined consistently would be nice.

It's because this old patch was rebased from before the regmap changes
were even in.

>> +#define RX8130_REG_CONTROL1_INIEN	BIT(4)
>>  
>>  #define MCP794XX_REG_CONTROL		0x07
>>  #	define MCP794XX_BIT_ALM0_EN	0x10
>> @@ -1750,6 +1752,11 @@ static int ds1307_probe(struct i2c_client *client,
>>  				     DS1307_REG_HOUR << 4 | 0x08, hour);
>>  		}
>>  		break;
>> +	case rx_8130:
>> +		/* make sure that the backup battery is enabled */
>> +		regmap_write(ds1307->regmap, chip->offset + RX8130_REG_CONTROL1,
>> +			     RX8130_REG_CONTROL1_INIEN);
>> +		break;
> 
> Quick note: if a rechargeable battery or supercap is used the CHGEN bit
> must be set also.

By rechargable battery, you mean coin cell one ?

-- 
Best regards,
Marek Vasut

DENX Software Engineering GmbH, Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-56 Email: marex@denx.de
