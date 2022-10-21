Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C23BC6077D5
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Oct 2022 15:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbiJUNIq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 21 Oct 2022 09:08:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbiJUNIh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 21 Oct 2022 09:08:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3158326C471
        for <linux-rtc@vger.kernel.org>; Fri, 21 Oct 2022 06:08:25 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk7-0001aB-7B; Fri, 21 Oct 2022 15:07:19 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk4-000Wm9-3w; Fri, 21 Oct 2022 15:07:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olrk5-009Z8u-Iu; Fri, 21 Oct 2022 15:07:17 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-rtc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 9/9] rtc: rx8025: Convert to .probe_new()
Date:   Fri, 21 Oct 2022 15:07:06 +0200
Message-Id: <20221021130706.178687-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
References: <20221021130706.178687-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=vzh2lu6eOjbYvK7D7ZWtxkqRPSwE59qZAraGtF33SbA=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjUpl0JvaJNgcKc4kBEapkjd1+w7LaSMXczcCXkR4s L5gjM92JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY1KZdAAKCRDB/BR4rcrsCayWCA CBiQ7kT0yZu1qnf2lgePiZuPc8xGgSRhaE3Wpx6lM9EfHV/Iw2at11oY+X9t7xQ4c/atLmnVS6jzUI +dx+qH78OFrEvsbfolCOS0dQ+Jxatrc0DAaaxhTszE6z+uD5NNoFumTq755kGCvZI3pYNJcxl11pdG MRXtqqKStTUbdMxyRJDKD00iIm/k0Xsv3cQUxmvFeIOw80wIhcRDzLEMlSuvvqxURqhmHl9fSU8aK5 P7TcAKhznGG6Tm3+ihsmHGHdgxJSzGPJyXp1nna+uUMhcvrrMWSL64wrUccswgq6jFCm+RWnR+u836 BYhOYksCtUnsclR8q+c45LjBPDL3aj
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

.probe_new() doesn't get the i2c_device_id * parameter, so determine
that explicitly in .probe().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/rtc-rx8025.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
index dde86f3e2a4b..77d3cb08b5ec 100644
--- a/drivers/rtc/rtc-rx8025.c
+++ b/drivers/rtc/rtc-rx8025.c
@@ -519,9 +519,9 @@ static const struct attribute_group rx8025_attr_group = {
 	.attrs	= rx8025_attrs,
 };
 
-static int rx8025_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
+static int rx8025_probe(struct i2c_client *client)
 {
+	const struct i2c_device_id *id = i2c_match_id(rx8025_id, client);
 	struct i2c_adapter *adapter = client->adapter;
 	struct rx8025_data *rx8025;
 	int err = 0;
@@ -580,7 +580,7 @@ static struct i2c_driver rx8025_driver = {
 	.driver = {
 		.name = "rtc-rx8025",
 	},
-	.probe		= rx8025_probe,
+	.probe_new	= rx8025_probe,
 	.id_table	= rx8025_id,
 };
 
-- 
2.37.2

