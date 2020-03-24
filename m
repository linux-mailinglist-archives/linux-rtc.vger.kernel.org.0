Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A27F190431
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Mar 2020 05:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbgCXEMO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 24 Mar 2020 00:12:14 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:33452 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725784AbgCXEMO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 24 Mar 2020 00:12:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585023133;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=ceHpHKXWTcYAP5TikjsX8J3gSNWdyTeLVLjL5RT2pa8=;
        b=P3/6W0voe1Chs8wYN5TcynvD3pCunH437qbTQXGmaTQ23tmoJkZkb3S2BQTWhfHstZzFGS
        F9uQgJJ7Ar5hGeApWHuI/XTmJgXXSm2SHX7g6irFIlNmRvagg4JxSxZTvKFQbm8nTMJrqb
        VsEMhWWJwSikC4aSiGv3gQYeXdBGH3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-ykSNBf7_MaqdVwsV_ZoW5g-1; Tue, 24 Mar 2020 00:12:07 -0400
X-MC-Unique: ykSNBf7_MaqdVwsV_ZoW5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28EB713F5;
        Tue, 24 Mar 2020 04:12:06 +0000 (UTC)
Received: from asgard.redhat.com (unknown [10.36.110.53])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A26C5C1B5;
        Tue, 24 Mar 2020 04:12:03 +0000 (UTC)
Date:   Tue, 24 Mar 2020 05:12:09 +0100
From:   Eugene Syromiatnikov <esyr@redhat.com>
To:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        "Dmitry V. Levin" <ldv@altlinux.org>
Subject: [PATCH] rtc: make definitions in include/uapi/linux/rtc.h actually
 useful for user space
Message-ID: <20200324041209.GA30727@asgard.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

BIT() macro is not defined in UAPI headers; there is, however, similarly
defined _BITUL() macro present in include/uapi/linux/const.h; use it
instead and include <linux/const.h> and <linux/ioctl.h> in order to make
the definitions provided in the header useful.

Fixes: 3431ca4837bf ("rtc: define RTC_VL_READ values")
Signed-off-by: Eugene Syromiatnikov <esyr@redhat.com>
---
 include/uapi/linux/rtc.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/rtc.h b/include/uapi/linux/rtc.h
index 095af36..83bba58 100644
--- a/include/uapi/linux/rtc.h
+++ b/include/uapi/linux/rtc.h
@@ -12,6 +12,9 @@
 #ifndef _UAPI_LINUX_RTC_H_
 #define _UAPI_LINUX_RTC_H_
 
+#include <linux/const.h>
+#include <linux/ioctl.h>
+
 /*
  * The struct used to pass data via the following ioctl. Similar to the
  * struct tm in <time.h>, but it needs to be here so that the kernel
@@ -92,10 +95,10 @@ struct rtc_pll_info {
 #define RTC_PLL_GET	_IOR('p', 0x11, struct rtc_pll_info)  /* Get PLL correction */
 #define RTC_PLL_SET	_IOW('p', 0x12, struct rtc_pll_info)  /* Set PLL correction */
 
-#define RTC_VL_DATA_INVALID	BIT(0) /* Voltage too low, RTC data is invalid */
-#define RTC_VL_BACKUP_LOW	BIT(1) /* Backup voltage is low */
-#define RTC_VL_BACKUP_EMPTY	BIT(2) /* Backup empty or not present */
-#define RTC_VL_ACCURACY_LOW	BIT(3) /* Voltage is low, RTC accuracy is reduced */
+#define RTC_VL_DATA_INVALID	_BITUL(0) /* Voltage too low, RTC data is invalid */
+#define RTC_VL_BACKUP_LOW	_BITUL(1) /* Backup voltage is low */
+#define RTC_VL_BACKUP_EMPTY	_BITUL(2) /* Backup empty or not present */
+#define RTC_VL_ACCURACY_LOW	_BITUL(3) /* Voltage is low, RTC accuracy is reduced */
 
 #define RTC_VL_READ	_IOR('p', 0x13, unsigned int)	/* Voltage low detection */
 #define RTC_VL_CLR	_IO('p', 0x14)		/* Clear voltage low information */
-- 
2.1.4

