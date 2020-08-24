Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3546224FEF8
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Aug 2020 15:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbgHXNdr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 24 Aug 2020 09:33:47 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:52849 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727772AbgHXNci (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 24 Aug 2020 09:32:38 -0400
Received: from [2001:67c:670:201:5054:ff:fe8d:eefb] (helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <bst@pengutronix.de>)
        id 1kACaF-00085w-Uz; Mon, 24 Aug 2020 15:32:24 +0200
Subject: Re: [PATCH 2/3] dt-bindings: rtc: add chargeable flag for rx8130
From:   Bastian Krause <bst@pengutronix.de>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
        Arnaud Ebalard <arno@natisbad.org>,
        Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de
References: <20200415163701.21989-1-bst@pengutronix.de>
 <20200415163701.21989-2-bst@pengutronix.de>
 <20200415185609.GP34509@piout.net>
 <3d1ecd35-fe37-02e7-74d8-3f37c2197173@pengutronix.de>
Message-ID: <a492b6a0-b41c-a088-3ba1-f1448a074b34@pengutronix.de>
Date:   Mon, 24 Aug 2020 15:32:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3d1ecd35-fe37-02e7-74d8-3f37c2197173@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 8/24/20 1:31 PM, Bastian Krause wrote:
> 
> On 4/15/20 8:56 PM, Alexandre Belloni wrote:
>> On 15/04/2020 18:37:00+0200, Bastian Krause wrote:
>>> Signed-off-by: Bastian Krause <bst@pengutronix.de>
>>> ---
>>>  Documentation/devicetree/bindings/rtc/rtc-ds1307.txt | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
>>> index 66f0a31ae9ce..987a0c9e0cd7 100644
>>> --- a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
>>> +++ b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
>>> @@ -34,6 +34,9 @@ Optional properties:
>>>  - trickle-diode-disable : ds1339, ds1340 and ds 1388 only
>>>  	Do not use internal trickle charger diode
>>>  	Should be given if internal trickle charger diode should be disabled
>>> +- aux-voltage-chargeable: rx8130 only
>>> +	Epsons's rx8130 supports a backup battery/supercap.
>>> +	This flag tells	whether the battery/supercap is chargeable or not.
>>>  
>>
>> I think we should make that a generic property and this should supersede
>> trickle-diode-disable which is a bit wonky as I would prefer the default
>> to be disabled instead of enabled with the current semantics.
> 
> Alright, I think I know how to transform the RTC drivers.
> 
> One question about the DTs though:
> 
> This means we should remove "trickle-diode-disable" from all upstream
> DTs and add "aux-voltage-chargeable" to all upstream DTs that use a RTC
> compatible whose driver care in their probe function for
> "trickle-diode-disable", right?

Sorry, forget that.

Here's the situation:

Currently there is a switch to explicitly disable charging, so the
default is to charge. We cannot introduce another boolean switch to turn
that the other way around, because that would change the default and
break backwards compatibility.

The only way I can think of is to introduce "aux-voltage-chargeable" not
as a boolean switch but as an integer, without any default. If this
property is not available, the drivers should simply do what they did
prior to this change (look for the legacy trickle-diode-disable, use the
default they used before).

Are you okay with that?

Some more context:

I originally tried to add a chargeable flag for rx8130. Prior to this
patch, there was no need to set "trickle-diode-disable" for this,
because the driver did not pass the chargeable flag to the RTC. With the
patch the default would have been to charge as long as
"trickle-diode-disable" is not there. So there's a change in behavior.

Regards,
Bastian

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
