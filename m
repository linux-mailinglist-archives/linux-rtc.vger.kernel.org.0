Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC2749EE59
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Jan 2022 23:59:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235247AbiA0W7l (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 27 Jan 2022 17:59:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbiA0W7k (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 27 Jan 2022 17:59:40 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CADEC061714
        for <linux-rtc@vger.kernel.org>; Thu, 27 Jan 2022 14:59:38 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id m9so8850744oia.12
        for <linux-rtc@vger.kernel.org>; Thu, 27 Jan 2022 14:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZvBsQ7e/qMjeQrj5WtuDqiGDxf9x6Gltlxltqnmg/y8=;
        b=eazseXgn/aObU0Q2Lba/1Un67OhCh3S9HdvpLp4zjoieKF53Roa1tZYq41hYzsWZ+Z
         5ProxY1eQOL5PendzHZEFplXwGFNEFzdcLp64qLet3IBq/JdKn7ddiZqHXG0qA3Ff+Pp
         /GmYuzG4LGYsOSlV1LTUy59ZGXfOXgL7CeUJUHh5TY/Jp5rpoyt+KxIZsmN4KHjpszvD
         z5UchfS8pclByep6t/oP+xklMIneePXmNI5RNPwSRtK4tAq7frRuMwcTe8qKlffCkTpO
         Tpa09xNUbzmBtdf+ltlSy52Z4jSX0Ek6Zb2cCfumIdNqMIGobC2/YhEAcM6iIZm+ilv5
         8UfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZvBsQ7e/qMjeQrj5WtuDqiGDxf9x6Gltlxltqnmg/y8=;
        b=H67i3sA7XKIWFC7/FfuKlrWMOT8iA1JF+jQ+h3swIiofYfBSIqPba/HnGrdytODtKI
         HnovDbcGzn2rWnhYggRMYmPHQxgGqFG1iJaIxpI+HGWFOmKLXvr/RudY0t6ldggJaVlw
         8qWglnklB5qctCep/ncz3qhWs1Lg8Ciqh+BClQZWeJTRX8Nxs/jWaclu+xe3AkC0rzn4
         x0uB0CLp5I+fsW1FCYnMvI8BAO425h/Gxb+vLMocpAgJW0/vhj9NcyIDjNtS19ev9Nbf
         tXFiapxaRWMTgQSzSvgU0e6AxpwXpE5RZN/GbCM14LsJ7GLEPeR15GtsSI92BwW8pqsY
         7XXQ==
X-Gm-Message-State: AOAM533PL0RELmaSCySp2K5h6f4E3P7CJrCSqgn4WP8Bw/5XYnYwBeDa
        ElbtzpG1+zC4Hoh91M4073o=
X-Google-Smtp-Source: ABdhPJy4dkFwLuF8tvnp1fljlUWIjxQDkAU7uaXQAAH1Px+VcbFPaV6KyKn8hmPanBHSCRWzdNIlBw==
X-Received: by 2002:a05:6808:13cb:: with SMTP id d11mr4013274oiw.25.1643324377872;
        Thu, 27 Jan 2022 14:59:37 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4b69:95a2:6da9:5705:29a2])
        by smtp.gmail.com with ESMTPSA id z17sm6799020otk.62.2022.01.27.14.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 14:59:37 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     alexandre.belloni@bootlin.com
Cc:     peter.kjellerstedt@axis.com, linux-rtc@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH rtc-tools v2] rtc-tools: Add a Makefile
Date:   Thu, 27 Jan 2022 19:59:28 -0300
Message-Id: <20220127225928.34214-1-festevam@gmail.com>
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
Changes since v1:
- Simplify the Makefile by taking Peter Kjellerstedt's feedback in
the oe-devel list.

 Makefile | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Makefile

diff --git a/Makefile b/Makefile
new file mode 100644
index 0000000..71a4c9c
--- /dev/null
+++ b/Makefile
@@ -0,0 +1,16 @@
+prefix ?= /usr
+bindir ?= $(prefix)/bin
+
+EXEC = rtc-range rtc rtc-sync
+
+all: $(EXEC)
+
+clean:
+	$(RM) $(EXEC)
+
+install:
+	install -d $(DESTDIR)$(bindir)
+	install $(EXEC) $(DESTDIR)$(bindir)
+
+uninstall:
+	$(RM) -r $(addprefix $(DESTDIR)$(bindir)/,$(EXEC))
-- 
2.25.1

