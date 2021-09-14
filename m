Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD8040BAC6
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Sep 2021 23:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234431AbhINV4P (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 14 Sep 2021 17:56:15 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:43819 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233952AbhINV4O (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 14 Sep 2021 17:56:14 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B3CE340005;
        Tue, 14 Sep 2021 21:54:55 +0000 (UTC)
Date:   Tue, 14 Sep 2021 23:54:55 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     jianbin zhang <quic_jianbinz@quicinc.com>
Cc:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH] rtc: Disable alarm irq if alarm is enabled and alarm
 time is less than or equal to current time
Message-ID: <YUEaL9CjTpPMr3Go@piout.net>
References: <BN6PR02MB33324335E951F54DA1B00667E1D69@BN6PR02MB3332.namprd02.prod.outlook.com>
 <YTusgJlMUdXOKQaL@piout.net>
 <9c817836-64d6-1452-189f-2783c4138ace@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c817836-64d6-1452-189f-2783c4138ace@quicinc.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 14/09/2021 10:50:33+0800, jianbin zhang wrote:
> 
> On 9/11/21 3:05 AM, Alexandre Belloni wrote:
> > Hello,
> > 
> > Please format your patch properly.
> 
> I am so sorry for bothering you because of the patch format. I test the patch format in the local and
> 
> the format works well. Such case will not occur.
> 
> > > If device is booted up by rtc alarm, the alarm irq  will still be enabled and the alarm time is less than current rtc time before any alarm is set or canceled .
> > > 
> > > If device is shut down this time, it will boot up automatically as the alarm irq is enabled and alarm time is less than current rtc time.
> > > 
> > > 
> > > 
> > > For the situation that the alarm time and rtc time are equal to boot up the device, we expect irq to be false until another alarm is reconfigured, then irq becomes true again.
> > > 
> > > 
> > > 
> > > So disable alarm irq if alarm is enabled and alarm time is less than or equal to current rtc time.
> > > 
> > You should probably fix your driver instead of messing with the core.
> >  From what I understand, you have:
> > 
> >   1/ set the alarm
> >   2/ shutdown
> >   3/ alarm happens, the device boots
> >   4/ shutdown
> >   5/ alarm irq is still set, device boots again
> > 
> > At step 3, your driver has to acknowledge and clear the irq
> 
> Thanks for great reviewing.
> 1/Yeah, the steps you understand are right.
> 2/In fact I met the issue when using the core rtc driver.That means I do not have a private driver on the issue.
> 

Well, the core isn't a driver, which driver are you using?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
