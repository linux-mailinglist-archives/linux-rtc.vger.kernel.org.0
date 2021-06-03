Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7854539A369
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Jun 2021 16:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbhFCOhm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Jun 2021 10:37:42 -0400
Received: from mail-qk1-f174.google.com ([209.85.222.174]:35758 "EHLO
        mail-qk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbhFCOhm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Jun 2021 10:37:42 -0400
Received: by mail-qk1-f174.google.com with SMTP id j189so6138873qkf.2
        for <linux-rtc@vger.kernel.org>; Thu, 03 Jun 2021 07:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lO4jbDVHtYLz0L0LV5uYf44ONhdCnMzplJaXys0sV/Y=;
        b=LPSVYHC4qrp+3ZEd0jD7A5HTX47WqKT3fBx1ibAT8nCvwMftWCdIRGeo+k3hl0YMRS
         z6UDTe5Alm+HHDVVJKJZyi0L/hNN3YI/dVxJlxLZuBiyaCyt+ZLkxrrBNJk2idwEhH19
         lBPwr70BT5cYtLw5z3yvb9dufcMfj+rV18xKV694YkugPlq5sYuSAmhPDxsfoMYfdG4t
         MZFNS3GX0PK/wTQa9yKT+YaQ/R4DJLj8uq3kFDT+UYlunXgqpRyorxW3i8htVZafWw81
         frIAzTZW3CElii6Dbz+MptZY3BLk+i0xz1yqjIPUdcqFv6Le+W9L5Zkfb9vLsqFb2p8r
         qCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lO4jbDVHtYLz0L0LV5uYf44ONhdCnMzplJaXys0sV/Y=;
        b=ADEkVrSO3qIAGQRo1QUPhseyfiY5vgCTrX2XJd3APha1erfd7pRhyjxPMCgxBU9Gc0
         KVQZfgnEc1CzRcoK8TayLvqaO/BP6jj8wcINSYHVc/w3t4xbwi/IQK5i49DBjbfdjKUX
         +Ij8KoGLlQ775RT9d5pSf58vxEX3g8Zc6qurmDuwmsBEpzO8AJQleRzc4rg/DpQ7VYZ3
         Xfj4ZaZz9JLmlhHB2txKIoBTz+iwFi/PTEcgQapaUUGffjHrMNDcnqdzyE1B9OvI2lVo
         k2nS15TiiWQYQ2WLysm5ItFou9IoFgfCYAx2qySGwGg2V6f6PVBLyoTJntABm/1+OGdG
         XZTQ==
X-Gm-Message-State: AOAM533pAbhxmL4ZfKEyZui8W7mYN8JIsnbTamjFFP/xjDvCJSrPUaEr
        0S2pjbaEmrcj5PBCQ4E6u3o=
X-Google-Smtp-Source: ABdhPJw0CJdlkbD5/LBSRUzkKeaHmbZwmyeAaALFICA7fKy6TG3AC5A1/y5gY3FS5lWag3COSbo/BQ==
X-Received: by 2002:ae9:d8c1:: with SMTP id u184mr12869588qkf.372.1622730897435;
        Thu, 03 Jun 2021 07:34:57 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:1fe8:47aa:9548:352c])
        by smtp.gmail.com with ESMTPSA id y17sm1742433qta.11.2021.06.03.07.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 07:34:56 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/3] rtc: pcf85063: Fix the datasheet URL
Date:   Thu,  3 Jun 2021 11:34:46 -0300
Message-Id: <20210603143447.2223353-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603143447.2223353-1-festevam@gmail.com>
References: <20210603143447.2223353-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The current datasheet URL is no longer valid.

Replace with a valid one.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/rtc/rtc-pcf85063.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 82becae14229..9a5297098d39 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -21,8 +21,8 @@
 /*
  * Information for this driver was pulled from the following datasheets.
  *
- *  https://www.nxp.com/documents/data_sheet/PCF85063A.pdf
- *  https://www.nxp.com/documents/data_sheet/PCF85063TP.pdf
+ *  https://www.nxp.com/docs/en/data-sheet/PCF85063A.pdf
+ *  https://www.nxp.com/docs/en/data-sheet/PCF85063TP.pdf
  *
  *  PCF85063A -- Rev. 6 — 18 November 2015
  *  PCF85063TP -- Rev. 4 — 6 May 2015
-- 
2.25.1

