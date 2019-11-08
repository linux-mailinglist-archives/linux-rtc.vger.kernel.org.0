Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92AABF3CCD
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Nov 2019 01:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbfKHAW4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 Nov 2019 19:22:56 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44948 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfKHAW4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 7 Nov 2019 19:22:56 -0500
Received: by mail-pg1-f196.google.com with SMTP id f19so2961674pgk.11
        for <linux-rtc@vger.kernel.org>; Thu, 07 Nov 2019 16:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jgcbVjBr6ZOoRFMjf3SNCSzfU/Ll8F/WsdfMaB0sq9k=;
        b=y99V++ibUZeu444uVMuo0XVQABA8Pw8T2HdqT5b65YJEga0II7jhLA5hxhF511qqCv
         6X6aBvaE16zve5OB1Cf0iHvaWkEBgTOyet47QZkizYaKwTlJCfMKFx99iBu/2mQIw7sN
         rrP3UK7PXDw+BDQ7+B14xygLfz/B+X9HEBLsWWqCDMe8nz0C3EhloN4UvMe67i2C+wi6
         6uPDvP4RH52TWxE6MEzjxpgSwON9U1gKYv7NdCOqni6J7d1RXdMmEq1di5TqG7JzSuLA
         W3Ec5AXeQ4qqzbbuiNwHHSsAj+8XMF7rppffO2tDyc/gyuFo+em3z0wR4nGY7aIDLtjA
         WgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jgcbVjBr6ZOoRFMjf3SNCSzfU/Ll8F/WsdfMaB0sq9k=;
        b=bQ7RRlU6kgv266aiI6REFZVqFGD4X8UkeX5UO+/PbaJZa6Wl/cYZvoFVpwMHNRP89Q
         qnDDud64nFtx0If7iGdlCeP/kCq36lN3jLMf/CouoPMKDGjVQCZXMysJA7/otLhaKkx0
         tD5paRw12zEcZpdMmjR7muTdeFUZO3k73D6Q6ESNK1qMpVuXXyj6GqAz6rlEmMJdRsgq
         7z3Z0WI7zvcvgsCRSuXc51sTVi9eHPgw3u5L9CgUPcGWxe9Cb/J2RQXy4MEYR0T6VTTH
         +QXbL7AByHO4owUAT86VHVujfb/VJmBVcmnMJiCNm57QU3qY77nmuzDz73oBwK4OZkHN
         JvDw==
X-Gm-Message-State: APjAAAV3/NpRCqE83Jv6mS7cLwOaRN1PSOGCM2DZ9IB+PCj9BupgoaAz
        WMIxZy+FQkg4o2cR7B6CP50hxzmm4A==
X-Google-Smtp-Source: APXvYqx9PJrIiiNllzHjpF1HUu+keBjGV8FJkGzwAlzDNSp9+qkh9tnDbkCLhtluHOEE4SEzolhyoA==
X-Received: by 2002:a63:cf46:: with SMTP id b6mr8168524pgj.90.1573172574599;
        Thu, 07 Nov 2019 16:22:54 -0800 (PST)
Received: from localhost (b152239.dynamic.ppp.asahi-net.or.jp. [202.213.152.239])
        by smtp.gmail.com with ESMTPSA id r33sm3333509pjb.5.2019.11.07.16.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 16:22:53 -0800 (PST)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, val.krutov@erd.epson.com,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] rtc: rx6110: Convert to SPDX identifier
Date:   Fri,  8 Nov 2019 09:22:50 +0900
Message-Id: <20191108002250.14937-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use SPDX-License-Identifier instead of a verbose license text.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/rtc-rx6110.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c
index 4586bf6003ca..3a9eb7043f01 100644
--- a/drivers/rtc/rtc-rx6110.c
+++ b/drivers/rtc/rtc-rx6110.c
@@ -1,17 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Driver for the Epson RTC module RX-6110 SA
  *
  * Copyright(C) 2015 Pengutronix, Steffen Trumtrar <kernel@pengutronix.de>
  * Copyright(C) SEIKO EPSON CORPORATION 2013. All rights reserved.
- *
- * This driver software is distributed as is, without any warranty of any kind,
- * either express or implied as further specified in the GNU Public License.
- * This software may be used and distributed according to the terms of the GNU
- * Public License, version 2 as published by the Free Software Foundation.
- * See the file COPYING in the main directory of this archive for more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <linux/bcd.h>
-- 
2.24.0.rc1

