Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAA7950F1E1
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Apr 2022 09:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233575AbiDZHOb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Apr 2022 03:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343752AbiDZHOK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 Apr 2022 03:14:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0718019C0F
        for <linux-rtc@vger.kernel.org>; Tue, 26 Apr 2022 00:11:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1njFLg-0001g0-G1; Tue, 26 Apr 2022 09:11:00 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1njFLh-005IkU-0J; Tue, 26 Apr 2022 09:10:59 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1njFLe-004zAi-5F; Tue, 26 Apr 2022 09:10:58 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-rtc@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 0/5] rtc: rv8803 patches
Date:   Tue, 26 Apr 2022 09:10:51 +0200
Message-Id: <20220426071056.1187235-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series has some patches for the rx8803 RTC handled by the rv8803
driver. These patches mostly improve the voltage loss handling in the
rx8803. While the rv8803 resets its registers on voltage loss the rx8803
leaves registers in an undefined state after voltage loss. The patches
are used here for a customer for quite a while, it's time to upstream
them.

Sascha

Ahmad Fatoum (5):
  rtc: rv8803: factor out existing register initialization to function
  rtc: rv8803: initialize registers on post-probe voltage loss
  rtc: rv8803: re-initialize all Epson RX8803 registers on voltage loss
  include/linux/bcd.h: provide bcd_is_valid() helper
  rtc: rv8803: invalidate date/time if alarm time is invalid

 drivers/rtc/rtc-rv8803.c | 134 ++++++++++++++++++++++++++++++++-------
 include/linux/bcd.h      |   4 ++
 2 files changed, 116 insertions(+), 22 deletions(-)

-- 
2.30.2

