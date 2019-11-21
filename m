Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5895A104DE4
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Nov 2019 09:28:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbfKUI2x (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 21 Nov 2019 03:28:53 -0500
Received: from mail-out.m-online.net ([212.18.0.10]:50344 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbfKUI2x (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 21 Nov 2019 03:28:53 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 47JXlR3V2Pz1rfbr;
        Thu, 21 Nov 2019 09:28:51 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 47JXlR2yJ7z1qqkv;
        Thu, 21 Nov 2019 09:28:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id Ja5EUYoOPCzS; Thu, 21 Nov 2019 09:28:50 +0100 (CET)
X-Auth-Info: O/BygeWbrWzYvDNso8V3ixzM7krBIqomVE21L6X5aqA=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu, 21 Nov 2019 09:28:50 +0100 (CET)
Subject: Re: [PATCH V2] rtc: ds1307: Enable battery backup on RX8130
To:     Bastian Krause <bst@pengutronix.de>, linux-rtc@vger.kernel.org
Cc:     Arnaud Ebalard <arno@natisbad.org>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        kernel@pengutronix.de
References: <20190905130336.10651-1-marex@denx.de>
 <3c07a9d4-e28e-df67-8a0b-9a6db48a9dc4@pengutronix.de>
 <ed1ef0a9-ff99-f986-8b9a-e2329bc82761@denx.de>
 <55288b3f-64e6-7ddb-3bcb-3418c976c59c@pengutronix.de>
From:   Marek Vasut <marex@denx.de>
Message-ID: <b503e797-6f5d-be1f-3730-fb64ccc7cec8@denx.de>
Date:   Thu, 21 Nov 2019 09:28:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <55288b3f-64e6-7ddb-3bcb-3418c976c59c@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/21/19 9:21 AM, Bastian Krause wrote:
> 
> On 11/21/19 9:14 AM, Marek Vasut wrote:
>> On 11/21/19 9:09 AM, Bastian Krause wrote:
>>> On 9/5/19 3:03 PM, Marek Vasut wrote:
>>>> The battery backup can be disabled on this RTC, e.g. if populated right
>>>> out of production. Force the battery backup bit on to enable it.
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> Cc: Arnaud Ebalard <arno@natisbad.org>
>>>> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
>>>> Cc: Bastian Krause <bst@pengutronix.de>
>>>
>>> Reviewed-by: Bastian Krause <bst@pengutronix.de>
>>>
>>
>> I recall there was some comment about setting BIT(5) as well,
>> RX8130_REG_CONTROL1_CHGEN , can you check that ?
> 
> RX8130_REG_CONTROL1_CHGEN decides whether the battery or the supercap
> should be charged or not. I think this patch is okay as is. I'll send a
> follow-up patch which will set RX8130_REG_CONTROL1_CHGEN depending on a
> new dt-binding "epson,backup-battery-chargeable" once this one is applied.

Even better, thanks.
