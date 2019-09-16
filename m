Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66032B6CF1
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Sep 2019 21:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730199AbfIRTvN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 18 Sep 2019 15:51:13 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:56129 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729968AbfIRTvN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 18 Sep 2019 15:51:13 -0400
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4DF27240003
        for <linux-rtc@vger.kernel.org>; Wed, 18 Sep 2019 19:51:11 +0000 (UTC)
Received: from spool.mail.gandi.net (spool3.mail.gandi.net [217.70.178.212])
        by nmboxes159.sd4.0x35.net (Postfix) with ESMTP id D23BB41928
        for <alexandre.belloni@bootlin.com>; Mon, 16 Sep 2019 18:12:48 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
        by spool.mail.gandi.net (Postfix) with ESMTPS id 7C057AC0A3E
        for <alexandre.belloni@bootlin.com>; Mon, 16 Sep 2019 18:12:48 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id n197so1190689iod.9
        for <alexandre.belloni@bootlin.com>; Mon, 16 Sep 2019 11:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N+PGY/OYnqAAb1/FHqUnx7n0Mo3lWfpgw5A8ZrHtWr4=;
        b=nmAL6ZHFAGaEG+Ah6SB9aapmquoRG60kXOcXblBjrlnFg0WHJWsswPgndye8cwHWGD
         6xi6NFHjRPyMUkJ7Dsm0S8fx1h3MT8sP0Ik4Ja3vATA6JxDojlnNSUFp7k1HBDREZdvN
         2LaKaZb9kLcXlfukzQpwUYxvWar/qBQ3azbSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N+PGY/OYnqAAb1/FHqUnx7n0Mo3lWfpgw5A8ZrHtWr4=;
        b=Jbr0DXCJYPyC0mYUlKFByX7JD+53kQRYuLQE4qpWBsXifMiNXqQX9Spcx6b57EVLPT
         8pn0zkOQ7zhQWnkR3WnI9mEqeqiKIIvzxjiTAbBxvDr42qYr+bi6Tec7FlkksjY5QHYM
         A/repW+mTjxHA7Mk5LfsyBX37Y/NsWJz31JU75xY6XRgGGp+NDat9gCeeUhNzYDZOL2/
         U4Y3YSTbU8rPgExoj1mTpVpGt2QfMB4Sgtead92ySPSP9+0+eRY34wZuW8oWR7BwiSJo
         Uw5R+kI0pyPDIc35TcYZ39S8UOIlB7pzLLbevAmabtvdS4uBFqqntwv7nWtHxTMeCQ9I
         BJCw==
X-Gm-Message-State: APjAAAUiBAHoCHsrH0M+Sc2O2EhLuBMQPSEdMoaYTARJU7ZVv41+bU+o
        z4Cgl+CqdG0hyjWQ1+XkaXFyxg==
X-Google-Smtp-Source: APXvYqyM5rJURp2zNjktmEjiyFqnor/SDwNY3MqemTBs1O2L7/odDz3Z01cIpfiSr73Z8w1kvVLoAg==
X-Received: by 2002:a02:80d:: with SMTP id 13mr1383668jac.50.1568657567299;
        Mon, 16 Sep 2019 11:12:47 -0700 (PDT)
Received: from ncrews2.bld.corp.google.com ([2620:15c:183:200:cb43:2cd4:65f5:5c84])
        by smtp.gmail.com with ESMTPSA id t9sm10889188iop.86.2019.09.16.11.12.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 16 Sep 2019 11:12:46 -0700 (PDT)
From:   Nick Crews <ncrews@chromium.org>
To:     bleung@chromium.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     enric.balletbo@collabora.com, linux-kernel@vger.kernel.org,
        dlaurie@chromium.org, Nick Crews <ncrews@chromium.org>
Subject: [PATCH v2 1/2] rtc: wilco-ec: Remove yday and wday calculations
Date:   Mon, 16 Sep 2019 12:12:15 -0600
Message-Id: <20190916181215.501-1-ncrews@chromium.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass (spool3: domain of chromium.org designates 209.85.166.67 as permitted sender) client-ip=209.85.166.67; envelope-from=ncrews@chromium.org; helo=mail-io1-f67.google.com;
X-TUID: G5GUT2l6eAB4
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The tm_yday and tm_wday fields are not used by userspace,
so since they aren't needed within the driver, don't
bother calculating them. This is especially needed since
the rtc_year_days() call was crashing if the HW returned
an invalid time.

Signed-off-by: Nick Crews <ncrews@chromium.org>
---
 drivers/rtc/rtc-wilco-ec.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/rtc/rtc-wilco-ec.c b/drivers/rtc/rtc-wilco-ec.c
index 8ad4c4e6d557..e84faa268caf 100644
--- a/drivers/rtc/rtc-wilco-ec.c
+++ b/drivers/rtc/rtc-wilco-ec.c
@@ -110,10 +110,6 @@ static int wilco_ec_rtc_read(struct device *dev, struct rtc_time *tm)
 	tm->tm_mday	= rtc.day;
 	tm->tm_mon	= rtc.month - 1;
 	tm->tm_year	= rtc.year + (rtc.century * 100) - 1900;
-	tm->tm_yday	= rtc_year_days(tm->tm_mday, tm->tm_mon, tm->tm_year);
-
-	/* Don't compute day of week, we don't need it. */
-	tm->tm_wday = -1;
 
 	return 0;
 }
-- 
2.21.0

