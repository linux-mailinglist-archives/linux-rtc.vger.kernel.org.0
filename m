Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 362802A8977
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Nov 2020 23:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732740AbgKEWB3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Nov 2020 17:01:29 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52916 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732414AbgKEWB3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Nov 2020 17:01:29 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 318751F465DE
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: [PATCH] rtc: hym8563: enable wakeup by default
Date:   Thu,  5 Nov 2020 22:01:10 +0000
Message-Id: <4a52fe66b327fd1974f86b7deb7e2c06d74fe64f.1604613067.git.guillaume.tucker@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Enable wakeup by default in the hym8563 driver to match the behaviour
implemented by the majority of RTC drivers.  As per the description of
device_init_wakeup(), it should be enabled for "devices that everyone
expects to be wakeup sources".  One would expect this to be the case
with a real-time clock.

Fixes: dcaf03849352 ("rtc: add hym8563 rtc-driver")
Reported-by: kernelci.org bot <bot@kernelci.org>
Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
---
 drivers/rtc/rtc-hym8563.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-hym8563.c b/drivers/rtc/rtc-hym8563.c
index 0fb79c4afb46..6fccfe634d57 100644
--- a/drivers/rtc/rtc-hym8563.c
+++ b/drivers/rtc/rtc-hym8563.c
@@ -527,7 +527,7 @@ static int hym8563_probe(struct i2c_client *client,
 	hym8563->client = client;
 	i2c_set_clientdata(client, hym8563);
 
-	device_set_wakeup_capable(&client->dev, true);
+	device_init_wakeup(&client->dev, true);
 
 	ret = hym8563_init_device(client);
 	if (ret) {
-- 
2.20.1

