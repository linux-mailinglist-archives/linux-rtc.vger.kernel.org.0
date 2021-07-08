Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 680843BF4FF
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jul 2021 07:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbhGHFQn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 8 Jul 2021 01:16:43 -0400
Received: from mo-csw1515.securemx.jp ([210.130.202.154]:47396 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbhGHFQn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 8 Jul 2021 01:16:43 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 1685DlYS007099; Thu, 8 Jul 2021 14:13:47 +0900
X-Iguazu-Qid: 34tKswcYEzKttOkelF
X-Iguazu-QSIG: v=2; s=0; t=1625721227; q=34tKswcYEzKttOkelF; m=WyOgaDs+KTqUJ5peql9okxoX5dZt9sAoHRQUuVS0+8g=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
        by relay.securemx.jp (mx-mr1511) id 1685Di8F039582
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 8 Jul 2021 14:13:45 +0900
Received: from enc02.toshiba.co.jp (enc02.toshiba.co.jp [61.202.160.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx12-a.toshiba.co.jp (Postfix) with ESMTPS id 2DC00100139;
        Thu,  8 Jul 2021 14:13:44 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 1685Dhbs004157;
        Thu, 8 Jul 2021 14:13:43 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [PATCH] rtc: at91sam9: Remove unnecessary offset variable checks
Date:   Thu,  8 Jul 2021 14:13:40 +0900
X-TSB-HOP: ON
Message-Id: <20210708051340.341345-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The offset variable is checked by at91_rtc_readalarm(), but this check
is unnecessary because the previous check knew that the value of this
variable was not 0.
This removes that unnecessary offset variable checks.

Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 drivers/rtc/rtc-at91sam9.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
index 2216be429ab727..b7b5ea1a4e6726 100644
--- a/drivers/rtc/rtc-at91sam9.c
+++ b/drivers/rtc/rtc-at91sam9.c
@@ -184,7 +184,7 @@ static int at91_rtc_readalarm(struct device *dev, struct rtc_wkalrm *alrm)
 		return -EILSEQ;
 
 	memset(alrm, 0, sizeof(*alrm));
-	if (alarm != ALARM_DISABLED && offset != 0) {
+	if (alarm != ALARM_DISABLED) {
 		rtc_time64_to_tm(offset + alarm, tm);
 
 		dev_dbg(dev, "%s: %ptR\n", __func__, tm);
-- 
2.31.1

