Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDC66F08A
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Jul 2019 21:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfGTTzy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 20 Jul 2019 15:55:54 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:50237 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbfGTTzy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 20 Jul 2019 15:55:54 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id AA0DC60005;
        Sat, 20 Jul 2019 19:55:51 +0000 (UTC)
Date:   Sat, 20 Jul 2019 21:55:51 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Trent Piepho <tpiepho@impinj.com>
Cc:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "anson.huang@nxp.com" <anson.huang@nxp.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "aisheng.dong@nxp.com" <aisheng.dong@nxp.com>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>
Subject: Re: [PATCH] rtc: snvs: fix possible race condition
Message-ID: <20190720195551.GB3271@piout.net>
References: <20190716071858.36750-1-Anson.Huang@nxp.com>
 <AM0PR04MB421167283C950557E231181480C90@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <DB3PR0402MB39164D0022E25706D2B871C7F5C90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <AM0PR04MB421114F025F27AF2BC5FA21980C80@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <1563467526.2343.80.camel@impinj.com>
 <DB3PR0402MB3916053E6344520416BC976BF5CB0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <1563563060.2343.88.camel@impinj.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1563563060.2343.88.camel@impinj.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 19/07/2019 19:04:21+0000, Trent Piepho wrote:
> On Fri, 2019-07-19 at 02:57 +0000, Anson Huang wrote:
> > 
> > > I do worry that handling the irq before the rtc device is registered could still
> > > result in a crash.  From what I saw, the irq path in snvs only uses driver state
> > > members that are fully initialized for the most part, and the allocated but
> > > unregistered data->rtc is only used in one call to rtc_update_irq(), which
> > > appears to be ok with this.
> > > 
> > > But it is not that hard to imagine that something could go into the rtc core
> > > that assumes call like rtc_update_irq() are only made on registered devices.
> > > 
> > > If there was a way to do it, I think allocating the irq in a masked state and
> > > then unmasking it as part of the final registration call to make the device go
> > > live would be a safer and more general pattern.
> > 
> > It makes sense, I think we can just move the devm_request_irq() to after rtc_register_device(),
> > It will make sure everything is ready before IRQ is enabled. Will send out a V2 patch. 
> 
> That will mean registering the rtc, then unregistering it if the irq
> request fails.  More of a pain to write this failure path.
> 
> Alexandre, is it part of rtc core design that rtc_update_irq() might be
> called on a rtc device that is properly allocated, but not registered
> yet?

Yes, the main reason of the change of API was exactly to handle this.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
