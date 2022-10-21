Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9926077D4
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Oct 2022 15:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbiJUNIq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 21 Oct 2022 09:08:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbiJUNIj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 21 Oct 2022 09:08:39 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DCC026C46A
        for <linux-rtc@vger.kernel.org>; Fri, 21 Oct 2022 06:08:27 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk5-0001Xp-RL; Fri, 21 Oct 2022 15:07:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk2-000Wlm-JF; Fri, 21 Oct 2022 15:07:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk4-009Z8d-7E; Fri, 21 Oct 2022 15:07:16 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Benjamin Fair <benjaminfair@google.com>,
        openbmc@lists.ozlabs.org, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 5/9] rtc: nct3018y: Convert to .probe_new()
Date:   Fri, 21 Oct 2022 15:07:02 +0200
Message-Id: <20221021130706.178687-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
References: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=YlFLu5OUJw4NDw3in/0B6gsTCQDOpTOawwB9KDnQeoM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjUplnLP5HT/HvPmi8FNMq+QA1cYckR3YOYITd/r/H aB91hzSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY1KZZwAKCRDB/BR4rcrsCcrOB/ wNfKyV2OQjPzu0FRRw6mkJRB/cFGJfCwU3IaNjz0XxbZ+DCA9uvThjrs2winx8mLhnTZSz9W9u4JSd hEKJAqWJ1jT0jm24c/v8D60vmGJLeG9jEnblO8AR+lU9uT7U4iTbjd3CAZuxwDdzGcXr0d0zF1aiYX 0ObMPU/lv5OReUkf3UuDKldXY0ybhrW0ftxm3q5Dp5qklzySY24AwQeNGY757nvF4NbfVieOYbc8yn 9s95K2ESTquvtSJ6gq3v86QAbPkdRIZkWMQtH8OottzwlGYtCb36p4Ok/Ryp7Cn8UbbvrSuJXDLjLD F3zPCFW4fI1ubwN3t3QCG6x3h6uZSJ
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

The probe function doesn't make use of the i2c_device_id * parameter so it
can be trivially converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/rtc-nct3018y.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index d43acd3920ed..0a3b14c95d90 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -452,8 +452,7 @@ static const struct rtc_class_ops nct3018y_rtc_ops = {
 	.ioctl		= nct3018y_ioctl,
 };
 
-static int nct3018y_probe(struct i2c_client *client,
-			  const struct i2c_device_id *id)
+static int nct3018y_probe(struct i2c_client *client)
 {
 	struct nct3018y *nct3018y;
 	int err, flags;
@@ -541,7 +540,7 @@ static struct i2c_driver nct3018y_driver = {
 		.name	= "rtc-nct3018y",
 		.of_match_table = of_match_ptr(nct3018y_of_match),
 	},
-	.probe		= nct3018y_probe,
+	.probe_new	= nct3018y_probe,
 	.id_table	= nct3018y_id,
 };
 
-- 
2.37.2

