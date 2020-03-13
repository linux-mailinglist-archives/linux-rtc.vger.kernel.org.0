Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 994F2184103
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2020 07:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgCMGqL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 13 Mar 2020 02:46:11 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:55976 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726364AbgCMGqK (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 13 Mar 2020 02:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=3Bz2vR2Tg5c+O+QNTGdqbIUhPXuM0m6WC7tdqcFYb6M=; b=ALqDg+ayCRBaYNP9MkESeD7VsK
        ZNrAE2fQJs3bFQnQ7+xjEqHhy/mVgJxS65akxejk4v6M4Cja0Ny8txbp1xSbVdi3cnT7ODLNVq8MQ
        6a+a8O6AyWkREURrW4kLsLNEugEGQeFoxAcB/mXsnoqu3Q9DL0k9Sg48kAw8RoFADKNw=;
Received: from p200300ccff096400e2cec3fffe93fc31.dip0.t-ipconnect.de ([2003:cc:ff09:6400:e2ce:c3ff:fe93:fc31] helo=eeepc)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1jCe4w-0002pn-Im; Fri, 13 Mar 2020 07:45:55 +0100
Received: from andi by eeepc with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1jCe4w-0008DB-2U; Fri, 13 Mar 2020 07:45:54 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, stefan@agner.ch, b.galvani@gmail.com,
        phh@phh.me, letux-kernel@openphoenux.org, knaack.h@gmx.de,
        lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org,
        jic23@kernel.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH RESEND v6 7/7] mfd: rn5t618: cleanup i2c_device_id
Date:   Fri, 13 Mar 2020 07:45:34 +0100
Message-Id: <20200313064535.31503-8-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200313064535.31503-1-andreas@kemnade.info>
References: <20200313064535.31503-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

That list was just empty, so it can be removed if .probe_new
instead of .probe is used

Suggested-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Functional independent from the other patches, but since they are
touching similar areas, commit/merge conflicts would occur.
 drivers/mfd/rn5t618.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
index 321836f78120..b8033e2d650f 100644
--- a/drivers/mfd/rn5t618.c
+++ b/drivers/mfd/rn5t618.c
@@ -153,8 +153,7 @@ static const struct of_device_id rn5t618_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rn5t618_of_match);
 
-static int rn5t618_i2c_probe(struct i2c_client *i2c,
-			     const struct i2c_device_id *id)
+static int rn5t618_i2c_probe(struct i2c_client *i2c)
 {
 	const struct of_device_id *of_id;
 	struct rn5t618 *priv;
@@ -256,11 +255,6 @@ static int __maybe_unused rn5t618_i2c_resume(struct device *dev)
 	return 0;
 }
 
-static const struct i2c_device_id rn5t618_i2c_id[] = {
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, rn5t618_i2c_id);
-
 static SIMPLE_DEV_PM_OPS(rn5t618_i2c_dev_pm_ops,
 			rn5t618_i2c_suspend,
 			rn5t618_i2c_resume);
@@ -271,9 +265,8 @@ static struct i2c_driver rn5t618_i2c_driver = {
 		.of_match_table = of_match_ptr(rn5t618_of_match),
 		.pm = &rn5t618_i2c_dev_pm_ops,
 	},
-	.probe = rn5t618_i2c_probe,
+	.probe_new = rn5t618_i2c_probe,
 	.remove = rn5t618_i2c_remove,
-	.id_table = rn5t618_i2c_id,
 };
 
 module_i2c_driver(rn5t618_i2c_driver);
-- 
2.20.1

