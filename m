Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBA872022
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jul 2019 21:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbfGWTe6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 23 Jul 2019 15:34:58 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:38771 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731962AbfGWTey (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 23 Jul 2019 15:34:54 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1hq0Yi-0002xz-Ii; Tue, 23 Jul 2019 21:34:48 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hq0Yd-0005FW-Ab; Tue, 23 Jul 2019 21:34:43 +0200
Date:   Tue, 23 Jul 2019 21:34:43 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Oliver Hartkopp <socketcan@hartkopp.net>
Cc:     linux-arm-kernel@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
        tbm@cyrius.com, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: TS-219 RTC issue with Debian Buster
Message-ID: <20190723193443.bqcbrxalng554u76@pengutronix.de>
References: <99a8e2cc-61a2-3b43-0d72-6f001cffe572@hartkopp.net>
 <20190723190636.tuzob2w2fznmtsmb@pengutronix.de>
 <4a5c0768-0383-0a16-8d3f-639dc9530abf@hartkopp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a5c0768-0383-0a16-8d3f-639dc9530abf@hartkopp.net>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Oliver,

On Tue, Jul 23, 2019 at 09:21:06PM +0200, Oliver Hartkopp wrote:
> I think I already solved the problem, see here:
> https://marc.info/?l=linux-arm-kernel&m=156390875629259&w=2

IMHO the right fix is teach hwclock to handle your rtc correctly.
Changing the driver from =m to =y is only a workaround.

Maybe also using the time stuff from systemd instead of hwclock will
help^Wwork around your problem (not sure though).

Also I wonder why the ioctl to enable UIE doesn't fail if the driver set
.uie_unsupported (but I didn't look closely).

> Will file a Debian bug for it ...

Not sure this will have success. These were switched from =y to =m
because the kernel images got to big.
(https://salsa.debian.org/kernel-team/linux/commit/c55043a43eaacb9f876dabd71273b084cb024441)

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
