Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6741F497179
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Jan 2022 13:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236294AbiAWM11 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 23 Jan 2022 07:27:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231757AbiAWM11 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 23 Jan 2022 07:27:27 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60660C06173B
        for <linux-rtc@vger.kernel.org>; Sun, 23 Jan 2022 04:27:27 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id y23so2662094oia.13
        for <linux-rtc@vger.kernel.org>; Sun, 23 Jan 2022 04:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=50v8pjEhatQHt9P+NZfVUhHjvV8pzS5wtiEbS0lj0gI=;
        b=cdJKB45NK6MAx1U1pvKJdrv+TkBtPBcliQoR3Y8Lw10Dwvr7SmGDkpzzP59xK2mDDD
         Uz14DFRNvIXAcjLxHjHVy3W8O7lqnyKlXNbCuUohfrV1OX6VpJyP9iKf6//qEqHGLiow
         wvi269PEShUo0DOsPf36EaxVsfuadTCb7GymHMl3vQTDFdMIPmVuEwggVOCW1yFdcwMy
         cH6FHlWhCjzdQ4E3j7T6WtpJonzmUNMQ57eD5fuwxb5oP+jxGrbrCil3QfLQjrDPPvyy
         9kWTdaj+2st2hv31j62ZtmFJCKW0FEfpLMH3WQhBm3s/q7VhnBxNMDm3CrhmiYbJQZGF
         dg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=50v8pjEhatQHt9P+NZfVUhHjvV8pzS5wtiEbS0lj0gI=;
        b=Fu02ScoPLFDxbaq8m24LFiWKcRix/w/ANJzPufBH9l1a4OZsXDWtydUFIMjCzI2PkZ
         ONiQO66qdOQsbSBNy23LnNe2RPWUVGW+OisPsQ2cn1WYA3qdWFAFTVAtFdfEh9Cf9eVn
         BNjWT2WjTCFoWQDWVXOz5TD370msgJ97WSIrGBn5X+YrjASPwnu6Xsi3chy3arLfPv7F
         tIXv3big9IV/gp1MCDd3Khj7PI8WTiiP4K3rgAWETc5jEFYM0qegpeQ6J7yri9uu39Mq
         c0X0k96QetEpEJPaoBegnmbTbwKpSQmFBGkPeaoepalj5NaIwY5AqxG2TM0BQfezs07c
         2IBA==
X-Gm-Message-State: AOAM533iSnPTw0r1MMjP5XQCXUNPVmq0TZyYrNlZ/+KB6vbynhQr04ju
        mmennvQet2VFG4Bpyd1JFg4oJwZilqI=
X-Google-Smtp-Source: ABdhPJwFKBpuT1bufmrrCM/5MwhW2satS48Wsl6GZV32pKgdEYBB32cBrEt/cwFEVdIxdDID67LCnw==
X-Received: by 2002:aca:1207:: with SMTP id 7mr1742176ois.131.1642940846711;
        Sun, 23 Jan 2022 04:27:26 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4b69:d01d:3b01:c62d:9ff4])
        by smtp.gmail.com with ESMTPSA id 124sm3635723oif.7.2022.01.23.04.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 04:27:26 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: [PATCH rtc-tools] rtc-tools: Add a Makefile
Date:   Sun, 23 Jan 2022 09:27:15 -0300
Message-Id: <20220123122715.1300049-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

Add a Makefile to make installation and uninstallation
process easier.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Makefile | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Makefile

diff --git a/Makefile b/Makefile
new file mode 100644
index 000000000000..4f244d9289f1
--- /dev/null
+++ b/Makefile
@@ -0,0 +1,29 @@
+prefix ?= /usr
+bindir ?= $(prefix)/bin
+
+EXEC = rtc-range rtc rtc-sync
+
+all: $(EXEC)
+
+rtc-range: rtc-range.c
+	$(CC) $(CFLAGS) -o $@ rtc-range.c
+
+rtc: rtc.c
+	$(CC) $(CFLAGS) -o $@ rtc.c
+
+rtc-sync: rtc-sync.c
+	$(CC) $(CFLAGS) -o $@ rtc-sync.c
+
+clean:
+	rm -f $(EXEC)
+
+install: rtc-range rtc rtc-sync
+	mkdir -p '$(DESTDIR)$(bindir)'
+	install -m755 rtc-range '$(DESTDIR)$(bindir)/rtc-range'
+	install -m755 rtc '$(DESTDIR)$(bindir)/rtc'
+	install -m755 rtc-sync '$(DESTDIR)$(bindir)/rtc-sync'
+
+uninstall:
+	rm -rf '$(DESTDIR)$(bindir)/rtc-range'
+	rm -rf '$(DESTDIR)$(bindir)/rtc'
+	rm -rf '$(DESTDIR)$(bindir)/rtc-sync'
-- 
2.25.1

