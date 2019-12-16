Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0BC12038B
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Dec 2019 12:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbfLPLRH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Dec 2019 06:17:07 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:40579 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbfLPLRH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 16 Dec 2019 06:17:07 -0500
Received: from erbse.hi.pengutronix.de ([2001:67c:670:100:9e5c:8eff:fece:cdfe])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <bst@pengutronix.de>)
        id 1igoN8-00050D-8A; Mon, 16 Dec 2019 12:17:06 +0100
Subject: Re: [PATCH V2] rtc: ds1307: Enable battery backup on RX8130
From:   Bastian Krause <bst@pengutronix.de>
To:     Marek Vasut <marex@denx.de>, linux-rtc@vger.kernel.org
Cc:     Arnaud Ebalard <arno@natisbad.org>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>
References: <20190905130336.10651-1-marex@denx.de>
 <3c07a9d4-e28e-df67-8a0b-9a6db48a9dc4@pengutronix.de>
Message-ID: <866bcf30-bd1d-ed45-b761-8ddd2c3b2a4e@pengutronix.de>
Date:   Mon, 16 Dec 2019 12:17:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <3c07a9d4-e28e-df67-8a0b-9a6db48a9dc4@pengutronix.de>
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

Gentle ping.

Regards,
Bastian

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
