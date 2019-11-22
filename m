Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9918A106933
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2019 10:48:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfKVJsK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Nov 2019 04:48:10 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59467 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfKVJsJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Nov 2019 04:48:09 -0500
Received: from erbse.hi.pengutronix.de ([2001:67c:670:100:9e5c:8eff:fece:cdfe])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <bst@pengutronix.de>)
        id 1iY5Xs-0006ul-IO; Fri, 22 Nov 2019 10:48:08 +0100
Subject: Re: [PATCH V2] rtc: ds1307: Enable battery backup on RX8130
To:     Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc:     Marek Vasut <marex@denx.de>, linux-rtc@vger.kernel.org,
        Arnaud Ebalard <arno@natisbad.org>, kernel@pengutronix.de
References: <20190905130336.10651-1-marex@denx.de>
 <3c07a9d4-e28e-df67-8a0b-9a6db48a9dc4@pengutronix.de>
 <ed1ef0a9-ff99-f986-8b9a-e2329bc82761@denx.de>
 <55288b3f-64e6-7ddb-3bcb-3418c976c59c@pengutronix.de>
 <20191121161303.GD299836@piout.net>
From:   Bastian Krause <bst@pengutronix.de>
Message-ID: <b3cb28a9-6e3f-56fa-39c3-88ab73634a76@pengutronix.de>
Date:   Fri, 22 Nov 2019 10:48:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191121161303.GD299836@piout.net>
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

On 11/21/19 5:39 PM, Alexandre Belloni wrote:
> On 21/11/2019 09:21:49+0100, Bastian Krause wrote:
>>
>> On 11/21/19 9:14 AM, Marek Vasut wrote:
>>> On 11/21/19 9:09 AM, Bastian Krause wrote:
>>>> On 9/5/19 3:03 PM, Marek Vasut wrote:
>>>>> The battery backup can be disabled on this RTC, e.g. if populated right
>>>>> out of production. Force the battery backup bit on to enable it.
>>>>>
>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>>> Cc: Arnaud Ebalard <arno@natisbad.org>
>>>>> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
>>>>> Cc: Bastian Krause <bst@pengutronix.de>
>>>>
>>>> Reviewed-by: Bastian Krause <bst@pengutronix.de>
>>>>
>>>
>>> I recall there was some comment about setting BIT(5) as well,
>>> RX8130_REG_CONTROL1_CHGEN , can you check that ?
>>
>> RX8130_REG_CONTROL1_CHGEN decides whether the battery or the supercap
>> should be charged or not. I think this patch is okay as is. I'll send a
>> follow-up patch which will set RX8130_REG_CONTROL1_CHGEN depending on a
>> new dt-binding "epson,backup-battery-chargeable" once this one is applied.
>>
> 
> You need to have a generic RTC property, either reuse
> trickle-diode-disable (I know the name is a bit unfortunate but that is
> waht we have) or have a new property stating that the auxiliary voltage
> is chargeable. using battery in the name is probably not wise because
> this may as well be a supercap.

Alright, thanks for the suggestion. I will incorporate into the patch.

Regards,
Bastian

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
