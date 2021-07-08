Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 050BF3BF4FE
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jul 2021 07:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhGHFQO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 8 Jul 2021 01:16:14 -0400
Received: from mo-csw1115.securemx.jp ([210.130.202.157]:54192 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbhGHFQO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 8 Jul 2021 01:16:14 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 1685DAo4001563; Thu, 8 Jul 2021 14:13:11 +0900
X-Iguazu-Qid: 2wGrNQa8eydpfY1mOx
X-Iguazu-QSIG: v=2; s=0; t=1625721190; q=2wGrNQa8eydpfY1mOx; m=kxmPnZMPR5n4bLIPn4fKjTMjm4QR7GL5MYqF2vOQ+9k=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
        by relay.securemx.jp (mx-mr1112) id 1685D9hj003880
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 8 Jul 2021 14:13:09 +0900
Received: from enc02.toshiba.co.jp (enc02.toshiba.co.jp [61.202.160.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx12-a.toshiba.co.jp (Postfix) with ESMTPS id D8953100107;
        Thu,  8 Jul 2021 14:13:08 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 1685D8u3003630;
        Thu, 8 Jul 2021 14:13:08 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH] rtc: s5m: Check return value of s5m_check_peding_alarm_interrupt()
Date:   Thu,  8 Jul 2021 14:13:04 +0900
X-TSB-HOP: ON
Message-Id: <20210708051304.341278-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

s5m_check_peding_alarm_interrupt() in s5m_rtc_read_alarm() gets the return
value, but doesn't use it.
This modifies using the s5m_check_peding_alarm_interrupt()"s return value
as the s5m_rtc_read_alarm()'s return value.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 drivers/rtc/rtc-s5m.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 038269a6b08c55..6b56f8eacba6fa 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -488,9 +488,7 @@ static int s5m_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 
 	dev_dbg(dev, "%s: %ptR(%d)\n", __func__, &alrm->time, alrm->time.tm_wday);
 
-	ret = s5m_check_peding_alarm_interrupt(info, alrm);
-
-	return 0;
+	return s5m_check_peding_alarm_interrupt(info, alrm);
 }
 
 static int s5m_rtc_stop_alarm(struct s5m_rtc_info *info)
-- 
2.31.1

