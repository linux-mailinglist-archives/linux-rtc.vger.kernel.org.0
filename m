Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C164530E2A
	for <lists+linux-rtc@lfdr.de>; Mon, 23 May 2022 12:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234032AbiEWK1w (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 May 2022 06:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234065AbiEWKZy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 May 2022 06:25:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C03E4B412
        for <linux-rtc@vger.kernel.org>; Mon, 23 May 2022 03:25:52 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1nt5G2-0001BL-O2; Mon, 23 May 2022 12:25:50 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1nt5G2-0002wH-3C; Mon, 23 May 2022 12:25:50 +0200
Date:   Mon, 23 May 2022 12:25:50 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org
Subject: Re: [PATCH 0/5] rtc: rv8803 patches
Message-ID: <20220523102550.GH2387@pengutronix.de>
References: <20220426071056.1187235-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426071056.1187235-1-s.hauer@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:22:53 up 53 days, 22:52, 77 users,  load average: 0.13, 0.17,
 0.17
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Alessandro, Alexandre,

Any input to this one?

Thanks,
 Sascha

On Tue, Apr 26, 2022 at 09:10:51AM +0200, Sascha Hauer wrote:
> This series has some patches for the rx8803 RTC handled by the rv8803
> driver. These patches mostly improve the voltage loss handling in the
> rx8803. While the rv8803 resets its registers on voltage loss the rx8803
> leaves registers in an undefined state after voltage loss. The patches
> are used here for a customer for quite a while, it's time to upstream
> them.
> 
> Sascha
> 
> Ahmad Fatoum (5):
>   rtc: rv8803: factor out existing register initialization to function
>   rtc: rv8803: initialize registers on post-probe voltage loss
>   rtc: rv8803: re-initialize all Epson RX8803 registers on voltage loss
>   include/linux/bcd.h: provide bcd_is_valid() helper
>   rtc: rv8803: invalidate date/time if alarm time is invalid
> 
>  drivers/rtc/rtc-rv8803.c | 134 ++++++++++++++++++++++++++++++++-------
>  include/linux/bcd.h      |   4 ++
>  2 files changed, 116 insertions(+), 22 deletions(-)
> 
> -- 
> 2.30.2
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
