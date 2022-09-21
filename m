Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDF9A5BFFFA
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Sep 2022 16:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbiIUOgB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 21 Sep 2022 10:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbiIUOgA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 21 Sep 2022 10:36:00 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 877287C310
        for <linux-rtc@vger.kernel.org>; Wed, 21 Sep 2022 07:35:59 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1ob0pR-0008Os-RL; Wed, 21 Sep 2022 16:35:57 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1ob0pR-00046y-7U; Wed, 21 Sep 2022 16:35:57 +0200
Date:   Wed, 21 Sep 2022 16:35:57 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 0/2] rtc: rv8803 patches
Message-ID: <20220921143557.GE986@pengutronix.de>
References: <20220817085330.1050492-1-s.hauer@pengutronix.de>
 <20220921131753.GP12909@pengutronix.de>
 <YyseEdX9/xuyKGka@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyseEdX9/xuyKGka@mail.local>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Sep 21, 2022 at 04:22:09PM +0200, Alexandre Belloni wrote:
> Hi,
> 
> On 21/09/2022 15:17:53+0200, Sascha Hauer wrote:
> > Hi Alexandre,
> > 
> > Any input to this series?
> 
> I'm not convinced this is necessary. Having an invalid alarm doesn't
> mean that the time is invalid and that check will only ever happen at
> boot time whereas V2F is a reliable indication that the time is invalid.
> 
> Have you really had an RTC with an invalid time that is not caught by
> rtc_valid_tm and with V2F not set?

I don't know. I must talk to Ahmad in this regard, he'll be back next
week. It could be that we only created this patch to be sure the RTC
state is sane.

Sascha


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
