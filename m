Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 849654429AC
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Nov 2021 09:40:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbhKBIn3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 2 Nov 2021 04:43:29 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:53435 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhKBIn2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 2 Nov 2021 04:43:28 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1EE0E1BF213;
        Tue,  2 Nov 2021 08:40:50 +0000 (UTC)
Date:   Tue, 2 Nov 2021 09:40:50 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] rv8803: add irq-gpio optional dts attribute
Message-ID: <YYD5kv1WaEGTgL3X@piout.net>
References: <20211101013400.325855-1-dominique.martinet@atmark-techno.com>
 <20211101013400.325855-2-dominique.martinet@atmark-techno.com>
 <YYBuzqZD8/uK3d6Z@piout.net>
 <YYB7BXuLXWuiWGw6@atmark-techno.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYB7BXuLXWuiWGw6@atmark-techno.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 02/11/2021 08:40:53+0900, Dominique Martinet wrote:
> Alexandre Belloni wrote on Mon, Nov 01, 2021 at 11:48:46PM +0100:
> > On 01/11/2021 10:34:00+0900, Dominique Martinet wrote:
> > > Some device cannot be woken up from i2c signal.
> > > Add a new irq-gpio attribute for devices which have a gpio connected to
> > > the rv8803 INT line so the rtc can be used for suspend to mem
> > 
> > I don't think this is right, the interrupts property of the rtc node can
> > point to a gpio and this is expected to be the one connected on INT. You
> > don't need another property.
> 
> Oh, why didn't I know about such a useful property.
> 
> I thought I'd have a problem with the device wakeup part but there also
> is another 'wakeup-source' property, so there is really nothing left to
> do for this patch.
> Thank you for the pointer, no code is the best code!
> 

I'd say that you may still need the device_init_wakeup and
dev_pm_set_wake_irq calls.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
