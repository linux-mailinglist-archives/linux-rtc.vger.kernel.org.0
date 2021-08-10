Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5713F3E851F
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Aug 2021 23:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233962AbhHJVU4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 Aug 2021 17:20:56 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:54741 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233153AbhHJVUz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 10 Aug 2021 17:20:55 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 30431E0003;
        Tue, 10 Aug 2021 21:20:29 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] rtc: lib_test: add MODULE_LICENSE
Date:   Tue, 10 Aug 2021 23:20:06 +0200
Message-Id: <20210810212008.631359-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

As the documentation states, "The exact license information can only be
determined via the license information in the corresponding source files."
and the SPDX identifier has the proper information.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/lib_test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/lib_test.c b/drivers/rtc/lib_test.c
index 2124b67a2f43..d5caf36c56cd 100644
--- a/drivers/rtc/lib_test.c
+++ b/drivers/rtc/lib_test.c
@@ -77,3 +77,5 @@ static struct kunit_suite rtc_lib_test_suite = {
 };
 
 kunit_test_suite(rtc_lib_test_suite);
+
+MODULE_LICENSE("GPL");
-- 
2.31.1

