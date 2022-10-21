Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E42626077D1
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Oct 2022 15:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbiJUNIo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 21 Oct 2022 09:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbiJUNIh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 21 Oct 2022 09:08:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B93626C45E
        for <linux-rtc@vger.kernel.org>; Fri, 21 Oct 2022 06:08:25 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk5-0001XT-RE; Fri, 21 Oct 2022 15:07:18 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk1-000WlS-8A; Fri, 21 Oct 2022 15:07:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk2-009Z8M-TP; Fri, 21 Oct 2022 15:07:14 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de, Benjamin Fair <benjaminfair@google.com>,
        openbmc@lists.ozlabs.org
Subject: [PATCH 0/9] rtc: Convert i2c drivers to .probe_new()
Date:   Fri, 21 Oct 2022 15:06:57 +0200
Message-Id: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Bp9OcOyleZeruLKjOH3pBb8HDT/kKtym28YFv41winI=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjUplWDBoXcgANYtax+ko77biRthvJsAMnEqtUECzW PCWJOd+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY1KZVgAKCRDB/BR4rcrsCXJHB/ 0fYRjl2NwNwf2bWjE2+ckBIEgSYfx/Pv6UopUQ0kuxhk4Uv9RCrjbtxs+6lhExILzXjapnXjaOf/li oF5BIlPo4XE4CuqhobsKBmTs2slrG3BPL39zBbDd3iHjzriSsL3PAqc+C4WqbKhq0erABBIyQFcnqi zplXsL1pEDuQXhLLquWbCZtzIL4baFNE3IUMfYNhoLbSW3NwW26Y0PLflVEHxrKpsgQY6EJfJj3jb+ pElziCA+x7ozhIRWzOQRRDrxXdPxC5oXzTWZhRqOU/QhiFQKgLeJxJVHl30NwdhvaYZEYufKIw/96G 3CRnMxoY5laZlKk65wqLW8IHwDT3JD
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

See commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back
type") for the rationale.

Best regards
Uwe

Uwe Kleine-König (9):
  rtc: abx80x: Convert to .probe_new()
  rtc: ds1307: Convert to .probe_new()
  rtc: isl1208: Convert to .probe_new()
  rtc: m41t80: Convert to .probe_new()
  rtc: nct3018y: Convert to .probe_new()
  rtc: pcf2127: Convert to .probe_new()
  rtc: rs5c372: Convert to .probe_new()
  rtc: rv8803: Convert to .probe_new()
  rtc: rx8025: Convert to .probe_new()

 drivers/rtc/rtc-abx80x.c   | 36 ++++++++++++++++++------------------
 drivers/rtc/rtc-ds1307.c   |  8 ++++----
 drivers/rtc/rtc-isl1208.c  |  6 ++++--
 drivers/rtc/rtc-m41t80.c   | 11 ++++++-----
 drivers/rtc/rtc-nct3018y.c |  5 ++---
 drivers/rtc/rtc-pcf2127.c  | 22 +++++++++++-----------
 drivers/rtc/rtc-rs5c372.c  | 11 ++++++-----
 drivers/rtc/rtc-rv8803.c   | 30 ++++++++++++++++--------------
 drivers/rtc/rtc-rx8025.c   |  6 +++---
 9 files changed, 70 insertions(+), 65 deletions(-)


base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
-- 
2.37.2

