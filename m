Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C16CE373FAB
	for <lists+linux-rtc@lfdr.de>; Wed,  5 May 2021 18:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233942AbhEEQ0a (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 5 May 2021 12:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233882AbhEEQ03 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 5 May 2021 12:26:29 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23637C061574;
        Wed,  5 May 2021 09:25:33 -0700 (PDT)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
        (envelope-from <martin@viti.kaiser.cx>)
        id 1leKKw-0001MT-J6; Wed, 05 May 2021 18:25:22 +0200
Date:   Wed, 5 May 2021 18:25:22 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] rtc: imxdi: add wakeup support
Message-ID: <20210505162522.whho2nbqtxof62zk@viti.kaiser.cx>
References: <20210430093210.7034-1-martin@kaiser.cx>
 <YI0n/7M3Ke4DAwG2@piout.net>
 <20210504100858.4i2crnfwchlcopr7@viti.kaiser.cx>
 <YJE6QhePvy7f4LKW@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJE6QhePvy7f4LKW@piout.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

thanks for the quick reply.

Thus wrote Alexandre Belloni (alexandre.belloni@bootlin.com):

> Doesn't everyone expect the RTC to be a wakeup source? :)

Ok, I'll change this.

> > What is the right approach here? Are there any rtc drivers that act as a
> > wakeup source and can still be unloaded if compiled as a module?

> Yes, when you don't have alarmtimer ;)
> I honestly think the RTC selection needs to be a bit more dynamic but at
> the same time, it would not be great to change it at suspend time. I
> guess the best way would be to allow module unloading and tracking when
> the RTC disappears.

Ok, understood. There's no chance to address this in an rtc driver.

Out of curiousity, I tried adding a .remove_dev function in alarmtimer.
It isn't called when the I try to unload the rtc-imxdi module. It seems
that the module layer checks the refcount and returns an error before we
even attempt to remove the rtc device...

Best regards,
Martin
