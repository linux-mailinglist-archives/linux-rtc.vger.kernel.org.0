Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11BEA24FC99
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Aug 2020 13:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbgHXLbo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 24 Aug 2020 07:31:44 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36739 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726993AbgHXLb3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 24 Aug 2020 07:31:29 -0400
Received: from [2001:67c:670:201:5054:ff:fe8d:eefb] (helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <bst@pengutronix.de>)
        id 1kAAgt-00035z-6n; Mon, 24 Aug 2020 13:31:07 +0200
Subject: Re: [PATCH 2/3] dt-bindings: rtc: add chargeable flag for rx8130
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Arnaud Ebalard <arno@natisbad.org>,
        Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
References: <20200415163701.21989-1-bst@pengutronix.de>
 <20200415163701.21989-2-bst@pengutronix.de>
 <20200415185609.GP34509@piout.net>
From:   Bastian Krause <bst@pengutronix.de>
Message-ID: <3d1ecd35-fe37-02e7-74d8-3f37c2197173@pengutronix.de>
Date:   Mon, 24 Aug 2020 13:31:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200415185609.GP34509@piout.net>
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


On 4/15/20 8:56 PM, Alexandre Belloni wrote:
> On 15/04/2020 18:37:00+0200, Bastian Krause wrote:
>> Signed-off-by: Bastian Krause <bst@pengutronix.de>
>> ---
>>  Documentation/devicetree/bindings/rtc/rtc-ds1307.txt | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
>> index 66f0a31ae9ce..987a0c9e0cd7 100644
>> --- a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
>> +++ b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
>> @@ -34,6 +34,9 @@ Optional properties:
>>  - trickle-diode-disable : ds1339, ds1340 and ds 1388 only
>>  	Do not use internal trickle charger diode
>>  	Should be given if internal trickle charger diode should be disabled
>> +- aux-voltage-chargeable: rx8130 only
>> +	Epsons's rx8130 supports a backup battery/supercap.
>> +	This flag tells	whether the battery/supercap is chargeable or not.
>>  
> 
> I think we should make that a generic property and this should supersede
> trickle-diode-disable which is a bit wonky as I would prefer the default
> to be disabled instead of enabled with the current semantics.

Alright, I think I know how to transform the RTC drivers.

One question about the DTs though:

This means we should remove "trickle-diode-disable" from all upstream
DTs and add "aux-voltage-chargeable" to all upstream DTs that use a RTC
compatible whose driver care in their probe function for
"trickle-diode-disable", right?

Regards,
Bastian

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
