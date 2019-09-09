Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA167ADA09
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Sep 2019 15:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728215AbfIINdf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 9 Sep 2019 09:33:35 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54261 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbfIINde (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 9 Sep 2019 09:33:34 -0400
Received: from erbse.hi.pengutronix.de ([2001:67c:670:100:9e5c:8eff:fece:cdfe])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <bst@pengutronix.de>)
        id 1i7JnQ-0003eg-Pk; Mon, 09 Sep 2019 15:33:32 +0200
Subject: Re: [PATCH] rtc: ds1307: Enable battery backup on RX8130
To:     Marek Vasut <marex@denx.de>, linux-rtc@vger.kernel.org
Cc:     Arnaud Ebalard <arno@natisbad.org>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        kernel@pengutronix.de
References: <20190628002151.4925-1-marex@denx.de>
 <acf967d9-cd5e-abf5-803d-4038b8ff3c51@pengutronix.de>
 <d15d2a30-fea7-bc34-1623-37ca122a3a47@denx.de>
From:   Bastian Krause <bst@pengutronix.de>
Message-ID: <025a5535-534e-8353-0c06-5b4dec4895a6@pengutronix.de>
Date:   Mon, 9 Sep 2019 15:33:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d15d2a30-fea7-bc34-1623-37ca122a3a47@denx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:9e5c:8eff:fece:cdfe
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On 9/5/19 3:00 PM, Marek Vasut wrote:
> On 8/30/19 12:42 PM, Bastian Krause wrote:
>> On 6/28/19 2:21 AM, Marek Vasut wrote:
>>> The battery backup can be disabled on this RTC, e.g. if populated right
>>> out of production. Force the battery backup bit on to enable it.
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> Cc: Arnaud Ebalard <arno@natisbad.org>
>>> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
>>> ---
>>>  drivers/rtc/rtc-ds1307.c | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
>>> index 1f7e8aefc1eb..4af00cac1eff 100644
>>> --- a/drivers/rtc/rtc-ds1307.c
>>> +++ b/drivers/rtc/rtc-ds1307.c
>>> @@ -121,6 +121,8 @@ enum ds_type {
>>>  #define RX8130_REG_FLAG_AF		BIT(3)
>>>  #define RX8130_REG_CONTROL0		0x1e
>>>  #define RX8130_REG_CONTROL0_AIE		BIT(3)
>>> +#define RX8130_REG_CONTROL1		0x0f
>>
>> I think it is surprising that RX8130_REG_CONTROL0 is defined absolute
>> and RX8130_REG_CONTROL1 must be used with chip offset. Having this
>> defined consistently would be nice.
> 
> It's because this old patch was rebased from before the regmap changes
> were even in.
> 
>>> +#define RX8130_REG_CONTROL1_INIEN	BIT(4)
>>>  
>>>  #define MCP794XX_REG_CONTROL		0x07
>>>  #	define MCP794XX_BIT_ALM0_EN	0x10
>>> @@ -1750,6 +1752,11 @@ static int ds1307_probe(struct i2c_client *client,
>>>  				     DS1307_REG_HOUR << 4 | 0x08, hour);
>>>  		}
>>>  		break;
>>> +	case rx_8130:
>>> +		/* make sure that the backup battery is enabled */
>>> +		regmap_write(ds1307->regmap, chip->offset + RX8130_REG_CONTROL1,
>>> +			     RX8130_REG_CONTROL1_INIEN);
>>> +		break;
>>
>> Quick note: if a rechargeable battery or supercap is used the CHGEN bit
>> must be set also.
> 
> By rechargable battery, you mean coin cell one ?

Yes, some rechargeable lithium coin/button cell. Or in my case a ELNA
0.2F 3.3V supercap.

Regards,
Bastian

-- 
Pengutronix e.K.
Industrial Linux Solutions
http://www.pengutronix.de/
Peiner Str. 6-8, 31137 Hildesheim, Germany
Amtsgericht Hildesheim, HRA 2686
