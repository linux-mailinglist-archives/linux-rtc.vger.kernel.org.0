Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49CA4467DBA
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Dec 2021 20:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243267AbhLCTHS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 3 Dec 2021 14:07:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238521AbhLCTHS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 3 Dec 2021 14:07:18 -0500
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5BCC061751
        for <linux-rtc@vger.kernel.org>; Fri,  3 Dec 2021 11:03:53 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id u16so3691496qvk.4
        for <linux-rtc@vger.kernel.org>; Fri, 03 Dec 2021 11:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f61nLimCDckOblTJ9r9fLUlPorJzaVORdPgqawnTNbc=;
        b=oJ8rsnlyqOIO93sBXQuW5IhQEAPbAy3cW9mpDHdYXVBMazuZ0KPuA33if8lcNZT/t6
         ZVXKcVrBuTT8yOTdw0RvpmH76+Tjw2UDJCfkUxPRSOh/iqGX+DaXci2vb/HIIQFVFdFZ
         MQGBEcoMEJavIfXCmgCv2t6K+zdOJqzQh12RCQlDKvPeOFzHs1GUKT3Ji54zWU4Df0AL
         wfGkmReNks5mR7bJYVviwWO8fXZgjm/P/vBZI0K1FpfDjPDjRxPct63uGOv6OLNb/S1C
         HuqJRlzjJGI20EdQanfffUAM4j9UrpUcmX1hNJDMyBw91mUzEUJbZmGqqRr8KngtO9WX
         BJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f61nLimCDckOblTJ9r9fLUlPorJzaVORdPgqawnTNbc=;
        b=EYdKb57ija4yDRAkWhpmxyfKvyAbxNM2ek7FL6TywYSFOfpFPLKcZ9Invr1KQn2tRg
         6u9cQSZ5UTSP8+USNnueD3cRPTIP3a/ef9rhlRPeVL1ru1/GFbLzrDseViWsrJWzWzcO
         R3k2qbMtj+8OrsLCplhyLj9vIrIyf0wdE6+hZDQlvGsS3vxBxEthZe0HZ6yAmenBJzSm
         FImJ5MYsASXZPtBwRcvUVe5CkEKz0IUbxJUO0W81vwDFHp/8dFSitHFQkL3P4UlYSs5O
         bkyLn27UGoiD3s5ymfU4vPZegmoosnQ9LZ5j0+lq/MlKcR36e0/3V6iObbCI/tNBHZGb
         udEw==
X-Gm-Message-State: AOAM53205T5vArpoSBKmaJYTa7KvwjcPu3hAtsSPdvcO34bKEuQOYPxN
        nyhB57mmzFkfDUH4U91JlS3fahtQhec=
X-Google-Smtp-Source: ABdhPJyUeY3272YNBYdYgJIuvoSBp+z+bc84gNfZ2TMq7AvXdSnjZzsFeal4iJmZV96o1m2ZUpB1aw==
X-Received: by 2002:a05:6214:20ab:: with SMTP id 11mr21432955qvd.31.1638558232887;
        Fri, 03 Dec 2021 11:03:52 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:c13b:e2c6:9abc:ace5])
        by smtp.gmail.com with ESMTPSA id y6sm2724924qtn.23.2021.12.03.11.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 11:03:52 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH rtc-tools] .gitignore: Add an entry for rtc-range
Date:   Fri,  3 Dec 2021 16:03:24 -0300
Message-Id: <20211203190324.1514671-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The rtc-range binary should also be ignored by git.

Add an entry for it. 

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 61ff6a3bcc90..65c1e115ba30 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,2 +1,3 @@
 rtc
+rtc-range
 rtc-sync
-- 
2.25.1

