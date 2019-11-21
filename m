Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 462DB104D9D
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Nov 2019 09:14:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbfKUIOY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 21 Nov 2019 03:14:24 -0500
Received: from mail-out.m-online.net ([212.18.0.10]:49978 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbfKUIOY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 21 Nov 2019 03:14:24 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 47JXQj1Lw4z1rW5x;
        Thu, 21 Nov 2019 09:14:21 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 47JXQj0C21z1qqkw;
        Thu, 21 Nov 2019 09:14:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id DO9d7aHBsGzJ; Thu, 21 Nov 2019 09:14:20 +0100 (CET)
X-Auth-Info: LtUo8fHUWxmiUjIeAiJtNvWShe+tNgkryg1u6pD9Nn0=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu, 21 Nov 2019 09:14:20 +0100 (CET)
Subject: Re: [PATCH V2] rtc: ds1307: Enable battery backup on RX8130
To:     Bastian Krause <bst@pengutronix.de>, linux-rtc@vger.kernel.org
Cc:     Arnaud Ebalard <arno@natisbad.org>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>
References: <20190905130336.10651-1-marex@denx.de>
 <3c07a9d4-e28e-df67-8a0b-9a6db48a9dc4@pengutronix.de>
From:   Marek Vasut <marex@denx.de>
Message-ID: <ed1ef0a9-ff99-f986-8b9a-e2329bc82761@denx.de>
Date:   Thu, 21 Nov 2019 09:14:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3c07a9d4-e28e-df67-8a0b-9a6db48a9dc4@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/21/19 9:09 AM, Bastian Krause wrote:
> On 9/5/19 3:03 PM, Marek Vasut wrote:
>> The battery backup can be disabled on this RTC, e.g. if populated right
>> out of production. Force the battery backup bit on to enable it.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Arnaud Ebalard <arno@natisbad.org>
>> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
>> Cc: Bastian Krause <bst@pengutronix.de>
> 
> Reviewed-by: Bastian Krause <bst@pengutronix.de>
> 

I recall there was some comment about setting BIT(5) as well,
RX8130_REG_CONTROL1_CHGEN , can you check that ?

> 
>> ---
>> V2: Drop the custom offset, let regmap handle that
>> ---
>>  drivers/rtc/rtc-ds1307.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
>> index 1f7e8aefc1eb..f2d1e59478c2 100644
>> --- a/drivers/rtc/rtc-ds1307.c
>> +++ b/drivers/rtc/rtc-ds1307.c
>> @@ -121,6 +121,8 @@ enum ds_type {
>>  #define RX8130_REG_FLAG_AF		BIT(3)
>>  #define RX8130_REG_CONTROL0		0x1e
>>  #define RX8130_REG_CONTROL0_AIE		BIT(3)
>> +#define RX8130_REG_CONTROL1		0x1f
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
>> +		regmap_write(ds1307->regmap, RX8130_REG_CONTROL1,
>> +			     RX8130_REG_CONTROL1_INIEN);
>> +		break;
>>  	default:
>>  		break;
>>  	}
>>
> 
> 


-- 
Best regards,
Marek Vasut
