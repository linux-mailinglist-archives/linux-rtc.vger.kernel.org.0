Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 138496358EA
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Nov 2022 11:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236148AbiKWKFA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Nov 2022 05:05:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236472AbiKWKEL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 23 Nov 2022 05:04:11 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 682911121E1
        for <linux-rtc@vger.kernel.org>; Wed, 23 Nov 2022 01:55:32 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1oxmTa-0005bR-ND; Wed, 23 Nov 2022 10:55:30 +0100
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1oxmTY-0061TG-Ho; Wed, 23 Nov 2022 10:55:29 +0100
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1oxmTY-00BdPg-T8; Wed, 23 Nov 2022 10:55:28 +0100
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-rtc@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel@pengutronix.de, Alessandro Zummo <a.zummo@towertech.it>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH RESEND 0/2] rtc: rv8803 patches
Date:   Wed, 23 Nov 2022 10:55:25 +0100
Message-Id: <20221123095527.2771434-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
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

This series has the remainder of
https://lore.kernel.org/all/20220426071056.1187235-1-s.hauer@pengutronix.de/
which was partly applied.

Alexandre,

Last time this series was send you asked if this series fixes a problem
we've really seen to which Ahmad answered:

> The kernel message
> 
>   rtc rtc0: invalid alarm value: 2020-3-27 7:82:0
> 
> listed in the commit message is something I actually ran into. There
> was no v2f set then. The customer has also variously observed bit flips
> independently of v2f: During EMC testing, electrostatic discharge at developer
> desks and even in the field: Suspected causes were lightning strikes in the
> vicinity and the switching of larger inductive loads.
> They're very paranoid of logging invalid timestamps, so we'll keep the patch
> anyhow at our side, but I think it is generally useful as well: If we can't
> set an invalid alarm time by normal means, but read back an invalid time,
> something may have corrupted other memory, so treating it as a v2f is sensible.

There was no answer to this. I would be glad if you could take this
series. I would understand though if you say that this problem is too
esoteric to fix it upstream, we would keep the patches locally then.
Please just say so, it would help me to get the problem from my desk ;)

Thanks,
  Sascha



Ahman Fatoum (1):
  include/linux/bcd.h: provide bcd_is_valid() helper

Sascha Hauer (1):
  rtc: rv8803: invalidate date/time if alarm time is invalid

 drivers/rtc/rtc-rv8803.c | 45 +++++++++++++++++++++++++++++++++-------
 include/linux/bcd.h      |  4 ++++
 2 files changed, 42 insertions(+), 7 deletions(-)

-- 
2.30.2

