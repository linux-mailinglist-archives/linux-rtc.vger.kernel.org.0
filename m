Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C411596BAE
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Aug 2022 10:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232671AbiHQIxv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 Aug 2022 04:53:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiHQIxs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 17 Aug 2022 04:53:48 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 274C8760D7
        for <linux-rtc@vger.kernel.org>; Wed, 17 Aug 2022 01:53:46 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1oOEo4-0004bS-Cn; Wed, 17 Aug 2022 10:53:44 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1oOEo2-000HLy-ST; Wed, 17 Aug 2022 10:53:42 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1oOEo2-0054sq-3b; Wed, 17 Aug 2022 10:53:42 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-rtc@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v2 0/2] rtc: rv8803 patches
Date:   Wed, 17 Aug 2022 10:53:28 +0200
Message-Id: <20220817085330.1050492-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
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

This series has the remainder of
https://lore.kernel.org/all/20220426071056.1187235-1-s.hauer@pengutronix.de/
which was partly applied.

Sascha

Ahmad Fatoum (1):
  include/linux/bcd.h: provide bcd_is_valid() helper

Sascha Hauer (1):
  rtc: rv8803: invalidate date/time if alarm time is invalid

 drivers/rtc/rtc-rv8803.c | 45 +++++++++++++++++++++++++++++++++-------
 include/linux/bcd.h      |  4 ++++
 2 files changed, 42 insertions(+), 7 deletions(-)

-- 
2.30.2

