Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44D0F1909BE
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Mar 2020 10:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727366AbgCXJmM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 24 Mar 2020 05:42:12 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:45807 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727223AbgCXJmM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 24 Mar 2020 05:42:12 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id DCD5FC000F;
        Tue, 24 Mar 2020 09:42:10 +0000 (UTC)
Date:   Tue, 24 Mar 2020 10:42:09 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     xiaolinkui <xiaolinkui@tj.kylinos.cn>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: Kconfig: change the tristate type to bool
Message-ID: <20200324094209.GI5504@piout.net>
References: <20200323124339.6520-1-xiaolinkui@tj.kylinos.cn>
 <20200323134335.GC5504@piout.net>
 <336f9aea-d28a-d114-9a0c-a893d9cb9af3@tj.kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <336f9aea-d28a-d114-9a0c-a893d9cb9af3@tj.kylinos.cn>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 24/03/2020 17:33:00+0800, xiaolinkui wrote:
> On 3/23/20 9:43 PM, Alexandre Belloni wrote:
> > On 23/03/2020 20:43:39+0800, xiaolinkui wrote:
> > > If the rtc driver is compiled into a module, hctosys can't
> > > read the rtc clock during system startup.
> > > The dmesg log will have the following information:
> > > 
> > > [    2.286512] hctosys: unable to open rtc device (rtc0)
> > > 
> > > So the rtc driver configuration we need cannot be set to m.
> > > 
> > Wow, you are not even trying, the solution is to not use hctosys.
> > 
> > 
> Thank you for your reply. Yes, if we don't use hctosys, we won't have this
> problem. But　without hctosys, we cannot get the clock from rtc during
> system startup.  Is it wrong for the　system time each time the system is
> started for a machine without Internet access?
> 

Your userspace can read the RTC and set the system time properly.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
