Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B57D123AD
	for <lists+linux-rtc@lfdr.de>; Thu,  2 May 2019 22:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbfEBUzU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 2 May 2019 16:55:20 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:56387 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbfEBUzT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 2 May 2019 16:55:19 -0400
X-Originating-IP: 90.66.53.80
Received: from localhost (lfbn-1-3034-80.w90-66.abo.wanadoo.fr [90.66.53.80])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 858DB1C0009;
        Thu,  2 May 2019 20:55:17 +0000 (UTC)
Date:   Thu, 2 May 2019 22:55:16 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dylan Howey <Dylan.Howey@tennantco.com>
Cc:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 1/2] Port rtc-pcf2123 to regmap
Message-ID: <20190502205516.GD22550@piout.net>
References: <20190426193648.1599-1-Dylan.Howey@tennantco.com>
 <20190427130054.GY14604@piout.net>
 <20190429150913.GA15052@tennantco.com>
 <20190430092256.GC11339@piout.net>
 <20190502174518.GA12323@tennantco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190502174518.GA12323@tennantco.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 02/05/2019 17:45:24+0000, Dylan Howey wrote:
> As I'm working on this I've run across some other issues:
> 
> * Driver does not do a software reset on init. Datasheet recommends doing
>   this as this will clear any interrupts and alarm flags. The fix would
>   presumably be to add a call to pcf2123_reset in the init, but...
> 

It recommends doing a software reset after power-on in that case, it
refers to the power-on of the RTC, not the platform. You shouldn't do a
software reset as this will break time keeping, the offset and reading
alarms that may have been starting the platform.

> * pcf2123_reset stops the RTC for no apparent reason. Result is that the
>   time is invalid after a call to pcf2123_reset, which requires the time
>   to be set again manually. The fix would be to delete the stop commands.
> 

Using the software reset will render the time invalid anyway as this
will set the OS bit in the seconds register (see Table 7.
Register reset values).

> * I don't think pcf2123_read_offset is working correctly. In the case of
>   a coarse offset the value is not being sign extended. So a negative
>   offset read will not be correct if the coarse bit is set (result would
>   be a positive number being returned if this is true). I need to look
>   into this some more. The fix would be to sign extend first, then if
>   coarse bit is set multiply the result by 2.
> 

As the comment says, it is properly extended because after shifting,
bits [6:0] become bit [7:1].

> Not sure if I'll fix these issues right now. Also this RTC does have the 
> ability to do periodic interrupts but the feature has not been implemented
> in this driver. So I'll leave uie_unsupported set for now.
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
