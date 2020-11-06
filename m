Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5DF2A921D
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Nov 2020 10:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgKFJI7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Nov 2020 04:08:59 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:53039 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgKFJI6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Nov 2020 04:08:58 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E825360014;
        Fri,  6 Nov 2020 09:08:55 +0000 (UTC)
Date:   Fri, 6 Nov 2020 10:08:55 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Claudius Heine <ch@denx.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johannes Hahn <johannes-hahn@siemens.com>,
        werner.zeh@siemens.com
Subject: Re: [PATCH 0/2]  Adding I2C support to RX6110 RTC
Message-ID: <20201106090855.GN1034841@piout.net>
References: <20201104102629.3422048-1-ch@denx.de>
 <20201105221451.GH1034841@piout.net>
 <20201106084034.0ea09ea3@md1za8fc.ad001.siemens.net>
 <20201106075908.GJ1034841@piout.net>
 <20201106095756.0dd8f267@md1za8fc.ad001.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106095756.0dd8f267@md1za8fc.ad001.siemens.net>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 06/11/2020 09:57:56+0100, Henning Schild wrote:
> Am Fri, 6 Nov 2020 08:59:08 +0100
> schrieb Alexandre Belloni <alexandre.belloni@bootlin.com>:
> 
> > On 06/11/2020 08:40:34+0100, Henning Schild wrote:
> > > Hi,
> > > 
> > > Am Thu, 5 Nov 2020 23:14:51 +0100
> > > schrieb Alexandre Belloni <alexandre.belloni@bootlin.com>:
> > >   
> > > > Hello Claudius!
> > > > 
> > > > It has been a while ;)
> > > > 
> > > > On 04/11/2020 11:26:27+0100, Claudius Heine wrote:  
> > > > > Hi,
> > > > > 
> > > > > this patch introduces I2C support to the RX6110 RTC driver and
> > > > > also adds an ACPI identifier to it.
> > > > > 
> > > > > Since we are also pushing the coreboot changes for the ACPI
> > > > > table upstream in parallel, we are free to name this ACPI entry
> > > > > however we like it seems. So any feedback on that would be
> > > > > welcome ;) 
> > > > 
> > > > I don't care too much about ACPI so if you are really looking for
> > > > advice there, I guess you should ask seom of the ACPI guys (but I
> > > > guess you are free to choose whatever you want).
> > > >   
> > > 
> > > This is the coreboot stuff currently under review.
> > > 
> > > https://review.coreboot.org/c/coreboot/+/47235
> > >   
> > 
> > I can't really comment on the patch, however another part is worrying:
> > if VLF is set, coreboot is resetting the time to a valid value (user
> > defined or the build date). This is nasty because this hides the event
> > from the kernel and ulimately, userspace has no way of knowing whether
> > the RTC date is the real date or just a dummy date.
> 
> Is that worrying problem part of the patch, or just a general
> observation looking at their driver?
> 

It is a separate observation on their driver.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
