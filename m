Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D96827C64
	for <lists+linux-rtc@lfdr.de>; Thu, 23 May 2019 14:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729762AbfEWMDH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 23 May 2019 08:03:07 -0400
Received: from mail1.skidata.com ([91.230.2.99]:1649 "EHLO mail1.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729361AbfEWMDH (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 23 May 2019 08:03:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1558613008; x=1590149008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BsXCeB/+8nXIFLIExpSSR1992V0/zCsuaE0B3Mxz00A=;
  b=X3xQbIsaSxINQ42kztWvA6cf3uhrCGiTsGXRauPJxn6LOx4fCsALWQBC
   xkGsFSu8qsnTLAH6UDyBNZnNw02x1VgcoyKNOs+GDup65UCpzy4OMf/Xh
   Vc8dK9Yy66qgWSoW9WBUqg44voAUqC8eUa81BjvvS5ubNwTzb80iJxQBP
   PIo/5LXmaVkOwQnkd5ovxBsR5R7ADWFmWGT8KMkwdGPlxUnT3SJYBIc9m
   hUE7Ds9/gH3dYe98HFMu7xN3G4Ge/YEEMiNns/1sV0/daZFp8ufYhUEc9
   UVvmbsyYJfXQru+fGBMw4r3tOztmlJSg+WuqlUKQkNe0vLNFbf+EA4Lqj
   A==;
IronPort-SDR: jVvamI5YPUJ4BjtZ/ivwpnxyAiIhKCF3881WsvJZLF24nG9EnfsT6GfkTlOM6+nZ5nbYb6ym12
 nkofNIKS17YNeCrKgWisFiwhWlUTb5saw15vpgAmbRmTjH219w1shKRitrtW10kcz08AMNUnvL
 hst+rY3aCgK88lhbMKXaOlAWelRMy91HXXieZ9PQW7jjjL/oBxS4lJ3irnWLrjGOh1YGYQnkDM
 eGf+lCCY6f/p9D1xdrkno4E0DOxiyRtKNmE/uR60qr3jKLQ3jOk/cnOUwlhh2aNwRlgZcC7M2R
 3fg=
X-IronPort-AV: E=Sophos;i="5.60,502,1549926000"; 
   d="scan'208";a="17248281"
From:   Richard Leitner <richard.leitner@skidata.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC:     <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH v2 4/4] rtc: s35390a: change FLAG defines to use BIT macro
Date:   Thu, 23 May 2019 13:54:51 +0200
Message-ID: <20190523115451.20007-5-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523115451.20007-1-richard.leitner@skidata.com>
References: <20190523115451.20007-1-richard.leitner@skidata.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
 sdex5srv.skidata.net (192.168.111.83)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

To be consistent change the S35390A_FLAG defines to use the BIT
macro (like the S35390A_INT2_MODE defines).

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 drivers/rtc/rtc-s35390a.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index 7293dcdea692..b18ce5610a94 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -36,14 +36,14 @@
 #define S35390A_ALRM_BYTE_MINS	2
 
 /* flags for STATUS1 */
-#define S35390A_FLAG_POC	0x01
-#define S35390A_FLAG_BLD	0x02
-#define S35390A_FLAG_INT2	0x04
-#define S35390A_FLAG_24H	0x40
-#define S35390A_FLAG_RESET	0x80
+#define S35390A_FLAG_POC	BIT(0)
+#define S35390A_FLAG_BLD	BIT(1)
+#define S35390A_FLAG_INT2	BIT(2)
+#define S35390A_FLAG_24H	BIT(6)
+#define S35390A_FLAG_RESET	BIT(7)
 
 /* flag for STATUS2 */
-#define S35390A_FLAG_TEST	0x01
+#define S35390A_FLAG_TEST	BIT(0)
 
 /* INT2 pin output mode */
 #define S35390A_INT2_MODE_MASK		0x0E
-- 
2.20.1

