Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C690981BD1
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Aug 2019 15:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728837AbfHENRV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Aug 2019 09:17:21 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:59145 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728854AbfHENFa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Aug 2019 09:05:30 -0400
X-Originating-IP: 82.246.155.60
Received: from localhost (hy283-1-82-246-155-60.fbx.proxad.net [82.246.155.60])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 064A3FF80C;
        Mon,  5 Aug 2019 13:05:27 +0000 (UTC)
Date:   Mon, 5 Aug 2019 15:05:26 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     marcus.wolf@wolf-entwicklungen.de
Cc:     a.zummo@towertech.it, havasi@efr.de, linux-rtc@vger.kernel.org,
        b.spranger@linutronix.de
Subject: Re: RTC Epson Toyocom RX-8025T
Message-ID: <20190805130526.GD3600@piout.net>
References: <20190727084806.7DF892CE0139@dd39320.kasserver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190727084806.7DF892CE0139@dd39320.kasserver.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 27/07/2019 10:48:06+0200, marcus.wolf@wolf-entwicklungen.de wrote:
> Hello Alessandro, hello Alexandre,
> 
> in a product of a customer of mine, the RX-8025T real time clock from Epson
> Toyocom is used.
> 
> My customer would like me to integrate the driver for this clock to mainline of
> the kernel.
> 
> At the moment, we have a seperate implementation, basing on the implemenattion
> of the existing RX-8025 driver.
> 
> Although the rtc of my customer has almost the same "name" as the one, the
> current driver is available for (just last letter differs), it works quite
> different. So for example I compared the registerset of the two clocks.Only 5
> of 16 registers are identical, 3 are very similar, but the other 8 are
> completely different. Also the functionality is quite different. Of course
> first of all, both are clocks, but all aditional features are not identical.
> The already supported SA type has two alarms - a day and a week alarm. The tyoe
> of my customer (t) just has one alarm, that can be switched to day and to week
> mode. In adition it has a timer and an 8bit RAM cell. In addition the protocol
> how to adress the registers on I2C is different....
> 
> Would you like me to propose you the support for the RX-8025T as a separate
> implementation - aka new driver?

I think that what you have is actually a RX-8801SA. Can you check that the
register layout is the same? The datasheet is available here:

https://support.epson.biz/td/api/doc_check.php?dl=app_RX-8801SA&lang=en

> On which base you'd like to see the patches? Head of mainline, last stable
> (5.2.2), or ....?
> 

v5.3-rc1 or rtc-next.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
