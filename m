Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 925FB5EA0A1
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Sep 2022 12:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236171AbiIZKkZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 26 Sep 2022 06:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236590AbiIZKjn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 26 Sep 2022 06:39:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A31754640
        for <linux-rtc@vger.kernel.org>; Mon, 26 Sep 2022 03:23:46 -0700 (PDT)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1oclGj-0006PZ-5b; Mon, 26 Sep 2022 12:23:21 +0200
Message-ID: <952c4575-1acc-4cbd-4d64-1dc58c53ae99@pengutronix.de>
Date:   Mon, 26 Sep 2022 11:23:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v2 0/2] rtc: rv8803 patches
To:     Sascha Hauer <s.hauer@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        kernel@pengutronix.de
References: <20220817085330.1050492-1-s.hauer@pengutronix.de>
 <20220921131753.GP12909@pengutronix.de> <YyseEdX9/xuyKGka@mail.local>
 <20220921143557.GE986@pengutronix.de>
Content-Language: en-US
In-Reply-To: <20220921143557.GE986@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Alexandre,
Hello Sascha,

On 21.09.22 15:35, Sascha Hauer wrote:
> On Wed, Sep 21, 2022 at 04:22:09PM +0200, Alexandre Belloni wrote:
>> Hi,
>>
>> On 21/09/2022 15:17:53+0200, Sascha Hauer wrote:
>>> Hi Alexandre,
>>>
>>> Any input to this series?
>>
>> I'm not convinced this is necessary. Having an invalid alarm doesn't
>> mean that the time is invalid and that check will only ever happen at
>> boot time whereas V2F is a reliable indication that the time is invalid.
>>
>> Have you really had an RTC with an invalid time that is not caught by
>> rtc_valid_tm and with V2F not set?
> 
> I don't know. I must talk to Ahmad in this regard, he'll be back next
> week. It could be that we only created this patch to be sure the RTC
> state is sane.

The kernel message

  rtc rtc0: invalid alarm value: 2020-3-27 7:82:0

listed in the commit message is something I actually ran into. There
was no v2f set then. The customer has also variously observed bit flips
independently of v2f: During EMC testing, electrostatic discharge at developer
desks and even in the field: Suspected causes were lightning strikes in the
vicinity and the switching of larger inductive loads.
They're very paranoid of logging invalid timestamps, so we'll keep the patch
anyhow at our side, but I think it is generally useful as well: If we can't
set an invalid alarm time by normal means, but read back an invalid time,
something may have corrupted other memory, so treating it as a v2f is sensible.

Thanks,
Ahmad

> 
> Sascha
> 
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
